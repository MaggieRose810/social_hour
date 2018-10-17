# Purpose
Application for making social hour groups so they are optimized with people being placed into groups with people they have not been in a group with frequently.

## Approach 1 -- Random
Randomly place every user into a group without considering past groups.
Over the long term this approach will trend towards the optimal solution but in the short term there can be groups where users frequently encounter each other when there were other groups where they could have been with someone new.

Graph of scores for a company of 20 employees over 20 weeks with groups of 3.
![Graph of random groups over 20 weeks](https://i.postimg.cc/8PkC4y3p/Screen_Shot_2018-10-10_at_7.23.41_PM.png)

Graph of scores a company of 100 employees over 10 weeks with groups of 3
![Graph of random groups over 10 weeks](https://i.postimg.cc/CKbYSDtr/Screen_Shot_2018-10-10_at_7.26.33_PM.png)

## Aproach 2 -- One Pass at Minimizing Scores
Place every user into a group starting from one user and picking their optimal group partners. After partners are picked they are eliminated from the pool until every user is in a group. The groups built first are likely to have optimal scores but later groups may have a non ideal set of users to choose from.

Graph of scores for a company of 20 employees over 20 weeks with groups of 3.
![Graph of one pass at minimizing scores groups over 20 weeks](https://i.postimg.cc/L4ZkYLW4/Screen-Shot-2018-10-16-at-9-33-25-PM.png)


Graph of scores a company of 100 employees over 10 weeks with groups of 3
![Graph of one pass at minimizing scores groups over 10 weeks](https://i.postimg.cc/3wn4VJbc/Screen-Shot-2018-10-16-at-9-29-48-PM.png)

## Scoring Methodology
For each user in a group count the number of times they have already been in a group with the other members and the sum of the scores for the individuals is the score for the group. 0 is optimal, the higher the worse.


## Future Ideas
* dampening effect to consider how long ago people were in a group together