  use ej2;
   #1:
   select  ENAME ,
   timestampdiff(year, HIREDATE, curdate()) as years,
   timestampdiff(month, HIREDATE, curdate()) as months
   from emp  
   where timestampdiff(year, HIREDATE, curdate()) > 10;
#2:
  select  d.DNAME , sum(char_length(e.ENAME))
  from dept d join emp e on e.DEPTNO = d.DEPTNO 
  group by d.DNAME  ;
  
 use ej2;
 #3:
 select  e.ename, e.hiredate
 from emp e 
 join emp e2 on e.EMPNO != e2.EMPNO
 where day(e.HIREDATE) = day(e2.HIREDATE) 
 and e.DEPTNO  = e2.DEPTNO  ;
 #4:
select d.DNAME , 
min(e.SAL),
max(e.SAL)
from emp e
join dept d  on d.DEPTNO =e.DEPTNO 
join salgrade s on (e.SAL between s.LOSAL  and s.HISAL)
group by d.DNAME ;
#5:
select ename,
sal
from emp e 
where month(HIREDATE) in (10,11,12);
#6:
select  d.dname , avg(e.sal)
from emp e 
join dept d  on e.DEPTNO =d.DEPTNO 
group by d.DNAME 
having max(sal) >= 3000
order by avg(sal) desc;
#7:
select concat(ltrim(ename) ,',',  job)
from emp e
where max(SAL);
  
  
  
  
  
  
  
  
  
     
    