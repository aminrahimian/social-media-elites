# coding: utf-8
# Echo Chamber Model
# social_media.py
# Last Update: 20190410
# by Kazutoshi Sasahara
# Used by Zhaohan Xing
# Version 1.2

import numpy as np
import networkx as nx
import pandas as pd
import Agent
from networkx.generators import stochastic_block_model


class Message(object):
    # Set up a class named Message to include all information needed.
    '''
    Parameters: (msg_id, orig_msg_id, who_posted, who_originated, content)
        Create a message with id itself, the originated msg_id, who post this msg, who is the origin
        of this msg and what is the content of this msg (opinion in this msg)
    Attributes:
        msg_id, orig_msg_id, who_posted, who_originated, content
    '''
    def __init__(self, msg_id, orig_msg_id, who_posted, who_originated, content):
        self.msg_id = msg_id
        self.orig_msg_id = orig_msg_id
        self.who_posted = who_posted
        self.who_originated = who_originated
        self.content = content

    def to_dict(self):
        '''
        To transform the information and store in a dictionary
        keys:
            'msg_id': ID of the msg
            'orig_msg_id': ID of originated msg
            'who_posted': # of agent who post this msg
            'who_originated': # of agent who is the origin
            'content': opinion of this msg
        values: The attributes of Message
        :return: A dictionary containing keys and values
        '''
        return {'msg_id': self.msg_id, 'orig_msg_id': self.orig_msg_id,
                'who_posted': self.who_posted, 'who_originated': self.who_originated,
                'content': self.content, }


class SocialMedia(object):
    '''
    Create the structure of the society
    This time, create structure: two society with equal number of users, only few edges between these
    two societies. There is one "center" user who is popular in each society, respectively
    '''
    def __init__(self, num_agents, l, network_model, *paras):
        '''
        To construct
        :param num_agents: The total number of users in the network
        :param l: The size of the screen
        :param network_model: Specify the model used in the network
        :param paras:
            *paras: (k, x, y)
            If the model is Elites model
                k: The influential power of the elites. k = 1 if the elites are connected to all
                the other agents, k = 0 if the elites do not guarantee to connect (similar to SBM)
                x: The parameter that should be the same to p in SBM model, to control the irrelevant
                factors. The number of edges within societies should be the same
                (kn/2 + (n/2-1)(n/2-1)x(real) = n/2(n/2-1)p)
                y: The parameter that should be the same to q in SBM model, to control the irrelevant
                factors. The number of edges between societies should be the same
                ((n/2-1)(n/2-1)*y(real) = n/2 * n/2 * q)
                Notice: Do not connect the eilte to the other societies' agents here
            *paras: (p, q)
            If the model is Stochastic Block Model, provide the probability tuple
                p: same community share an edge
                q: diffrent community share an edge
        '''
        self.num_agents = num_agents
        # Two different society, and combine them into one network
        if network_model == "Elites":
            G1 = nx.star_graph(num_agents//2 - 1)
            G2 = nx.star_graph(num_agents//2 - 1)
            self.G = nx.disjoint_union(G1,G2)
            self.G = nx.DiGraph(self.G)
            for u, v in list(self.G.edges):
                # Remove all the edges that are originated from other users to the centers
                if v == 0 or v == num_agents:
                    self.G.remove_edge(u, v)
            for u, v in list(self.G.edges):
                # Remove some edges if the influencial power is less than 1
                if paras[0] < 1:
                    for u, v in list(self.G.edges):
                        if np.random.random() < 1 - paras[0]:
                            self.G.remove_edge(u, v)
                elif paras[0] <= 0 or paras[0] > 1:
                    print("The influential power must be a number between 0 and 1 (0 not included)")
                    print("Warning! Enter a valid value")
            # Create some edges within societies, to make sure that the expected number of edges are is the same
            # Since x is the same as p, but the real probability is:
            x = (num_agents//2 * (num_agents//2 - 1) * paras[1] - paras[0] * (num_agents // 2)) / ((num_agents//2 - 1) * (num_agents//2 - 1))
            for c1 in range(1,num_agents//2-1):
                for c2 in range(num_agents//2 - 1):
                    if c1 != c2:
                        if np.random.random() < x:
                            self.G.add_edge(c1, c2)
            for c1 in range(num_agents//2 + 1, num_agents - 1):
                for c2 in range(num_agents//2, num_agents - 1):
                    if c1 != c2:
                        if np.random.random() < x:
                            self.G.add_edge(c1, c2)

            # Create some edges between societies
            # Since x is the same as p, but the real probability is:
            y = (num_agents // 2) * (num_agents // 2) * paras[2]  / (
                                    (num_agents // 2 - 1) * (num_agents // 2 - 1))
            for c1 in range(1, num_agents // 2 - 1):
                for c2 in range(num_agents // 2 + 1, num_agents - 1):
                    if np.random.random() < y:
                        self.G.add_edge(c1, c2)
            for c1 in range(num_agents // 2 + 1, num_agents - 1):
                for c2 in range(1, num_agents // 2 - 1):
                    if np.random.random() < x:
                        self.G.add_edge(c1, c2)
        elif network_model == "Stochastic Block":
            # Probability is given. It is highly related to the structure
            self.G = nx.generators.stochastic_block_model(
                [num_agents//2, num_agents//2],
                [[paras[0], paras[1]], [paras[1], paras[0]]], directed = True
            )
        self.message_dic = {}
        # Create a dataframe containing msg information
        self.message_df = pd.DataFrame(columns=['msg_id', 'orig_msg_id', 'who_posted', 'who_originated', 'content'])
        # Default: 10
        self.screen_size = l

    def set_node_colors(self, node_colors):
        # Different color to be drawn
        for i, c in enumerate(node_colors):
            self.G.nodes[i]['color'] = c

    def show_screen(self, user_id):
        '''
        Show the screen of the msgs
        :param user_id: The ID of the user that are analyzed
        :return: Last <screen_size> of the obs msg dataframe
        '''
        friends = self.G.neighbors(user_id)
        # Show the msgs that are posted by friends
        friend_message_df = self.message_df[self.message_df['who_posted'].isin(friends)]
        # Do not show the msgs that are originated from the user
        friend_message_df = friend_message_df[friend_message_df['who_originated'] != user_id]
        return friend_message_df.tail(self.screen_size)

    def update_message_db(self, t, msg):
        '''
        To append the msg dataframe
        :param msg: msg need to be added
        :return: None
        '''
        self.message_df = self.message_df.append(msg.to_dict(), ignore_index=True).tail(self.num_agents)

    def recommend_similar_users(self, user_id, epsilon, num_agents):
        '''
        Recommend similar users with similar opinion that users may be interested to follow
        :param user_id: user that is being recommended
        :param epsilon: parameter to judge whether condordant or discordant
        :param num_agents:agents in the network
        :return: List of similar users
        '''
        # Create an empty list
        similar_users = []
        # The newest msg originated from the user
        my_message_df = self.message_df[self.message_df.who_originated == user_id].tail(1)
        if len(my_message_df) > 0:
            # The content of the newest msg
            last_message = my_message_df.content.values[0]
            friends = self.G.neighbors(user_id)
            # Should not be oringinated from user
            similar_messages_df = self.message_df[self.message_df.who_originated != user_id].tail(num_agents)
            # Filter all msgs that are similar (confidence distance)
            similar_messages_df = similar_messages_df[abs(last_message - similar_messages_df.content) < epsilon]
            if len(similar_messages_df) > 0:
                # should not be the friends already
                similar_users = [u for u in similar_messages_df.who_originated.values if u not in friends]
        return similar_users

    def rewire_users(self, user_id, unfollow_id, follow_id):
        '''
        To unfollow and follow agents, adjust the connections
        :param user_id: The user trying to be rewired
        :param unfollow_id: User ID that are unfollowing
        :param follow_id: Follow this new agent
        :return: None
        '''
        self.G.remove_edge(user_id, unfollow_id)
        self.G.add_edge(user_id, follow_id)