-- Examen Base de Datos--
# 1:
select  c.country_name , count(c.country_name) 
from employee e  join department d  on e.department_id = d.department_id 
join location l on d.location_id = l.location_id 
join country c  on l.country_id  = c.country_id 
where c.country_name  like 'A%' 
group by c.country_name ;
#2:
select d.department_id , replace(d.department_name ,'r','R'), l.location_id 
from department d  join location l on d.location_id = l.location_id 
where d.department_name  like '%O%O%';
#3:
select c.country_id , c.country_name ,
case 
	when c.region_id = '10' then 'EUROPA'
	when c.region_id ='20' then 'AMERICA'
end as REGION
from country c 
where  c.region_id =  '20'or c.region_id ='10'  ;
#4:
select concat(e.last_name,',',e.first_name) as SUPERVISOR , count(e.manager_id) as EMPLEADOS
from employee e join department d  on e.department_id =d.department_id 
where e.employee_id = d.manager_id 
group  by e.employee_id  
order by count(e.employee_id) asc;
#5:
select concat(e.last_name,',',rpad(e.first_name,1,'?')) as EMPLEADOS , j.job_title as TRABAJO
from employee e   right join  job j  on e.job_id = j.job_id 
where not   e.employee_id = e.manager_id 
order by j.job_title ;
#6:
select l.city as CIUDAD  , j.job_title as EMPLEADO
from job j  join employee e on j.job_id = e.job_id 
join department d  on d.department_id = e.department_id 
join location l on l.location_id = d.location_id 
order by l.city ,j.job_title  asc;
#7:
select concat(e.last_name,',',e.first_name) as EMPLEADOS , 
date_format(hire_date, '%d-%b-%y') as COMIENZO , 
d.department_name as DEPARTAMENT
from employee e  join department d on e.department_id = d.department_id 
where month(e.hire_date) between 1 and 6; 
#8:
select  d.department_name  as DEPARTAMENTO , count(e.employee_id) as EMPLEADOS
from employee e join job_history jh on e.job_id = jh.job_id 
join department d on e.department_id = d.department_id 
where  year between jh.start_date  and jh.end_date  < 1
group by e.employee_id ;
#9:
select c.country_name , count(e.employee_id) , avg(e.salary)
from  country c  on l.country_id  = c.country_id
join department d  on e.department_id = d.department_id
join location l  on d.location_id =  l.location_id 
join employee e  
group by c.country_name 
having avg(e.salary) >= 3000 and max(e.salary) >= 15000;
#10:
select d.department_name , hour(e.hire_date) between jh.start_date and jh.end_date 
from employee e join job_history jh on e.job_id = jh.job_id 
join department d  on e.department_id  = d.department_id 
where year(jh.start_date) between 2005 and 2015;