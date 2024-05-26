create database ej2;
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
   #1. ¿Que empleados van alfabéticamente antes que MARTIN?.
SELECT * FROM EMP WHERE ENAME  < 'MARTIN' order by ENAME ASC;
-- Miller , Scott , Smith , Turner , Ward
#2.Mostrar nombre, oficio y salario del los empleados del dpto 30 ordenados por oficio y salario en orden descendente
select ENAME,JOB,SAL from EMP where DEPTNO=30 order by JOB,SAL asc;
#3.Mostrar el nombre y salario total indicando "TOTAL" (salario + comisión) de todos los empleados que su nomina sea mayor que 1.800
select ENAME,SAL + coalesce (COMM,0) as TOTAL from EMP where SAL > 1.800;
#4.Obtener el nombre y el oficio de todos los empleados del dpto 30 que no sean vendedor (Salesman)
select ENAME,JOB from EMP where DEPTNO=30 and JOB !="SALESMAN";
#5. Nombre y oficio de los empleados del dpto 10 que no sean ni DIRECTOR ni PRESIDE (Manager - President)
SELECT ENAME, JOB 
FROM EMP WHERE DEPTNO=10 
AND JOB != "MANAGER"  AND JOB != "PRESIDENT";
#6. Obtener el nombre y el oficio de todos los empleados del dpto 30 que no sean vendedor (hazlo de forma distinta a la anterior)
SELECT ENAME, JOB 
FROM EMP 
WHERE DEPTNO = 10 
AND JOB <> 'SALESMAN';
#7.Mostrar todos los empleados que entraron en la empresa en 1.981
select  * from EMP where year (HIREDATE) =1981  ;
select  * from EMP where HIREDATE between "1981-01-01" and "1981-12-31";
#8.Mostrar el nombre de los empleados que alfabéticamente estén entre JAMES y SCOTT
select  ENAME from EMP where ENAME  BETWEEN 'JAMES' AND 'SCOTT' ORDER BY ENAME asc;
#9.Mostrar el nombre y la fecha de entrada de todos los empleados que no hayan entrado a trabajar en 1.981. Ordenar por fecha de entrada.
SELECT ENAME, HIREDATE FROM EMP WHERE YEAR(HIREDATE) != 1981 ORDER BY HIREDATE;
select  * from EMP where HIREDATE  not between "1981-01-01" and "1981-12-31";
#10.Mostrar nombre, oficio y comisión todos los empleados del dpto 30 que cobran comision
select ENAME,JOB,COMM from EMP where DEPTNO=30 and  COMM is not null and COMM >0;
#11.Mostrar nombre y oficio de todos los empleados que tengan una E en su nombre
select ENAME,JOB from EMP where ENAME like "%E%";
#12. Mostrar los empleados cuyo nombre tiene una A y después una S en su nombre. 
SELECT * FROM EMP WHERE ENAME LIKE '%A%S%';
#13. Mostrar los empleados cuyo nombre tiene una A y una S en su nombre; es decir, puede aparecer primero una A y después una S o al contrario.
SELECT * FROM EMP WHERE ENAME LIKE '%A%S%' OR '%S%A%';
#14. Mostrar un listado con la frase 'ename is a job' para cada uno de los empleados
SELECT CONCAT(ENAME, ' is a ', JOB) as TRABAJO FROM EMP;
#15. Mostrar los empleados que su jefe no sea 7782 o 7839
select * from EMP where MGR != 7782 and 7839;
#16. Mostrar nombre,salario y el salario aumentado un 1.25% de todos los empleados. Redondear a dos decimales.
SELECT ENAME,SAL, ROUND(SAL * 1.0125, 2) AS "NEW SALARY" FROM EMP;
#17. Mostrar la comisión media de los empleados de la empresa
select AVG(COMM) as "MEDIA DEL SALARIO" from EMP;
select SUM(COMM)/count(COMM)from EMP; 
#18. Mostrar cuantos perfiles profesionales (distintos job) hay en la empresa
select distinct JOB from EMP;
#19. NO HACER!!! (TODAVÍA - Hay que ver la función que trabaja con valores NULL): Mostrar la comisión media de los empleados teniendo en cuenta que si es NULL se cuentacomo cero. Redondear a dos decimales.
SELECT ROUND(AVG(COALESCE(COMM, 0)), 2) AS Comision_Media FROM EMP;
#20.NO HACER!!! (TODAVÍA - Hay que ver la función que trabaja con valores NULL) Mostrar el nombre, fecha de contratación y la suma y resta quince días a dicha fecha
SELECT ENAME, HIREDATE, 
HIREDATE + INTERVAL 15 DAY AS Suma_15_Dias,
HIREDATE - INTERVAL 15 DAY AS Resta_15_Dias
FROM EMP;