"""
List: Ordered list of any type of value []
Dictionary:  Unordered set of key/value pairs {} 
"""
#simple code in python
x=1
if x==1:
    print 'x is 1'
    print 'Still in if block'
print 'outside if block'

"""
List comprehension: Convenient way of converting one list to another by 
filtering and applying functions to it
"""
l1=[1,2,3,4,5,6,7,8,9]
print [v*10 for v in l1 if v>4]

------------------------------------------------------
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
#running the function
import recommendations
reload(recommendations)
recommendations.sim_distance(recommendations.critics,'Lisa Rose','Gene Seymour')

-----------------------------------------------------
#Pearson's Coefficient
# Returns the Pearson correlation coefficient for p1 and p2
def sim_pearson(prefs,p1,p2):
   # Get the list of mutually rated items
    si={}
    for item in prefs[p1]:
        if item in prefs[p2]: si[item]=1
# Find the number of elements
    n=len(si)
# if they are no ratings in common, return 0
    if n==0: return 0

# Add up all the preferences
    sum1=sum([prefs[p1][it] for it in si])
    sum2=sum([prefs[p2][it] for it in si])

# Sum up the squares
    sum1Sq=sum([pow(prefs[p1][it],2) for it in si])
    sum2Sq=sum([pow(prefs[p2][it],2) for it in si])
# Sum up the products
    pSum=sum([prefs[p1][it]*prefs[p2][it] for it in si])

# Calculate Pearson score
    num=pSum-(sum1*sum2/n)
    den=sqrt((sum1Sq-pow(sum1,2)/n)*(sum2Sq-pow(sum2,2)/n))
    if den==0: return 0
    r=num/den

    return r

-------------------------------------------------------------
#Ranking of critics: Ranking critics who are most similar to a given critic/user

# Returns the best matches for person from the prefs dictionary.
# Number of results and similarity function are optional params.
def topMatches(prefs,person,n=5,similarity=sim_pearson):
	scores=[(similarity(prefs,person,other),other)
					for other in prefs if other!=person]
# Sort the list so the highest scores appear at the top
	scores.sort( )
	scores.reverse( )
	return scores[0:n]

--------------------------------------------------------------

#Now, to actually recommend movies, we will need to multiple closest critic and 
#And give higher rating to a critic that is closer to us and a lower rating to a 
#critic who is far away in the scatter plot

#We also need to normalize because a movie with a greater number of ratings would 
#have an advantage, so, we divide by the total number of reviews for a movie

# Gets recommendations for a person by using a weighted average
# of every other user's rankings
def getRecommendations(prefs,person,similarity=sim_pearson):
	totals={}
	simSums={}
	for other in prefs:
# don't compare me to myself
		if other==person: continue
		sim=similarity(prefs,person,other)

# ignore scores of zero or lower
		if sim<=0: continue
		for item in prefs[other]:

# only score movies I haven't seen yet
		if item not in prefs[person] or prefs[person][item]==0:
# Similarity * Score
			totals.setdefault(item,0)
			totals[item]+=prefs[other][item]*sim
# Sum of similarities
			simSums.setdefault(item,0)
			simSums[item]+=sim
# Create the normalized list
rankings=[(total/simSums[item],item) for item,total in totals.items( )]

# Return the sorted list
rankings.sort( )
rankings.reverse( )
return rankings

#in the console
reload(recommendations)
recommendations.getRecommendations(recommendations.critics,'Toby',similarity=recommendations.sim_distance)

-----------------------------------------------------------------------------




#DATA
# A dictionary of movie critics and their ratings of a small
# set of movies
critics={'Lisa Rose': {'Lady in the Water': 2.5, 'Snakes on a Plane': 3.5,
                       'Just My Luck': 3.0, 'Superman Returns': 3.5, 'You, Me and Dupree': 2.5,
                       'The Night Listener': 3.0},
         'Gene Seymour': {'Lady in the Water': 3.0, 'Snakes on a Plane': 3.5,
                          'Just My Luck': 1.5, 'Superman Returns': 5.0, 'The Night Listener': 3.0,
                          'You, Me and Dupree': 3.5},
         'Michael Phillips': {'Lady in the Water': 2.5, 'Snakes on a Plane': 3.0,
                              'Superman Returns': 3.5, 'The Night Listener': 4.0},
         'Claudia Puig': {'Snakes on a Plane': 3.5, 'Just My Luck': 3.0,
                          'The Night Listener': 4.5, 'Superman Returns': 4.0,
                          'You, Me and Dupree': 2.5},
         'Mick LaSalle': {'Lady in the Water': 3.0, 'Snakes on a Plane': 4.0,
                          'Just My Luck': 2.0, 'Superman Returns': 3.0, 'The Night Listener': 3.0,
                          'You, Me and Dupree': 2.0},
         'Jack Matthews': {'Lady in the Water': 3.0, 'Snakes on a Plane': 4.0,
                           'The Night Listener': 3.0, 'Superman Returns': 5.0, 'You, Me and Dupree': 3.5},
         'Toby': {'Snakes on a Plane':4.5,'You, Me and Dupree':1.0,'Superman Returns':4.0}}
