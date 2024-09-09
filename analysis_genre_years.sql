#Genre Popularity Over the Years
 use hackathon ;
/*
|      Genre                                     | released year |
|      Action, Adventure, Comedy                 | 1926          |
Shall I write CTE  to have like,
| genre          | released_year      | category  |
| Action         | 1926               |       1        |
| Adventure      | 1926               |       1        |
| Comedy         | 1926               |       1        |
*/

select * from imdb;

#Which genre got popular over years
select genre, released_year from imdb;


#CTE to split genres 
with split_genre as (
select 
#trim is used to eliminate spaces
    trim(SUBSTRING_INDEX(SUBSTRING_INDEX(genre, ',', 1), ',', -1)) as Genre,
    released_year
from imdb
union
select 
    trim(SUBSTRING_INDEX(SUBSTRING_INDEX(genre, ',', 2), ',', -1)) as Genre,
    released_year
from imdb
union 
select 
    trim(SUBSTRING_INDEX(SUBSTRING_INDEX(genre, ',', 3), ',', -1)) as Genre,
    released_year
from imdb
),
genre_category as (
select genre,case 
when released_year between 1920 and 1929 then '1920 - 1929'
when released_year between 1930 and 1939 then '1930 - 1939'
when released_year between 1940 and 1949 then '1940 - 1949'
when released_year between 1950 and 1959 then '1950 - 1959'
when released_year between 1960 and 1969 then '1960 - 1969'
when released_year between 1970 and 1979 then '1970 - 1979'
when released_year between 1980 and 1989 then '1980 - 1989'
when released_year between 1990 and 1999 then '1990 - 1999'
when released_year between 2000 and 2009 then '2000 - 2009'
when released_year between 2010 and 2019 then '2010 - 2019'
when released_year between 2020 and 2029 then '2020 - 2029'
else 0
end as year_category
from split_genre
)

#select count(*) from split_genre; 
#After spliting the words, 1144 records there in genre column
#List of genre
#select distinct(genre) from split_genre order by genre;
#| genre       |
#| Action      |
#| Adventure   |
#| Animation   |
#| Biography   |
#| Comedy      |
#| Crime       |
#| Drama       |
#| Family      |
#| Fantasy     |
#| Film-Noir   |
#| History     |
#| Horror      |
#| Music       |
#| Musical     |
#| Mystery     |
#| Romance     |
#| Sci-Fi      |
#| Sport       |
#| Thriller    |
#| War         |
#| Western     |
#Count of unique genre - 21 
#select count(distinct(genre)) from split_genre order by genre;
#select * from genre_category;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Drama' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Action' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Adventure' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Animation' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Biography' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Comedy' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Crime' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Family' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Fantasy' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Film-Noir' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='History' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Music' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Musical' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Romance' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Sci-Fi' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Sport' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Thriller' order by year;
#select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='War' order by year;
select genre,year_category as year,count(genre) as count from genre_category group by genre,year_category having genre ='Western' order by year;

#Insights 
# 1. Drame, Action and Comedy genre is getting popular over years.
# 2. In 1990s,adventure film popularity was reduced compared to before years ,then after 2000s the adventure genre is trending.
# 3 . Animation genre getting popular from 1990s.
# 4. Only one Biography film was released in 1920s ,them no Biography film was released between 1930s,1940s,1950s,ie) over 30 years.
# 5. There is up and down trend in Crime and History genre.
# 6. Family,Fantasy genre got more popular in 2000s
# 7. film noir genre is diminished after 1960
# 8. Music and Musical genre are related but different, the popularity for music,musical,sport,war are less compared to other genre.
# 9. Thriller and Romance genre had a less popularity inbetween 1970s and 1980s.Then in 1990s,the trend got increased tremendously
# 10. Western genre got popular in 1960s but later,the trend got reduced gradually.




