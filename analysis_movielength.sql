#Analysis of Movie Length on Earnings:

with vote_data as (
select series_title,no_of_votes,
dense_rank() over(order by no_of_votes desc) as vote_rank 
from imdb ) ,
rating_data as ( 
select series_title,
imdb_rating
from imdb)
select * from vote_data as v join rating_data as r on v.series_title = r.series_title;

#Insight -  Number of votes and imdb rating are correlated with each other. 


with runtime_data as (
select series_title,
runtime,
case 
    when runtime <= 45 then "short film"
    when runtime between 46 and 80 then "series"
    when runtime between 81 and 180 then "feature film"
    when runtime > 180 then "long movie"
    else null
    end as category,
    gross from imdb order by runtime desc
    )
    select distinct(category),count(series_title) as count from runtime_data group by category;

    #Insight - feature films are directed more in the industry. 
    
    
with runtime_data as (
select series_title,
runtime,
case 
    when runtime <= 45 then "short film"
    when runtime between 46 and 80 then "series"
    when runtime between 81 and 180 then "feature film"
    when runtime > 180 then "long movie"
    else null
    end as category,
    gross from imdb order by runtime desc
    )
    select distinct(category),sum(gross) as total_gross from runtime_data group by category;
    
   
    #Insight - We got more revenue by feature films, runtime between 80 and 180. Feature film has more commerical success.
    
##Analysis of Movie Length on ratings:

with rating_data as (
select series_title,
runtime,
case 
    when runtime <= 45 then "short film"
    when runtime between 46 and 80 then "series"
    when runtime between 81 and 180 then "feature film"
    when runtime > 180 then "long movie"
    else null
    end as category,
    imdb_rating from imdb order by runtime desc
    )
select category,avg(imdb_rating) as avg  from rating_data group by category;

#Insight - shows that imdb rating does not impact the gross, rating is moreover similar for runtime categories. 

