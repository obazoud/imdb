---
Title: The Matrix

select
  t.id,
  t.title,
  t.production_year
from title as t
where 
  t.kind_id = 1
  and t.id = 2630223;

+---------+------------+-----------------+
| id      | title      | production_year |
+---------+------------+-----------------+
| 2630223 | The Matrix |            1999 |
+---------+------------+-----------------+

---
Directors

select
  n.name
from cast_info as dr
join name as n on n.id = dr.person_id
where
  movie_id = 2630223 
  and role_id = 8;

+-----------------+
| name            |
+-----------------+
| Wachowski, Andy |
| Wachowski, Lana |
+-----------------+

---
Writers

select
  n.name
from cast_info as dr
join name as n on n.id = dr.person_id
where
  movie_id = 2630223
  and role_id = 4;

+-----------------+
| name            |
+-----------------+
| Wachowski, Andy |
| Wachowski, Lana |
+-----------------+

---
Country

select
  info
from movie_info
where
  movie_id = 2630223
  and info_type_id = 8;
+-----------+
| info      |
+-----------+
| USA       |
| Australia |
+-----------+

---
Language

select
  info
from
  movie_info
where
  movie_id = 2630223
  and info_type_id = 4;
+---------+
| info    |
+---------+
| English |
+---------+

---
Cast

select
  n.name
from cast_info ac
join name as n on n.id = ac.person_id
where
  ac.movie_id = 2630223
  and ac.role_id in (1, 2)
  and ac.nr_order <= 5
order by ac.nr_order;

+---------------------+
| name                |
+---------------------+
| Reeves, Keanu       |
| Fishburne, Laurence |
| Moss, Carrie-Anne   |
| Weaving, Hugo       |
| Foster, Gloria      |
+---------------------+

---
Summary

select
  info
from movie_info
where
  movie_id = 2630223
  and info_type_id = 98
limit 1;

| Thomas A. Anderson is a man living two lives. By day he is an average computer programmer and by night a hacker known as Neo.... |

---
***Rating / Votes ***

select
  info
from movie_info
where
  movie_id = 2630223
  and info_type_id = 100;

---
Genres

select
  info
from movie_info
where
  movie_id = 2630223
  and info_type_id = 3;

+-----------+
| info      |
+-----------+
| Action    |
| Adventure |
| Sci-Fi    |
+-----------+
