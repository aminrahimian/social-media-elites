# coding: utf-8
# Echo Chamber Model
# Agent.py
# Last Update: 20210118
# by Kazutoshi Sasahara
# Used by Zhaohan Xing
# Version 1.2

import numpy as np
import social_media
from social_media import Message


class Agent(object):
    # setup the parameters of the objects
    '''
    Parameters: (user_id, epsilon, screen_diversity, sign)
        Create an agent with positive/negative opinion using different values of "sign"
    Attributes:
        user_id, opinion, epsilon, screen_diversity, orig_msg_ids_in_screen
    '''
    def __init__(self, user_id, epsilon, screen_diversity,sign):
        self.user_id = user_id
        #Create Agent with positive/negative opinion based on sign
        if sign == "-":
            self.opinion = np.random.uniform(-1.0, 0.0)
        elif sign == "+":
            self.opinion = np.random.uniform(0.0,1.0)
        self.epsilon = epsilon
        self.screen_diversity = screen_diversity
        # Temporary initialization
        self.orig_msg_ids_in_screen = []

    # update the msg id in screen
    def set_orig_msg_ids_in_screen(self, screen):
        self.orig_msg_ids_in_screen = screen.orig_msg_id.values

    def evaluate_messages(self, screen):
        '''
        Update the messages shown in the screen and separate into concordant and discordant msgs based on epsilon
        :param screen: A DataFrame that contains the information of massages shown in the screen
        :return: None
        '''
        # Reset attributes: (dis)concordant_msgs as empty lists
        self.concordant_msgs = []
        self.discordant_msgs = []
        if len(screen) > 0:
            # Fill the attributes based on opinion difference between agent and screen, compared with epsilon
            self.concordant_msgs = screen[abs(self.opinion - screen.content) < self.epsilon]
            self.discordant_msgs = screen[abs(self.opinion - screen.content) >= self.epsilon]

    def update_opinion(self, mu):
        if len(self.concordant_msgs) > 0:
            # Whenever there is a concordant msg, update agent's opinion
            self.opinion = self.opinion + mu * np.mean(self.concordant_msgs.content - self.opinion)

    def post_message(self, msg_id, p):
        # Whenever there are concordant msgs, p probability to repost a message
        if len(self.concordant_msgs) > 0 and np.random.random() < p:
            # repost a friend's message selected at random
            idx = np.random.choice(self.concordant_msgs.index)
            selected_msg = self.concordant_msgs.loc[idx]
            return Message(msg_id=int(msg_id), orig_msg_id=int(selected_msg.orig_msg_id),
                           who_posted=int(self.user_id), who_originated=int(selected_msg.who_originated),
                           content=selected_msg.content)
        else:
            # post a new message
            new_content = self.opinion
            return Message(msg_id=int(msg_id), orig_msg_id=int(msg_id),
                           who_posted=int(self.user_id), who_originated=int(self.user_id), content=new_content)

    def decide_follow_id_at_random(self, friends, num_agents):
        # Users cannot follow self and friends
        prohibit_list = list(friends) + [self.user_id]
        return int(np.random.choice([i for i in range(num_agents) if i not in prohibit_list]))

    def decide_unfollow_id_at_random(self, discordant_messages):
        # Whenever there is discordant msg, it is possible to unfollow
        unfollow_candidates = discordant_messages.who_posted.values
        return int(np.random.choice(unfollow_candidates))

    def decide_to_rewire(self, social_media, following_methods):
        ''' To decide who to follow and who to unfollow
        :param social_media: The network that is analyzing
        :param following_methods: In this case, three following methods are given
        :return: People to follow (follow_id) and to unfollow (unfollow_id)
        '''
        unfollow_id = None
        follow_id = None

        if len(self.discordant_msgs) > 0:
            # decide whom to unfollow
            unfollow_id = self.decide_unfollow_id_at_random(self.discordant_msgs)
            # decide whom to follow
            following_method = np.random.choice(following_methods)
            friends = social_media.G.neighbors(self.user_id)

            # Repost-based selection if possible; otherwise random selection
            if following_method == 'Repost':
                friends_of_friends = list(set(self.concordant_msgs.who_originated.values) - set(friends))
                if len(friends_of_friends) > 0:
                    follow_id = int(np.random.choice(friends_of_friends))
                else:
                    follow_id = self.decide_follow_id_at_random(friends, social_media.G.number_of_nodes())

            # Recommendation-basd selection if possible; otherwise random selection
            elif following_method == 'Recommendation':
                similar_agents = social_media.recommend_similar_users(self.user_id, self.epsilon,
                                                                      social_media.G.number_of_nodes())
                if len(similar_agents) > 0:
                    follow_id = int(np.random.choice(similar_agents))
                else:
                    follow_id = self.decide_follow_id_at_random(friends, social_media.G.number_of_nodes())

            # Random selection
            else:
                follow_id = self.decide_follow_id_at_random(friends, social_media.G.number_of_nodes())

        return unfollow_id, follow_id