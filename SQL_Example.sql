SELECT id, "name", email, "password", created_on
FROM public.students;
--1. Вывести все поля и все строки
select * from students
--  3. Вывести только Id пользователей
select "id" from students
--  4. Вывести только имя пользователей
select "name" from students
--  5. Вывести только email пользователей
select "email" from students
-- 6.  Вывести имя и email пользователей
select "name", "email" from students
-- 7. Вывести id, имя, email и дату создания пользователей
select "id", "name", "email", "created_on" from students
--  8. Вывести пользователей где password 12333
select * from students where "password" like '12333'
--  9. Вывести пользователей которые были созданы 2021-03-26 00:00:00
select * from students where "created_on" like '2021-03-26 00:00:00.000'
select timestamp '2021-03-26 00:00:00'
select * from students where "created_on" = '2021-03-26 00:00:00'
--  10. Вывести пользователей где в имени есть слово Анна
select * from students where "name" like 'Anna%'
--  11. Вывести пользователей где в имени в конце есть 8
select * from students where "name" like '%8'
--  12. Вывести пользователей где в имени есть буква а
select * from students where "name" like '%a'
--  13. Вывести пользователей которые были созданы 2021-07-12 00:00:00
select * from students where "created_on" =  '2021-07-12 00:00:00'
select timestamp '2021-07-12 00:00:00'
--  14. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и имеют пароль 1m313
select * from students where "created_on" = '2021-07-12 00:00:00' and "password" like '1m313'
--  15. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и у которых в имени есть слово Andrey
select * from students where "created_on" = '2021-07-12 00:00:00' and "name" like 'Andrey%'
--  16. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и у которых в имени есть цифра 8
select * from students where "created_on" = '2021-07-12 00:00:00' and "name" like '8%'
--  17. Вывести пользователя у которых id равен 110
select * from students where "id" = '110'
--  18. Вывести пользователя у которых id равен 153
select * from students where "id" = '153'
 -- 19. Вывести пользователя у которых id больше 140
select * from students where "id" > '140'
 -- 20. Вывести пользователя у которых id меньше 130
select * from students where "id" < '130'
 -- 21. Вывести пользователя у которых id меньше 127 или больше 188
select * from students where "id" < '127' or "id" > '188'
 -- 22. Вывести пользователя у которых id меньше либо равно 137
select * from students where "id" <= '137'
 -- 23. Вывести пользователя у которых id больше либо равно 137
select * from students where "id" >= '137'
 -- 24. Вывести пользователя у которых id больше 180 но меньше 190
select * from students where "id" > '180' and  "id" < '190'
 -- 25. Вывести пользователя у которых id между 180 и 190
select * from students where "id" between '180' and  '190'
 -- 26. Вывести пользователей где password равен 12333, 1m313, 123313
select * from students where "password" like '12333' or "password" like '1m313' or "password" like '123313'
 -- 27. Вывести пользователей где created_on равен 2020-10-03 00:00:00, 2021-05-19 00:00:00, 2021-03-26 00:00:00
select * from students where "created_on" = '2020-10-03 00:00:00' or "created_on" = '2021-05-19 00:00:00' or "created_on" = '2021-03-26 00:00:00'
 -- 28. Вывести минимальный id
 select min (id) from students
 -- 29. Вывести максимальный.
  select max (id) from students
 -- 30. Вывести количество пользователей
select count(id) from students
 -- 31. Вывести id пользователя, имя, дату создания пользователя. Отсортировать по порядку возрастания даты добавления пользоватлеля.
select "id", "name", "email", "created_on" from students order by "created_on" ASC
 -- 32. Вывести id пользователя, имя, дату создания пользователя. Отсортировать по порядку убывания даты добавления пользоватлеля.
select "id", "name", "email", "created_on" from students order by "created_on" DESC
-- SQL_DDL
-- Первая часть
-- Таблица employees
-- 	Создать таблицу employees
create table employees (
id serial primary key,
employee_name varchar(50) not null
);
-- 2.	Наполнить таблицу employees 70 строками
insert into employees(id, employee_name)
values (default,  '     Brandon Stephens   ');
	
-- Для самопроверки
select * from employees

-- Таблица salary
create table salary (
id serial primary key,
monthly_salary int not null
)

-- Для самопроверки
select * from salary
-- Наполнить таблицу salary 15 строками
insert into salary (id, monthly_salary)
values (default, 2500)
--Таблица employee_salary
-- Создать таблицу employee_salary
create table employee_salary (
id serial primary key,
employee_id int not null unique,
salary_id int not null
)
-- 	Наполнить таблицу employee_salary 40 строками
insert into employee_salary (employee_id, salary_id)
values (1, 1),


--Для самопроверки
select * from employee_salary
-- Таблица roles
--	Создать таблицу roles
create table roles (
id serial primary key,
role_name varchar(30) not null unique
)
-- Наполнить таблицу roles 20 строками
insert into roles(id, role_name)
values (default, 'Senior_Automation_QA_engineer')
--Для самопроверки
select * from roles
--Таблица roles_employee
-- Создать таблицу roles_employee
create table roles_employee (
id serial primary key,
employee_id int not null unique, 
role_id int not null,
foreign key (employee_id)
references employees (id),
foreign key (role_id)
references roles (id)
);
--Для самопроверки
select * from roles_employee
-- Наполнить таблицу roles_employee 40 строками
insert into roles_employee (employee_id, role_id)
values (1, 1),

--						ДОМАШКА №3 


-- Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами			
select  employee_name, monthly_salary  
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id;
-- Вывести всех работников у которых ЗП меньше 2000
select  employee_name, monthly_salary  
from employees 
join employee_salary 
on employees.id = employee_salary.employee_id 
join salary 
on employee_salary.salary_id = salary.id 
where monthly_salary<2000;
-- Вывести всех работников с названиями их должности
select employee_name, role_name
from employees
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id;
-- Вывести имена и должность только Java разработчиков
select employee_name, role_name
from employees
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like '%Java_developer';
-- Вывести имена и должность только Python разработчиков
select employee_name, role_name
from employees
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like '%Python_developer';
--Вывести имена и должность всех QA инженеров
select employee_name, role_name
from employees
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like '%QA_engineer';
--Вывести имена и должность ручных QA инженеров
select employee_name, role_name
from employees
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like '%Manual_QA_engineer';
-- Вывести имена и должность автоматизаторов QA
select employee_name, role_name
from employees
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like '%Automation_QA_engineer';

--Вывести имена и зарплаты Junior специалистов
select  employee_name, monthly_salary, role_name
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like 'Junior%';
-- Вывести имена и зарплаты Middle специалистов
 select  employee_name, monthly_salary, role_name
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like 'Middle%';
-- Вывести имена и зарплаты Senior специалистов
  select  employee_name, monthly_salary, role_name
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like 'Senior%';
-- Вывести зарплаты Java разработчиков
 
select   monthly_salary, role_name
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like '%Java_developer';
 -- Вывести зарплаты Python разработчиков
  select  monthly_salary, role_name
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like '%Python_developer';
-- Вывести имена и зарплаты Junior Python разработчиков
 select  employee_name, monthly_salary, role_name
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like '%Junior_Python_developer';
-- Вывести имена и зарплаты Middle JS разработчиков
 select  employee_name, monthly_salary, role_name
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like '%Middle_JavaScript_developer';
-- Вывести имена и зарплаты Senior Java разработчиков
  select  employee_name, monthly_salary, role_name
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like '%Senior_Java_developer';
-- Вывести зарплаты Junior QA инженеров
  select  monthly_salary, role_name
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like 'Junior_%_QA_engineer';
-- Вывести среднюю зарплату всех Junior специалистов
 select  avg(monthly_salary)
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like 'Junior%'
 -- Вывести сумму зарплат JS разработчиков
  select  SUM(monthly_salary)
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like '%JavaScript_developer'
-- Вывести минимальную ЗП QA инженеров
  select  min(monthly_salary)
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like '%QA_engineer'
-- Вывести максимальную ЗП QA инженеров
  select  max(monthly_salary)
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like '%QA_engineer'
-- Вывести количество QA инженеров
  select  count(employee_name)
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like '%QA_engineer'
-- Вывести количество Middle специалистов
  select  count(employee_name)
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like 'Middle%'
 -- Вывести количество разработчиков
   select  count(employee_name)
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like '%developer'
-- Вывести фонд (сумму) зарплаты разработчиков
   select  SUM(monthly_salary)
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where role_name like '%developer'
 -- Вывести имена, должности и ЗП всех специалистов по возрастанию
select  employee_name, monthly_salary, role_name
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
order by monthly_salary asc;
 -- Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select  employee_name, monthly_salary, role_name
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where monthly_salary between 1700 and 2300
order by monthly_salary asc;
 -- Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select  employee_name, monthly_salary, role_name
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where monthly_salary<2300
order by monthly_salary asc;
 -- Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select  employee_name, monthly_salary, role_name
from employees
join employee_salary 
on employees.id = employee_salary.employee_id
join salary 
on employee_salary.salary_id = salary.id
join roles_employee
on employees.id=roles_employee.employee_id 
join roles
on roles.id=roles_employee.role_id
where monthly_salary=1100 or monthly_salary=1500 or monthly_salary=2000
order by monthly_salary asc;

