from recommendations import critics
critics['Lisa Rose']['Lady in the Water']
critics['Toby']['Snakes on a Plane']=4.5
critics['Toby']

#Using Euclidian Distance to measure similarity between 2 points
from math import sqrt
sqrt(pow(1,2)+pow(3,2))
#Let sqrt(pow(1,2)+pow(3,2))=X To give higher number weightage to more similar elements, 1/(1+X)
1/(1+sqrt(pow(1,2)+pow(3,2)))
#1/(1+X) returns a value between 1 and X, where a value of 1 means that they have identical scoring

#function to calculate similarity
def sim_distance(pref,person1,person2):
    si={}
    for item in prefs[person1]:
        if item in prefs[person2]:
            si[item]=1

    #if they have no items in common, return 0
    if len(si)==0: return 0

    sum_of_squares = sum([pow(prefs[person1][item] - prefs[person2][item], 2)
                          for item in prefs[person1] if item in prefs[person2]])

import recommendations
reload(recommendations)
recommendations.sim_distance(recommendations.critics,'Lisa Rose','Gene Seymour')