SELECT * FROM matches
SELECT * FROM deliveries

--1.WHAT ARE THE TOP 5 PLAYERS WITH THE MOST PLAYER OF THE MATCH AWARDS?
SELECT TOP 5 player_of_match,count(*) as Awards
FROM matches
group by player_of_match
order by Awards DESC

--2.HOW MANY MATCHES WERE WON BY EACH TEAM IN EACH SEASON?
SELECT season,winner as team ,count(*) as won_matches
FROM matches
GROUP BY season, winner

--3.WHAT IS THE AVERAGE STRIKE RATE OF BATSMEN IN THE IPL DATASET?
SELECT avg(strike_rate) as avg_strike_rate
FROM(
	SELECT batsman,(SUM(total_runs)/count(ball))*100 as strike_rate 
	FROM deliveries 
	GROUP BY batsman) as batsman_stats

-- total run by batsman in all matches in given ipl dataset
SELECT batsman,sum(batsman_runs) as total_run_by_batsman
FROM deliveries
GROUP BY batsman


---4.WHAT IS THE NUMBER OF MATCHES WON BY EACH TEAM BATTING FIRST VERSUS BATTING SECOND?

SELECT batting_first,count(*) AS match_won
FROM(
SELECT CASE WHEN win_by_runs>0 then team1
ELSE team2
END AS batting_first
FROM matches
) 
AS batting_first_teams
GROUP BY batting_first;

--5. WHICH BATSMAN HAS THE HIGHEST STRIKE RATE (MINIMUM 200 RUNS SCORED)?
SELECT top 2 batsman,(sum(batsman_runs)*100/count(*)) as strike_rate
FROM deliveries
GROUP BY batsman
HAVING sum(batsman_runs)> =200
ORDER BY strike_rate DESC



--6.HOW MANY TIMES HAS EACH BATSMAN BEEN DISMISSED BY THE BOWLER 'MALINGA'?
SELECT batsman ,Count(*) as total_dismissals
FROM deliveries
WHERE player_dismissed IS NOT NULL
AND bowler='SL Malinga'
GROUP BY batsman

--7.WHAT IS THE AVERAGE PERCENTAGE OF BOUNDARIES (FOURS AND SIXES COMBINED) HIT BY EACH BATSMAN?
select batsman,avg(case when batsman_runs='4' or batsman_runs='6' then 1 else 0 end) as avg_boundries
FROM deliveries group by batsman;

select batsman,batting_team,(avg(fours+sixes)) as average_boundaries
from(select batsman,batting_team,
sum(case when batsman_runs=4 then 1 else 0 end) as fours,
sum(case when batsman_runs=6 then 1 else 0 end) as sixes
FROM deliveries group by batsman,batting_team)as t
group by batsman,batting_team;

--8. WHAT IS THE AVERAGE NUMBER OF BOUNDARIES HIT BY EACH TEAM IN EACH SEASON
select season,batting_team,avg(fours+sixes) as average_boundaries
from(select season,match_id,batting_team,
sum(case when batsman_runs=4 then 1 else 0 end)as fours,
sum(case when batsman_runs=6 then 1 else 0 end) as sixes
from deliveries,matches 
where deliveries.match_id=matches.id
group by season,match_id,batting_team) as team_bounsaries
group by season,batting_team;

--9. WHAT IS THE HIGHEST PARTNERSHIP (RUNS) FOR EACH TEAM IN EACH SEASON?
select season,batting_team,max(total_runs) as highest_partnership
from(select season,batting_team,partnership,sum(total_runs) as total_runs
from(select season,match_id,batting_team,
sum(batsman_runs) as partnership,sum(batsman_runs)+sum(extra_runs) as total_runs
from deliveries,matches where deliveries.match_id=matches.id
group by season,match_id,batting_team) as team_scores
group by season,batting_team,partnership) as highest_partnership
group by season,batting_team; 

--10.HOW MANY EXTRAS (WIDES & NO-BALLS) WERE BOWLED BY EACH TEAM IN EACH MATCH?
select m.id as match_no,d.bowling_team,
sum(d.extra_runs) as extras
from matches as m
join deliveries as d 
on d.match_id=m.id
where extra_runs>0
group by m.id,d.bowling_team;

--11.WHICH BOWLER HAS THE BEST BOWLING FIGURES (MOST WICKETS TAKEN) IN A SINGLE MATCH?
select m.id as match_no,d.bowler,count(*) as wickets_taken
from matches as m
join deliveries as d on d.match_id=m.id
where d.player_dismissed is not null
group by m.id,d.bowler
order by wickets_taken desc

--12.HOW MANY MATCHES RESULTED IN A WIN FOR EACH TEAM IN EACH CITY?
select m.city,
(case
	when m.team1=m.winner then m.team1
	when m.team2=m.winner then m.team2
	else 'draw'
	end) AS winning_team,
count(*) as wins
from matches as m
join deliveries as d 
on d.match_id=m.id
where m.result!='tie'
group by m.city,winning_team;

--13 HOW MANY TIMES DID EACH TEAM WIN THE TOSS IN EACH SEASON?
select season,toss_winner,count(*) as toss_wins
from matches group by season,toss_winner;

--14. HOW MANY MATCHES DID EACH PLAYER WIN THE "PLAYER OF THE MATCH" AWARD
select player_of_match,count(*) as total_wins
from matches 
where player_of_match is not null
group by player_of_match
order by total_wins desc;

--15.WHAT IS THE AVERAGE NUMBER OF RUNS SCORED IN EACH OVER OF THE INNINGS IN EACH MATCH?
select m.id,d.inning,d.[over],
avg(d.total_runs) as average_runs_per_over
from matches as m
join deliveries as d 
on d.match_id=m.id
group by m.id,d.inning,d.[over];

--16.WHICH TEAM HAS THE HIGHEST TOTAL SCORE IN A SINGLE MATCH?
select m.season,m.id as match_no,d.batting_team,
sum(d.total_runs) as total_score
from matches as m
join deliveries as d on d.match_id=m.id
group by m.season,m.id,d.batting_team
order by total_score desc






--17.WHICH BATSMAN HAS SCORED THE MOST RUNS IN A SINGLE MATCH?
select m.season,m.id as match_no,d.batsman,
sum(d.batsman_runs) as total_runs
from matches as m
join deliveries as d on d.match_id=m.id
group by m.season,m.id,d.batsman
order by total_runs desc
 