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
#1. Mostrar el número de empleados que tiene la empresa y el número de empleados que cobran comisión
select count(*),count(COMM)from EMP;.
#2. Contar el número de empleados que hay en el departamento 20
select count(*) from EMP where DEPTNO =20;
#3. Contar el número de empleados que tiene la empresa en 1981
SELECT COUNT(*) as "Enpleados que tiene en 1981" FROM emp where HIREDATE  like '%1981%'; 
#4. Los salarios máximos y mínimos de aquellos empleados que tengan el oficio (job) CLERK
select MAX(SAL),min(SAL) from emp where JOB like  "CLERK";
#5. Salario medio de los empleados que su nombre empiece por J.
select AVG(SAL) from EMP where ENAME like "J%" ;
#7. Mostrar la suma del salario cuyo salario sea superior a 1800
select SUM(SAL) from EMP where SAL < 1800;
#8. Mostrar el numero de oficios hay en el departamento 10
select count(distinct JOB) from EMP where DEPTNO =10; 
#9. Mostrar para los empleados del dpto 20 el mensaje ‘Ename gana SAL Euros’. El campo ENAME esta la primera en mayúscula y las siguientes en minúscula.
select CONCAT(UPPER(LEFT(ENAME,1)),lower(substr(ENAME,2))," gana ",sal," Euros") from emp where DEPTNO = 20 ;
#10. Mostrar todos los empleados cuyo nombre tiene cinco o más caracteres.
   select * from emp where length(ENAME)>=5;