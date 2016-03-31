// This query returns all female candidates who were elected in a constituency
// with a population of greater than 150,000 people along with their constituency.


MATCH
(n:Candidate)-[r:RAN_IN]->(m:Constituency)
WHERE
toInt(m.population)>=150000 AND n.gender Contains "Female" AND n.result STARTS WITH "elected"
RETURN m, n;