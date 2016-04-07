# Irish Constituencies Neo4j Database
###### Yvonne Grealy, G00306806

## Introduction
This project consists of Neo4j graph database which contains information regarding the Irish General Election that took place in 2016. It also contains three queries written in Cypher which analyses the data included in the database.  


## Database
The database was created in multiple parts.  The first table I created was the Constituencies table which contained information for each of the constituencies in Ireland with their name, the population of that constituency and how many seats were being contested.  The second table created was the Candidate table.  This contained information for each candidate who ran in the election and included their name, gender, whether or not they were elected, the party they belonged to and the constituency in which they ran.  The final table was the Party table. This table contained the name of every party that was represented in the election and the leader(s), if any, of the party.  

## Queries
I considered a number of queries for the project but eventually settled on the following three.  I believe each of the three queries gives an interesting and analytical description of how the election went.

#### Query one
This query returns all female candidates who were elected in a constituency with a population of greater than 150,000 people along with their constituency.

```cypher
MATCH
(n:Candidate)-[r:RAN_IN]->(m:Constituency)
WHERE
toInt(m.population)>=150000 AND n.gender Contains "Female" AND n.result STARTS WITH "elected"
RETURN m, n;
```

#### Query two
This query returns all elected Independent candidates and their constituencies who were elected in a constituency with 3 or less seats.
```cypher
MATCH
(n:Candidate)-[r:RAN_IN]->(m:Constituency)
WHERE
toInt(m.seats)<=3 AND n.party Contains "Independent" AND n.result STARTS WITH "elected"
RETURN m, n;
```

#### Query three
This query shows the shortest path between main party leaders Enda Kenny and Micheál Martin. 

```cypher
MATCH p=shortestPath(
  (a:Candidate {name:"Enda Kenny"})-[*]-(b:Candidate {name:"Micheál Martin"})
)
RETURN (nodes(p));
```
Can also be displayed as just the number of hops
```cypher
MATCH p=shortestPath(
  (a:Candidate {name:"Enda Kenny"})-[*]-(b:Candidate {name:"Micheál Martin"})
)
RETURN length(nodes(p)) as hops;
```

## References
1. [Neo4J website](http://neo4j.com/), the website of the Neo4j database and manual.
2. [Irish Political Maps](http://irishpoliticalmaps.blogspot.be/2015/06/confirmed-candidates-for-next-general_3.html), candidate, party and constituency information
3. Learning Cypher - Onofrio Panzarino
4. [DATA.GOV.IE] (https://data.gov.ie/data/search?res_format=CSV&metadata_created=%5B2015-12-00T00%3A00%3A01Z+TO+2016-1-00T00%3A00%3A01Z%5D&sort=date_released+desc), statistics regarding election
5. [RTE News] (http://www.rte.ie/news/election-2016/candidates/), candidate information