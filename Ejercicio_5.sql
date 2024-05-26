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
   -- Ejercicio:
#1.	Muestra los números de departamento, número de empleados, máximo salario, mínimo salario y salario medio de cada uno de los departamentos. 
select  DEPTNO ,
count(*)as "NUMERO DE EMPLEADOS",
MAX(SAL),MIN(SAL),
avg(SAL) 
from EMP
group by DEPTNO; 

#2.	Muestra los diversos trabajos y el número total de empleados con cada grupo de trabajo que ganen más de 1500.
select JOB,
count(*) as "NUMERO DE EMPLEADOS"
from EMP
where SAL >1500 
group by JOB; 

#3.	Muestra los números de departamento y el salario total de los departamentos que tengan más de cuatro empleados.
select DEPTNO,SUM(SAL) as "SALARIO TOTAL" from EMP  group by DEPTNO having  count(*)>4; 
#4.	Crear un informe en el que se muestre el número de ‘CLERK’ y ‘SALESMAN’ se han contratado por cada mes del año. El informe debe estar ordenado por el mes del año. 
SELECT 
    EXTRACT(MONTH FROM hiredate) AS MES,
    COUNT(CASE WHEN job = 'CLERK' THEN 1 END) AS NUM_CLERK,
    COUNT(CASE WHEN job = 'SALESMAN' THEN 1 END) AS NUM_SALESMAN
FROM 
    emp
GROUP BY 
    EXTRACT(MONTH FROM hiredate)
ORDER BY 
    MES;

#5.	Análogamente al anterior, mostrar para cada mes de treinta días cuantos empleados de cada oficio se han contratado.
SELECT 
   month(Hiredate)  AS MES,
    sum(CASE WHEN job = 'CLERK' THEN 1 else 0 END) AS NUM_CLERK,
  sum(CASE WHEN job = 'SALESMAN' THEN 1 else 0 END) AS NUM_SALESMAN
FROM 
    emp
    where  day(LAST_DAY(hiredate)) = 30
GROUP BY 
    month(Hiredate) 
    order by   month(Hiredate) ;



#6.	Mostrar un informe que muestre para cada número de letras del nombre de empleado, cuantos empleados hay y su salario medio redondeado a dos decimales.
   
select  length(ENAME),COUNT(*),ROUND(AVG(SAL),2) from EMP group by ENAME;

#7.	Visualizar los números de departamento con más de tres empleados en cada departamento cuyo gasto salarial total del departamento sea mayor que 10,000.
select   DEPTNO,COUNT(*),SUM(SAL) from EMP group by DEPTNO having count(*) >3 and SUM(SAL)>10000; 

#8.	Mostrar para cada uno de los empleados que tiene subordinados a su cargo que número de subordinados y la suma total de sus salarios. El listado debe mostrar las cantidades formateadas y debe estar ordenado por número de subordinados descendentemente.
select  mgr as Jefe , count(ename) as numSubordinados,sum(sal) as suma
from emp 
where mgr is not null
group by jefe
order  by count(ename) desc;

#9.	Mostrar cuantos empleados de cada departamento tienen superior.
select  deptno,count(*)
from emp 
where  mgr is not null 
group by DEPTNO 

#10.	Mostrar cuantos empleados de cada oficio han entrado en cada año. Mostrar el año con cuatro cifras y el listado ordenado por año y por oficio.
select  job, year(hiredate) as año,count(ename) as numerosEmpleados
from emp 
group by job,año
order by año,job;
