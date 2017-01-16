Tools
-------------

Test Repo
------------
testrepo.py test repo statistic generation

```bash
python testrepo.py -qe_cluster 172.23.105.177:8091 -repo_cluster 172.23.99.54:8091
```


Allows for the following query scenarios
```sql

--- how many total tests are there in all QE repositories? ---
SELECT sum(array_length (tests)),type FROM `conf` GROUP BY type

-- how many tests were added to each component last week? ---
SELECT SUM(ARRAY_LENGTH(new)) AS t_new, component
FROM `history`
WHERE ts >= '2017-01-09' AND ts <= '2017-01-15'  
GROUP BY component
 
--- how many tests were added to across the different QE teams last week? ---
SELECT SUM(ARRAY_LENGTH(new)) AS t_new, type
FROM `history`
WHERE ts >= '2017-01-09' AND ts <= '2017-01-15'  
GROUP BY type

--- show me a detail view of all changes that happened on a certain day ---
SELECT * FROM `history` WHERE ts == '2016-12-15'

--- when was build 4.6.0-3572 released? ---
SELECT ts from `builds` b USE KEYS '4.6.0-3572'
 
--- how many tests have been added to each component since build 4.6.0-3572 was released? ---
SELECT component, SUM(array_length(new)) as t_new, SUM(array_length(changed)) as t_changed, SUM(array_length(removed)) as t_removed
FROM `history` h WHERE
(SELECT ts from `builds` b USE KEYS '4.6.0-3572' WHERE h.ts > b.ts)
GROUP BY component
 
--- show me the specific tests added since build 4.6.0-3572 ---
SELECT new, changed, removed, component, subcomponent as component_sub
FROM `history` h WHERE
(SELECT ts from `builds` b USE KEYS '4.6.0-3572' WHERE h.ts > b.ts)
```
