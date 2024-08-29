#Analysis of the gross of a movie vs different - different stars.


with movie_star as
 (
select 
star1,
star2,
star3,
star4,
series_title,
imdb_rating,
gross,
sum(gross) over(partition by star1) as gross_wrt_star1,
sum(gross) over(partition by star2) as gross_wrt_star2,
sum(gross) over(partition by star3) as gross_wrt_star3,
sum(gross) over(partition by star4) as gross_wrt_star4
from imdb 
)
select series_title,
imdb_rating,
gross,
star1,gross_wrt_star1,dense_rank() over (order by gross_wrt_star1 desc) as star1_rank,
star2,gross_wrt_star2,dense_rank() over (order by gross_wrt_star2 desc) as star2_rank,
star3,gross_wrt_star3,dense_rank() over (order by gross_wrt_star3 desc) as star3_rank,
star4,gross_wrt_star4,dense_rank() over (order by gross_wrt_star4 desc) as star4_rank  
from movie_star 
order by gross desc,
star1_rank asc,star2_rank asc,star3_rank asc,star4_rank asc;

#Insights ,

#1.Star Wars : Episode VII - The force awakens had the highest gross among all the series and movies.
#2. For a movie, even when imdb rating is low,their gross is high because of actors influence .
#3. Below are the top 10 stars combinations that has the highest gross for a movie , actors influence on movie success
# rank | stars                                                                 | series_title                                 | gross        |  
# 1    | Daisy Ridley , John Boyega , Oscaar Isaac , Domhnall Gleeson          | Star Wars : Episode VII - The force awakens  | 93,66,62,225 |
# 2    | Joe Russo , Robert Downey Jr. , chris Evans , Mark Ruffalo            | Avengers: Endgame                            | 85,83,73,000 | 
# 3    | Sam Worthington , Zoe saldhana, Sigourney Weaver , Michelle Rodriguez | Avatar                                       | 76,05,07,625 | 
# 4    | Joe Russo , Robert Downey Jr. , Chris Hemsworth , Mark Ruffalo        | Avengers : Infinity war                      | 67,88,15,482 | 
# 5    | Leonardo Dicaprio , Kate Winslet , Billy Zane , Kathy Bates           | Titanic                                      | 65,93,25,379 | 
# 6    | Robert Downey Jr., Chris Evans , Scarlett Johansson , Jeremy Renner   | The Avengers                                 | 62,32,79,547 | 
# 7    | Craig T. Nelson, Holly Hunter , Sarah Vowell , Huck Milner            | Incredibles 2                                | 60,85,81,744 | 
# 8    | Christian Bale , Health Ledger , Aaron Eckhart , Michael Caine        | The Dark Knight                              | 53,48,58,444 | 
# 9    | Felicity Jones ,Diego Luna , Alan Tudyk , Donnie Yen                  | Rogue One                                    | 53,21,77,324 |
# 10   | Christian Bale , Tom Hardy , Anne Hathaway , Gary Oldman              | The Dark Knight Rises                        | 44,81,39,099 | 

#3.Top stars who impact to have highest gross for a movie
# rank | star1             | star2            | star3             | star4
# 1    | Joe Russo         | Emma Watson      | Rupert Grint      | Mark Ruffalo
# 2    | Tom Hanks         | Robert Downey Jr.| Carrie Fisher     | Domhnall Gleeson
# 3    | Leonardo Dicarpio | Chris Evans      | Sigourney Weaver  | Michelle Rodriguezz
# 4    | Daniel Radcliffe  | Ian Mckellen     | Oscar Isaac       | Michael Caine
# 5    | Christian Bale    | Zoe Saldana      | Chris Evans       | Orlando Bloom
 
 #4. Count of the different stars
 # Total number of star 1 - 548
 # Total number of star 2 - 688
 # Total number of star 3 - 722
 # Total number of star 4 - 762
 

#5. The correlation between imdb rating and gross earnings is less ,In this data, I saw that even ratings , scores are low for a particular movie but gross is high because of only directors or actors




