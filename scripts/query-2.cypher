// This query returns all elected Independent candidates and their constituencies who were elected
// in a constituency with 3 or less seats.


MATCH
(n:Candidate)-[r:RAN_IN]->(m:Constituency)
WHERE
toInt(m.seats)<=3 AND n.party Contains "Independent" AND n.result STARTS WITH "elected"
RETURN m, n;