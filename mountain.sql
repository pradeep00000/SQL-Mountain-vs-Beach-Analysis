create schema mountain;
select * from mountain.mountains_vs_beaches_preferences;

#1. What is the total number of records in the dataset?
select count(*) as Total_Record
from mountain.mountains_vs_beaches_preferences;

#2. List distinct education levels.
select distinct(Education_Level)
from mountain.mountains_vs_beaches_preferences;

#3. What is the average vacation budget?
select avg(Vacation_Budget) as Avg_Vacation_Budget
from mountain.mountains_vs_beaches_preferences;

#4. Find the maximum income in the dataset.
select max(Income) as Max_Income
from mountain.mountains_vs_beaches_preferences;

#5. Count how many people prefer mountains.
select count(*) as Mountain_Lovers
from mountain.mountains_vs_beaches_preferences
where Preference = 1;

#6. What is the average travel frequency of people with pets?
select avg(Travel_Frequency)
from mountain.mountains_vs_beaches_preferences
where Pets = 1;

#7. How many people live in urban areas and prefer beaches?
select count(*)
from mountain.mountains_vs_beaches_preferences
where Preference = 0 and Location = 'urban';

#8. Find the gender breakdown of people who prefer mountains.
select Gender , count(Preference) as mountain_lovers
from mountain.mountains_vs_beaches_preferences
where Preference = 1
group by Gender;

#9. What is the most popular activity among suburban residents?
select Preferred_Activities , count(*) as count
from mountain.mountains_vs_beaches_preferences
where Location = 'suburban'
group by Preferred_Activities
order by count desc
limit 1;

#10. Find the average proximity to beaches for 
#    high-income individuals (income > 80,000).
select avg(Proximity_to_Beaches)
from mountain.mountains_vs_beaches_preferences
where Income > 80000;

#11. Find the most common season preference for
#    individuals with environmental concerns.
select Favorite_Season , count(*) as count
from mountain.mountains_vs_beaches_preferences
where Environmental_Concerns = 1
group by Favorite_Season
order by count desc
limit 1;

#12. What is the income distribution by gender for beach lovers?
select Gender , avg(Income) , min(Income) , max(Income)
from mountain.mountains_vs_beaches_preferences
where Preference = 0
group by Gender;

#13. Find the percentage of respondents who live in rural
#    areas and prefer mountains.
select (count(*) * 100.0 / (select count(*) from 
       mountain.mountains_vs_beaches_preferences)) as percentage
from mountain.mountains_vs_beaches_preferences
where Location = 'rural' and Preference = 1;

#14. Find the relation between travel frequency and vacation budget.
select Travel_Frequency , sum(Vacation_Budget)
from mountain.mountains_vs_beaches_preferences
group by Travel_Frequency;

#15. Which education level has the highest average vacation budget?
select Education_Level , avg(Vacation_Budget) as Avg_Budget
from mountain.mountains_vs_beaches_preferences
group by Education_Level
order by Avg_Budget desc
limit 1;

#16. Determine the top 3 preferred activities in summer.
select Preferred_Activities , count(*) as count
from mountain.mountains_vs_beaches_preferences
where Favorite_Season = 'summer'
group by Preferred_Activities
order by count desc
limit 3;

#17. What is the average proximity to beaches and mountains by location type?
select Location , avg(Proximity_to_Mountains) , avg(Proximity_to_Beaches)
from mountain.mountains_vs_beaches_preferences
group by Location;

#18. Create a summary of preference counts by gender and location.
select Gender, Location, count(*) as Count 
from mountain.mountains_vs_beaches_preferences
group by Gender, Location 
order by Gender, Location;
