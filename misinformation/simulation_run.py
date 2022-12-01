from echo_chamber_model import *
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
import matplotlib.patches as mpatches
import csv
# from networkx_function import stochastic_block_model
# import peakutils
import scipy.stats as stats



MAX_SIMULATION_TIMES = 500


# parameters
n_agents = 100
l = 10  # screen size
t_max = 100000  # max steps
epsilon = 0.4  # bounded confidence parameter
mu = 0.5  # social influence strength
p = 0.5  # repost rate
q = 0  # rewiring rate
following_methods = ['Random', 'Repost', 'Recommendation']


for i in range(MAX_SIMULATION_TIMES):
  # simulation
  now_str = pd.datetime.now().strftime('%Y%m%d%H%M%S')
  data_root_dir = os.path.join('Elites_1_data_' + ''.join(now_str))
  s = pd.datetime.now()
  print(s)
  d = EchoChamberDynamics(n_agents, epsilon, l, data_root_dir, "Stochastic Block", 1.0, 0.5, 0.05)
  d.evolve(t_max, mu, p, q, following_methods)
  e = pd.datetime.now()
  print(e)
  print(e - s)  
    
