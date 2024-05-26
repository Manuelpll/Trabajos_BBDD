use ej2;
CREATE TABLE DEPT (
    DEPTNO INT PRIMARY KEY,
    DNAME VARCHAR(14),
    LOC VARCHAR(13)
);

CREATE TABLE EMP (
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR INT,
    HIREDATE DATE,
    SAL DEC(7,2),
    COMM DEC(7,2),
    DEPTNO INT
);


ALTER TABLE EMP ADD CONSTRAINT fk_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO);

INSERT INTO DEPT VALUES
    (10,'ACCOUNTING','NEW YORK'),
    (20,'RESEARCH','DALLAS'),
    (30,'SALES','CHICAGO'),
    (40,'OPERATIONS','BOSTON');

INSERT INTO EMP VALUES
    (7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
    (7499,'ALLEN','SALESMAN',7698,'1981-2-20',1600,300,30),
    (7521,'WARD','SALESMAN',7698,'1981-2-22',1250,500,30),
    (7566,'JONES','MANAGER',7839,'1981-4-2',2975,NULL,20),
    (7654,'MARTIN','SALESMAN',7698,'1981-9-28',1250,1400,30),
    (7698,'BLAKE','MANAGER',7839,'1981-5-1',2850,NULL,30),
    (7782,'CLARK','MANAGER',7839,'1981-6-9',2450,NULL,10),
    (7788,'SCOTT','ANALYST',7566,'1987-7-13',3000,NULL,20),
    (7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
    (7844,'TURNER','SALESMAN',7698,'1981-9-8',1500,0,30),
    (7876,'ADAMS','CLERK',7788,'1987-7-13',1100,NULL,20),
    (7900,'JAMES','CLERK',7698,'1981-12-3',950,NULL,30),
    (7902,'FORD','ANALYST',7566,'1981-12-3',3000,NULL,20),
    (7934,'MILLER','CLERK',7782,'1982-1-23',1300,NULL,10);

CREATE TABLE BONUS (
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    SAL DEC(7,2),
    COMM DEC(7,2)
);

CREATE TABLE SALGRADE (
    GRADE INT,
    LOSAL INT,
    HISAL INT
);

INSERT INTO SALGRADE VALUES (1,700,1200),
    (2,1201,1400),
    (3,1401,2000),
    (4,2001,3000),
    (5,3001,9999);
   #EJERCICIO:
-- 1.	Mostrar el nombre y salario de todos los empleados que trabajan en Chicago.
SELECT e.ENAME , e.SAL
FROM emp e
JOIN dept d on(e.deptno=d.deptno)
WHERE d.LOC = "CHICAGO";

-- 2.	Mostrar el nombre, el oficio y el nombre de departamento en que trabajan de todos los empleados que ganan en un salario entre 1500 y 2000.
select e.ename,e.job,d.dname from emp e join dept d on (e.DEPTNO= d.DEPTNO) where e.SAL  between  1500 and 2000;
-- 3.	Mostrar las parejas de empleados cuyo primer componente es un MANAGER y cuya suma de salarios esta entre 3750 y 4000.
##Solucion con cross
select e1.ename,e1.job,e2.ename,e2.job,(e1.sal + e2.sal) as sumaSalario
from emp e1 cross join emp e2 
where  e1.job='MANAGER' and (e1.sal + e2.sal) between 3750 and 4000;
##Otra posible solucion
select e1.ename,e1.job,e2.ename,e2.job,(e1.sal + e2.sal) as sumaSalario
from emp e1 join emp e2 on(e1.EMPNO <> e2.EMPNO) where  e1.job='MANAGER' and (e1.sal + e2.sal) between 3750 and 4000;

-- 4.	Mostrar un resumen de salarios medios de las combinaciones de MANAGER-EMPLEADO (distinto a MANAGER).


-- 5.	Mostrar un informe que muestre el nombre de empleado, el salario y la categoría salarial indicada con tantos asteriscos como grado salarial de todos los empleados que son SALESMAN
select  e.ename,e.sal,s.grade,rpad('*',s.grade,'*')
from emp e join salgrade s on (e.sal between s.LOSAL and s.HISAL)
where e.JOB ='SALESMAN';
#Es valida la siguiente solucion pero no hace lo mismos porque esto repite una cadena de texto no lo pone a la derecha o a la izquierda:
select  e.ename,e.sal,s.grade,repeat('*',s.grade)
from emp e join salgrade s on (e.sal between s.LOSAL and s.HISAL)
where e.JOB ='SALESMAN';
-- 6.	Indicar el nombre y el salario de los empleados que trabajan en DALLAS y que tienen una categoría salarial cuatro.
select e.ename,e.sal from emp e
join dept d on d.DEPTNO = e.DEPTNO 
join salgrade s on (e.sal between s.LOSAL and s.HISAL)
where d.LOC ='Dallas' and s.GRADE =4;-
-- 7.	Mostrar un informe con el nombre de departamento y el número de empleados que tiene adscrito. Deben aparecer todos los departamentos, si no tiene empleados se debe mostrar un cero.
#No estaria bien si en el count pusiesemos * porque al poner * contaria todas las filas aunque sean nulas
select d.dname,count(e.ename) as numEmpleados
from dept d left join emp e on(d.DEPTNO = e.DEPTNO)
group by d.DNAME;
-- 8.	Mostrar un informe con la categoría salarial, el número de empleados que tienen esa categoría salarial y la suma de los salarios ordenado por categoria salarial. Se debe tener en cuenta que es posible que categoría salarial que no la tenga ningún empleado.
select s.grade,count(e.ename),sum(e.sal)
from salgrade s  left join emp e on (e.SAL between s.LOSAL and s.HISAL)
group  by s.GRADE 
order by s.GRADE ;

-- 9.	Mostrar el un informe que indique cuantos empleados hay en cada ciudad que no tienen personal a su cargo. Deben aparecer todas las ciudades.
-- ***PISTA: Como primer paso se puede hacer esto, para ver los empleados que no tienen personal a su cargo ***PISTA
select d.loc,count(e1.ENAME) 
from dept d left join emp e1 on (d.DEPTNO=e1.DEPTNO)
left join emp e2  on (e2.MGR = e1.empno)
where e2.ENAME  is  null
group by d.loc;

-- 10.	Mostrar el nombre y categoría salarial de los empleados y sus superiores que cumplen la condición de que ambos trabajen en la misma ciudad.
