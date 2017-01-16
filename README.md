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

--- how many total tests are there in all QE repositories ---
SELECT sum(array_length (tests)),type FROM `conf` GROUP BY type
 
--- how many new tests added today ---
SELECT SUM(ARRAY_LENGTH(new)) AS t_new, component
FROM `history`
WHERE ts == '2016-12-15' GROUP BY component
 
--- filter for functional tests ---
SELECT SUM(ARRAY_LENGTH(new)) AS t_new, component
FROM `history`
WHERE ts == '2016-12-15' AND type=="functional"
GROUP BY component

--- show me a detail view of all changes that happened today ---
SELECT * FROM `history` WHERE ts == '2016-12-15'

--- when was a build released ---
SELECT ts from `builds` b USE KEYS '4.6.0-3552'
 
--- what tests have been added since a build ---
SELECT new, changed, removed, component, subcomponent as component_sub
FROM `history` h WHERE
(SELECT ts from `builds` b USE KEYS '4.6.0-3552' WHERE h.ts > b.ts)
 
--- give a component breakdown of history since a build ---
SELECT component, SUM(array_length(new)) as t_new, SUM(array_length(changed)) as t_changed, SUM(array_length(removed)) as t_removed
FROM `history` h WHERE
(SELECT ts from `builds` b USE KEYS '4.6.0-3552' WHERE h.ts > b.ts)
GROUP BY component
 
 
--- how many active tests are there in testrunner ---
select sum(array_length (tests)), component from `conf`
where type=="functional"
group by component
```
