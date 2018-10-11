# Purpose
Application for making social hour groups so they are optimized with people being placed into groups with people they have not been in a group with frequently.

## Approach 1
Randomly place every user into a group without considering past groups.
Over the long term this approach will trend towards the optimal solution but in the short term there can be groups where users frequently encounter each other when there were other groups where they could have been with someone new.

Graph of scores for a company of 20 employees over 20 weeks with groups of 3.
![Graph of random groups over 20 weeks](https://i.postimg.cc/8PkC4y3p/Screen_Shot_2018-10-10_at_7.23.41_PM.png)

Graph of scores a company of 100 employees over 10 weeks with groups of 3
![Graph of random groups over 10 weeks](https://i.postimg.cc/CKbYSDtr/Screen_Shot_2018-10-10_at_7.26.33_PM.png)

## Scoring Methodology
For each user in a group count the number of times they have already been in a group with the other members and the sum of the scores for the individuals is the score for the group. 0 is optimal, the higher the worse.



## Future Ideas
* dampening effect to consider how long ago people were in a group together