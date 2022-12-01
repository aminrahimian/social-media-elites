import itertools
import math

import networkx as nx
from networkx.utils import py_random_state

__all__ = [
    "caveman_graph",
    "connected_caveman_graph",
    "relaxed_caveman_graph",
    "random_partition_graph",
    "planted_partition_graph",
    "gaussian_random_partition_graph",
    "ring_of_cliques",
    "windmill_graph",
    "stochastic_block_model",
    "LFR_benchmark_graph",
]

@py_random_state(3)
def stochastic_block_model(
    sizes, p, nodelist=None, seed=None, directed=False, selfloops=False, sparse=True
):
    """Returns a stochastic block model graph.

    This model partitions the nodes in blocks of arbitrary sizes, and places
    edges between pairs of nodes independently, with a probability that depends
    on the blocks.

    Parameters
    ----------
    sizes : list of ints
        Sizes of blocks
    p : list of list of floats
        Element (r,s) gives the density of edges going from the nodes
        of group r to nodes of group s.
        p must match the number of groups (len(sizes) == len(p)),
        and it must be symmetric if the graph is undirected.
    nodelist : list, optional
        The block tags are assigned according to the node identifiers
        in nodelist. If nodelist is None, then the ordering is the
        range [0,sum(sizes)-1].
    seed : integer, random_state, or None (default)
        Indicator of random number generation state.
        See :ref:`Randomness<randomness>`.
    directed : boolean optional, default=False
        Whether to create a directed graph or not.
    selfloops : boolean optional, default=False
        Whether to include self-loops or not.
    sparse: boolean optional, default=True
        Use the sparse heuristic to speed up the generator.

    Returns
    -------
    g : NetworkX Graph or DiGraph
        Stochastic block model graph of size sum(sizes)

    Raises
    ------
    NetworkXError
      If probabilities are not in [0,1].
      If the probability matrix is not square (directed case).
      If the probability matrix is not symmetric (undirected case).
      If the sizes list does not match nodelist or the probability matrix.
      If nodelist contains duplicate.

    Examples
    --------
    >>> sizes = [75, 75, 300]
    >>> probs = [[0.25, 0.05, 0.02], [0.05, 0.35, 0.07], [0.02, 0.07, 0.40]]
    >>> g = nx.stochastic_block_model(sizes, probs, seed=0)
    >>> len(g)
    450
    >>> H = nx.quotient_graph(g, g.graph["partition"], relabel=True)
    >>> for v in H.nodes(data=True):
    ...     print(round(v[1]["density"], 3))
    ...
    0.245
    0.348
    0.405
    >>> for v in H.edges(data=True):
    ...     print(round(1.0 * v[2]["weight"] / (sizes[v[0]] * sizes[v[1]]), 3))
    ...
    0.051
    0.022
    0.07

    See Also
    --------
    random_partition_graph
    planted_partition_graph
    gaussian_random_partition_graph
    gnp_random_graph

    References
    ----------
    .. [1] Holland, P. W., Laskey, K. B., & Leinhardt, S.,
           "Stochastic blockmodels: First steps",
           Social networks, 5(2), 109-137, 1983.
    """
    # Check if dimensions match
    if len(sizes) != len(p):
        raise nx.NetworkXException("'sizes' and 'p' do not match.")
    # Check for probability symmetry (undirected) and shape (directed)
    for row in p:
        if len(p) != len(row):
            raise nx.NetworkXException("'p' must be a square matrix.")
    if not directed:
        p_transpose = [list(i) for i in zip(*p)]
        for i in zip(p, p_transpose):
            for j in zip(i[0], i[1]):
                if abs(j[0] - j[1]) > 1e-08:
                    raise nx.NetworkXException("'p' must be symmetric.")
    # Check for probability range
    for row in p:
        for prob in row:
            if prob < 0 or prob > 1:
                raise nx.NetworkXException("Entries of 'p' not in [0,1].")
    # Check for nodelist consistency
    if nodelist is not None:
        if len(nodelist) != sum(sizes):
            raise nx.NetworkXException("'nodelist' and 'sizes' do not match.")
        if len(nodelist) != len(set(nodelist)):
            raise nx.NetworkXException("nodelist contains duplicate.")
    else:
        nodelist = range(0, sum(sizes))

    # Setup the graph conditionally to the directed switch.
    block_range = range(len(sizes))
    if directed:
        g = nx.DiGraph()
        block_iter = itertools.product(block_range, block_range)
    else:
        g = nx.Graph()
        block_iter = itertools.combinations_with_replacement(block_range, 2)
    # Split nodelist in a partition (list of sets).
    size_cumsum = [sum(sizes[0:x]) for x in range(0, len(sizes) + 1)]
    g.graph["partition"] = [
        set(nodelist[size_cumsum[x] : size_cumsum[x + 1]])
        for x in range(0, len(size_cumsum) - 1)
    ]
    # Setup nodes and graph name
    for block_id, nodes in enumerate(g.graph["partition"]):
        for node in nodes:
            g.add_node(node, block=block_id)

    g.name = "stochastic_block_model"

    # Test for edge existence
    parts = g.graph["partition"]
    for i, j in block_iter:
        if i == j:
            if directed:
                if selfloops:
                    edges = itertools.product(parts[i], parts[i])
                else:
                    edges = itertools.permutations(parts[i], 2)
            else:
                edges = itertools.combinations(parts[i], 2)
                if selfloops:
                    edges = itertools.chain(edges, zip(parts[i], parts[i]))
            for e in edges:
                if seed.random() < p[i][j]:
                    g.add_edge(*e)
        else:
            edges = itertools.product(parts[i], parts[j])
        if sparse:
            if p[i][j] == 1:  # Test edges cases p_ij = 0 or 1
                for e in edges:
                    g.add_edge(*e)
            elif p[i][j] > 0:
                while True:
                    try:
                        logrand = math.log(seed.random())
                        skip = math.floor(logrand / math.log(1 - p[i][j]))
                        # consume "skip" edges
                        next(itertools.islice(edges, skip, skip), None)
                        e = next(edges)
                        g.add_edge(*e)  # __safe
                    except StopIteration:
                        break
        else:
            for e in edges:
                if seed.random() < p[i][j]:
                    g.add_edge(*e)  # __safe
    return g