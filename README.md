# sql-case-study-zomato-and-ipl

 **SQL**
 
Here,

we have solved the two case studies one is related to **Zommato** and other is related to **IPL** description of both datasets are given below :








**------------*******-------------------------*******-------------------------*******-------------------------*******-------------------------*******-------------------------*******------**


**zommato dataset**

 ![image](https://github.com/sahil07codac/sql-case-study-zomato-and-ipl/assets/141804728/78572494-b844-4cee-9807-a52fc78f7518)


About data- various tables are here, like, user, restaurant, order,order_details, delivery partners, food, menu,

Description of each table

**user**
1. user_id-each customer has a unique user-id.
2. name- name of customers
3. email- email-id of each customer for login
4. password-a  pass of each customer account 
                   
**restuarants**
1. r_id- resturant id
2. r_name- resturant name
3. cuisine- type of food(chinese, italiian etc)

**food**
1. f_id- food id
2. f_name-food name
3. type-food type veg /nonveg

**menu**
1. order_id-unique order id of menu
2. user-id- userid of customers
3. r_id- resturant id of different resturant
4. amount- amount of food
5. date- order date of food
6. partner_id- delivery partner id
7. delivery_time- time required to deliver
8. delivery_rating-rating of delivery
9. resturant_rating- rating of resturant
    
 **Delivery-partner**
1. partner_id- delivery boy id(partner)
2. partner_name- delivery boy name

**order_details**
1. id- id of each details
2. order_id- order id of each differnt order
3. f_id- food id



CASE PROBLEMS

-1. find customers who have never ordered food

-2. average price/dish

-3. find a top restaurant in terms of the number of orders for a given month

-4. restaurant whose monthly sale is greater than x value

-5. show all orders with order details for particular customers in the particular date range

-6. find a restaurant with maximum repeated customer

-7. month over month revenue growth

-8. month-wise revenue

-9. customer and their fav. dish







**------------*******-------------------------*******-------------------------*******-------------------------*******-------------------------*******-------------------------*******------**




--similarly, for ipl dataset--

SQL CASE STUDY

**IPL dataset**

![image](https://github.com/sahil07codac/sql-case-study-zomato-and-ipl/assets/141804728/ced32050-5a03-41aa-ba05-2c5593f75b5c)


About data- there are two table matches & deliveries

Description of each table
**mateches**
1. id- different  match id for differnt match
2. seasons- there are 3 seaons here (2017,2008,2009)
3. city- city where match was played
4. date- match date(day)
5. team1- name of team one will play
6. team2- name of other team will play
7. toss_winner- which team won the toss
8. toss_decision- after toss choose either bat of boll first
9. result- result of match( normal-won/lose,tie)
10. dl_applied- dl rules (1 for applied ,0 for not applied)
11. winner- winning team name
12. win_by_runs- shows win by how many run
13. win_by_wickets- shows win by how many wickets
14. player_of_match- man of the match
15. venue- name of stadium where match played
16. umpire1- umpire name
17. umpire2-umpire name
18. umpire3-umpire name (TV)

**deliveries**
1. match_id- match id for each match
2. inning-(1 for batting  ,2 for second batting)
3. batting_team- batting team name
4. bowlling_team- bowling team name
5. over- each ball details( over no)
6. ball- total ball in each over details
7. batsman- batsman name
8. non_striker- batsman name on non stricker
9. bowler- bowler name
10. is_super_over- is super over or not (0 for not super over and  for super over)
11. wide_runs- its shows wide runs (wide+actual run on these ball)
12. bye_runs- Bye runs
13. leg_bye_runs- leg bye run
14. noball_runs- noball run
15. penalty_runs-
16. batsman_runs- batsman run on each ball
17. extra_runs- extra run
18. total_runs- total run on these ball
19. player_dismissed- name of player
20. dismissal_kind- caught, bowled
21. fielder-

Problems FOR IPL DATASET:
1. WHAT ARE THE TOP 5 PLAYERS WITH THE MOST PLAYER OF THE MATCH AWARDS?
2. HOW MANY MATCHES WERE WON BY EACH TEAM IN EACH SEASON?
3. WHAT IS THE AVERAGE STRIKE RATE OF BATSMEN IN THE IPL DATASET?
4. WHAT IS THE NUMBER OF MATCHES WON BY EACH TEAM BATTING FIRST VERSUS BATTING SECOND?
5. WHICH BATSMAN HAS THE HIGHEST STRIKE RATE (MINIMUM 200 RUNS SCORED)?
6. HOW MANY TIMES HAS EACH BATSMAN BEEN DISMISSED BY THE BOWLER 'MALINGA'?
7. WHAT IS THE AVERAGE PERCENTAGE OF BOUNDARIES (FOURS AND SIXES COMBINED) HIT BY EACH BATSMAN?
8. WHAT IS THE AVERAGE NUMBER OF BOUNDARIES HIT BY EACH TEAM IN EACH SEASON?
9. WHAT IS THE HIGHEST PARTNERSHIP (RUNS) FOR EACH TEAM IN EACH SEASON?
10. HOW MANY EXTRAS (WIDES & NO-BALLS) WERE BOWLED BY EACH TEAM IN EACH MATCH?
11. WHICH BOWLER HAS THE BEST BOWLING FIGURES (MOST WICKETS TAKEN) IN A SINGLE MATCH?
12. HOW MANY MATCHES RESULTED IN A WIN FOR EACH TEAM IN EACH CITY?
13. HOW MANY TIMES DID EACH TEAM WIN THE TOSS IN EACH SEASON?
14. HOW MANY MATCHES DID EACH PLAYER WIN THE "PLAYER OF THE MATCH" AWARD?
15. WHAT IS THE AVERAGE NUMBER OF RUNS SCORED IN EACH OVER OF THE INNINGS IN EACH MATCH?
16. WHICH TEAM HAS THE HIGHEST TOTAL SCORE IN A SINGLE MATCH?
17. WHICH BATSMAN HAS SCORED THE MOST RUNS IN A SINGLE MATCH?


