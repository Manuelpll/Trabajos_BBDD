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
#11. Mostrar la media del salario de los empleados cuyo oficio tenga 7 caracteres
   
select 
avg(Sal) 
from EMP
where length(JOB) >=7 ; 

#12. Mostrar el nombre añadiendo un * por la derecha y dicho nombre añadiendo un asterisco
#por la izquierda a todos los empleados del dpto 10. En ambos casos se debe alcanzar una
#longitud de 10 caracteres.

SELECT CONCAT('*', ENAME, '*') FROM emp WHERE LENGTH(ENAME) = 10; -- no vale
select 
rpad(Ename,10,"*")as derecha,
lpad(Ename,10,"*") as izquierda
from emp 
where DEPTNO =10;

#13.Eliminar los caracteres asterisco a las cadenas '*****PEPITO', 'MANOLITA*****' y a la
#cadena de caracteres '*******LOLO*****' (FROM DUAL)
select trim(leading"*" from '*****PEPITO'),
trim(trailing"*" from 'MANOLITA*****'  ),
trim(both "*" from  '*******LOLO*****')
from dual;

#14. Mostrar la fecha correspondiente a cinco meses después de la fecha del sistema. (FROM DUAL)

select 
date_add(sysdate() ,interval 5 month) 
from DUAL;

#15. Mostrar el último día de este mes. (FROM DUAL)

select 
last_day(sysdate()) 
from dual;

#16. Mostrar cuantos meses llevan trabajando los empleados cuyo oficio es MANAGER.
#Redondear el resultado a dos decimales.


select ENAME,round(timestampdiff(month,hiredate,sysdate()),2)
from emp 
where  JOB ='MANAGER' ;

select  ename,
round((extract(year from sysdate())-extract(year from hiredate))*12,2) 
from emp
where  JOB ='MANAGER' ;

#17.  Mostrar cuantos meses, años y trienios cumplidos llevan trabajando los empleados cuyo
#oficio es MANAGER. Redondear el resultado a dos decimales.

select ENAME,
round(timestampdiff(month,hiredate,sysdate()),2) as Meses,
round(timestampdiff(year ,hiredate,sysdate()),2) as Años,
round(timestampdiff(year ,hiredate,sysdate())/3,2) as trienios
from emp 
where  JOB ='MANAGER' ;
 
 #19. Mostrar para todos los empleados que sean CLERK la fecha de ingreso, diez días mas y diez
#días menos
   
SELECT 
    *,
    DATE_ADD(hiredate, INTERVAL 10 DAY) AS "10 dias más",
    DATE_SUB(hiredate, INTERVAL 10 DAY) AS "10 dias menos"
FROM 
    emp
WHERE 
    job = 'CLERK';
   
#20. Mostrar un listado con el nombre, salario y comisión de los empleados del dpto 30. si no
#tiene comisión, poner 0
   
select 
ENAME,
SAL,
coalesce(COMM,0) 
from EMP
where DEPTNO =30;

#21. Mostrar un listado con el nombre, salario, comisión y el total de lo que va a cobrar de los
#empleados del dpto 30. si no tiene comisión, poner ‘---’

select 
ENAME,
SAL,
coalesce(COMM,"---"),
coalesce (SAL+COMM,"---") as TOTAL
from emp 
where DEPTNO =30;

#22.Para todos los empleados cuyo nombre tiene una A, mostrar un listado con el nombre,
#comisión y la cadena 'TIENE' en el caso de que tenga comisión y 'NO TIENE' en caso
#contrario.

SELECT 
    CONCAT(ENAME, ' TIENE ', IFNULL(COMM, 'NO TIENE')) AS nombre_y_comision
FROM 
    emp
WHERE 
    ENAME LIKE '%A%';

#23. Mostrar el nombre la fecha y la fecha en formato 'DD-MM-YYYY' de todos empleados que
#sean CLERK

select 
ENAME,
HIREDATE,DATE_FORMAT(hiredate, '%d-%m-%Y') AS fecha_de_ingreso_formato 
from EMP 
where JOB="CLERK";


 #24. Mostrar el nombre y la fecha de entrada de los empleados que han entrado en la empresa en
#el mes de Febrero.

select 
ENAME,
HIREDATE 
from EMP 
where  monthname(HIREDATE)="FEBRUARY";


# 25. Igual que en el caso anterior, pero solo se puede comparar con la cadena de texto 'FEB'

select 
ENAME,
HIREDATE 
from EMP
where  DATE_FORMAT(hiredate, '%b') = 'FEB';

#26. ¿Cuantos empleados entraron a trabajar un Viernes?.

select count(*) 
from EMP 
where
DAYOFWEEK(hiredate) = 6;

#27. Hacer un listado de los nombres de empleado que tienen un letra A, una letra C o bien tiene
#las dos letras. El resultado son dos columnas una con el resultado en cuestión y otra con una explicación: 'TIENE UNA A', 'TIENE UNA C', 'TIENE AMBAS LETRAS'

SELECT 
    ENAME AS nombre,
    CASE
        WHEN ENAME LIKE '%A%' AND ENAME LIKE '%C%' THEN 'TIENE AMBAS LETRAS'
        WHEN ENAME LIKE '%A%' THEN 'TIENE UNA A'
        WHEN ENAME LIKE '%C%' THEN 'TIENE UNA C'
        ELSE 'NO TIENE'
    END as RESULTADOS
FROM 
    EMP
WHERE 
    ENAME LIKE '%A%' OR ENAME LIKE '%C%';
#28. Mostrar un listado con el nombre, fecha de entrada y la cadena 'PRIMER TRAMO', si
#entraron a trabajar desde Enero a Junio, 'SEGUNDO TRAMO' si entraron a trabajar desde
#Julio a Octubre 'TERCER TRAMO' y en caso contrario.
   
select 
ENAME,
HIREDATE,
 CASE
        WHEN MONTH(hiredate) BETWEEN 1 AND 6 THEN 'PRIMER TRAMO'
        WHEN MONTH(hiredate) BETWEEN 7 AND 10 THEN 'SEGUNDO TRAMO'
        ELSE 'TERCER TRAMO'
    END AS "tramo de ingreso"
    from 
    emp;

#29. Mostrar la suma del salario de los empleados cuyo salario es superior a 1.800.
   
select 
SUM(SAL )
from EMP 
where SAL < 1800;

#30. ¿Cuantos oficios diferentes hay en el dpto 10?.

select
COUNT(distinct(JOB)) 
from EMP
where DEPTNO =10;

#31. Mostrar la media del salario de los empleados cuyo oficio tenga 7 caracteres.

select
avg(SAL )
from emp 
where length (JOB) >= 7;
