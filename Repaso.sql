use rrhh;
#Repaso Bases:
#1:
select e.employee_id , e.first_name ,e.last_name , d.department_name , l.city, c.country_name 
from employee e  join department d  on e.department_id = d.department_id 
join location l  on d.location_id = l.location_id 
join country c  on  l.country_id = c.country_id 
where e.manager_id  is null;
#2:
select d.department_name , avg(e.salary) , min(e.salary) , max(e.salary) , min(e.hire_date)
from  employee e  join department d on e.department_id =d.department_id 
group by d.department_name ;
having avg(e.salary) > 5000;