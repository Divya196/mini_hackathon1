#Director's Impact on Earnings: Analyze how movies directed by different directors perform in terms of gross earnings.
# Are there any noticeable trends or patterns?
use hackathon;
select * from imdb;
select count(distinct(director)) from imdb;
# Top 5 directors name who directed more films 
select distinct(director),count(series_title) over (partition by director) as count from imdb order by count desc;
#Alfred Hitchcock	14
#Steven Spielberg	12
#Hayao Miyazaki	11
#Akira Kurosawa	10
#Martin Scorsese 10

select series_title,director,gross,imdb_rating from imdb where director = 'Alfred Hitchcock';
select series_title,director,gross,imdb_rating from imdb where director = 'Steven Spielberg';
select series_title,director,gross,imdb_rating from imdb where director = 'Hayao Miyazaki';
select series_title,director,gross,imdb_rating from imdb where director = 'Akira Kurosawa';
# Movies directed by Akira Kurosawa has 8 to 9 imdb rating. 
select series_title,director,gross,imdb_rating from imdb where director = 'Martin Scorsese';

#directors that got the highest gross
select director,series_title,gross from imdb order by gross desc limit 10;
#J.J. Abrams	    |Star Wars: Episode VII - The Force Awakens	|936662225
#Anthony Russo	    |Avengers: Endgame	                        |858373000
#James Cameron	    |Avatar	                                    |760507625
#Anthony Russo	    |Avengers: Infinity War	                    |678815482
#James Cameron	    |Titanic	                                  |659325379
#Joss Whedon	      |The Avengers	                              |623279547
#Brad Bird	        |Incredibles 2	                            |608581744
#Christopher Nolan	|The Dark Knight	                          |534858444
#Gareth Edwards	    |Rogue One	                                |532177324
#Christopher Nolan	|The Dark Knight Rises	                    |448139099
select series_title,released_year,director,gross,imdb_rating from imdb where director like '%J.J. Abrams%' order by gross desc;
#Every series directed by J.J. Abrams , the name starts with the word 'STAR'
select series_title,released_year,director,gross,imdb_rating from imdb where director = 'Anthony Russo' order by gross desc;
# Two series in Avengers,Infinity War and Endgame had the highest gross, directed by Anthony Russo , that comes under top 10 highest gross.
select series_title,released_year,director,gross,imdb_rating from imdb where director = 'James Cameron' order by gross desc;
#Avator and titanic are the two films directed  by James Cameron with highest gross, that comes under top 10 highest gross.
select series_title,released_year,director,gross,imdb_rating from imdb where director = 'Christopher Nolan' order by gross desc;
select series_title,released_year,star1,star2,star3,star4,director,gross,imdb_rating from imdb where director like '%Christopher Nolan%';
# Christopher Nolan and Christian Bale,Michael Caine combination makes the hit commerically.
# The Dark Knight and The Dark Knight Rises are the two films directed by Christopher Nolan ,that comes under top 10 highest gross.
# The Dark Knight directed by Christopher Nolan was released in 2008 has the highest gross,The Dark Knight Rises released in 2012 was low compared to that and even many films released after that couldnot get that gross.
select series_title,director,gross,imdb_rating from imdb where director = 'Joss Whedon'order by gross desc;
#Only 2 films directed by Joss Whedon , where - 'The Avengers' got the highest gross compared to film 'serenity
select series_title,director,gross,imdb_rating from imdb where director = 'Gareth Edwards';	
# 1 film was directed by Gareth Edwards, that got the highest gross that comes under top 10
select series_title,director,gross,imdb_rating from imdb where director = 'Brad Bird';
# 4 film was directed by Brad Bird, even The Incredibles had less gross compared to Incredibles 2.
select series_title,released_year,star1,star2,star3,star4,director,gross,imdb_rating from imdb where series_title like '%Incredibles%';
select series_title,released_year,star1,star2,star3,star4,director,gross,imdb_rating from imdb where series_title like '%avengers%';
# Actors influence more in avengers to make the series hit commerically.



#Insights:
# There are 541 unique directors in the given data
# Top 5 directors name who directed more films are not in the 'highest gross given directors' list.
# Two series in Avengers,Infinity War and Endgame had the highest gross, directed by Anthony Russo , that comes under top 10 highest gross.
# Avator and titanic are the two films directed  by James Cameron with highest gross, that comes under top 10 highest gross.
# director - Christopher Nolan and stars - Christian Bale,Michael Caine combination makes the hit commerically.
# The Dark Knight and The Dark Knight Rises, directed by Christopher Nolan ,that comes under top 10 highest gross.
# The Dark Knight directed by Christopher Nolan was released in 2008 has the highest gross,The Dark Knight Rises released in 2012 having less gross compared to that and even many films released after that couldnot get that gross.
# Only 2 films directed by Joss Whedon , where - 'The Avengers' got the highest gross compared to film 'serenity
# 1 film was directed by Gareth Edwards, that got the highest gross that comes under top 10
# 4 film was directed by Brad Bird, even The Incredibles had less gross compared to Incredibles 2.
# Actors influence more in avengers to make the series hit commerically.
# For majority cases, there is a trend that gross increases with respect to increase in years for part 2 series.
# In given data, Every series directed by J.J. Abrams , the name started with the word 'STAR'
