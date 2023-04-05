SELECT COALESCE(t.name, '-') AS person_name,
t.visit_date, COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM 
(SELECT person.name, visit_date, pizzeria_id
FROM person
LEFT JOIN 
(SELECT person_id, visit_date, pizzeria_id
FROM person_visits
WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') pv
ON person.id = pv.person_id) AS t
FULL JOIN pizzeria
ON pizzeria.id = t.pizzeria_id
ORDER BY 1,2,3;