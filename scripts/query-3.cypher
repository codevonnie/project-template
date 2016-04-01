// This query shows the shortest path between main party leaders Enda Kenny and Micheál Martin
// Can also be displayed as just the number of hops


MATCH p=shortestPath(
  (a:Candidate {name:"Enda Kenny"})-[*]-(b:Candidate {name:"Micheál Martin"})
)
RETURN (nodes(p));



MATCH p=shortestPath(
  (a:Candidate {name:"Enda Kenny"})-[*]-(b:Candidate {name:"Micheál Martin"})
)
RETURN length(nodes(p)) as hops;