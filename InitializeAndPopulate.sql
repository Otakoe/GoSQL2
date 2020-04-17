use gosqltask1;
-- Создание и вызов функции удаления fk если был
set @dropFk_devdep=(
	select if(
		(SELECT count(1) 
        FROM information_schema.TABLE_CONSTRAINTS
            where table_schema = 'gosqltask1'
        	and table_name = 'developers'
            and CONSTRAINT_NAME   = 'fk_devdep' 
            AND CONSTRAINT_TYPE   = 'FOREIGN KEY') >0,
            "alter table developers drop foreign key fk_devdep;",
            "drop table if exists neverExists;"));
prepare functionDropFkIfExists from @dropFk_devdep;
execute functionDropFkIfExists;
deallocate prepare functionDropFkIfExists;

-- Инициализация таблицы департаменты
drop table if exists departments;
create table departments(
	id int auto_increment,
    name varchar(45),
    primary key(id));
 
	
-- Создание и вызов функции удаления fk если был
set @dropFk_devdep=(
	select if(
		(SELECT count(1) 
        FROM information_schema.TABLE_CONSTRAINTS
            where table_schema = 'gosqltask1'
        	and table_name = 'developers'
            and CONSTRAINT_NAME   = 'fk_devdep' 
            AND CONSTRAINT_TYPE   = 'FOREIGN KEY') >0,
            "alter table developers drop foreign key fk_devdep;",
            "drop table if exists neverExists;"));
prepare functionDropFkIfExists from @dropFk_devdep;
execute functionDropFkIfExists;
deallocate prepare functionDropFkIfExists;
-- Создание и вызов функции удаления колонки если она была
set @dropColumnDepartment_id = (
SELECT IF(
	(SELECT COUNT(1)
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'gosqltask1'
        	and table_name = 'developers'
	AND column_name = 'department_id'
        	) > 0,
		"alter table developers drop column department_id;",
        /*else*/
		"drop table if exists neverExists;"
	)
);
PREPARE functionDropIfExist FROM @dropColumnDepartment_id;
EXECUTE functionDropIfExist;
-- Создание и вызов функции удаления fk если был
set @dropFk_devdep=(
	select if(
		(SELECT count(1) 
        FROM information_schema.TABLE_CONSTRAINTS
            where table_schema = 'gosqltask1'
        	and table_name = 'developers'
            and CONSTRAINT_NAME   = 'fk_devdep' 
            AND CONSTRAINT_TYPE   = 'FOREIGN KEY') >0,
            "alter table developers drop foreign key fk_devdep;",
            "drop table if exists neverExists;"));
prepare functionDropFkIfExists from @dropFk_devdep;
execute functionDropFkIfExists;
deallocate prepare functionDropFkIfExists;

-- Инициализация таблицы департаменты
drop table if exists departments;
create table departments(
	id int auto_increment,
    name varchar(45),
    primary key(id));
 
	
-- Создание и вызов функции удаления fk если был
set @dropFk_devdep=(
	select if(
		(SELECT count(1) 
        FROM information_schema.TABLE_CONSTRAINTS
            where table_schema = 'gosqltask1'
        	and table_name = 'developers'
            and CONSTRAINT_NAME   = 'fk_devdep' 
            AND CONSTRAINT_TYPE   = 'FOREIGN KEY') >0,
            "alter table developers drop foreign key fk_devdep;",
            "drop table if exists neverExists;"));
prepare functionDropFkIfExists from @dropFk_devdep;
execute functionDropFkIfExists;
deallocate prepare functionDropFkIfExists;
-- Создание и вызов функции удаления колонки если она была
set @dropColumnDepartment_id = (
SELECT IF(
	(SELECT COUNT(1)
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'gosqltask1'
        	and table_name = 'developers'
	AND column_name = 'department_id'
        	) > 0,
		"alter table developers drop column department_id;",
        /*else*/
		"drop table if exists neverExists;"
	)
);
PREPARE functionDropIfExist FROM @dropColumnDepartment_id;
EXECUTE functionDropIfExist;
DEALLOCATE PREPARE functionDropIfExist;
-- Создание и вызов функции создания колонки
set @createColumnDepartment_id=("alter table developers add department_id int,
					add constraint fk_devdep FOREIGN KEY (department_id)
					references departments(id);");	
PREPARE functionCreate FROM @createColumnDepartment_id;
EXECUTE functionCreate;
DEALLOCATE PREPARE functionCreate;

-- Заполнение таблицы департаменты
alter table developers drop foreign key fk_devdep;
truncate table departments;
alter table developers 
	add constraint fk_devdep FOREIGN KEY (department_id) 
    references departments(id);
insert into departments (name) values
	('IT'),
    ('Sales'),
    ('Accountant'),
    ('Comunity manager');
    
-- Дополнение таблицы девелоперов
delete from developers where id>9;
alter table developers auto_increment=10;
insert into developers (name,age,sex,salary) values
	('Vadik',25,'male',500),
    ('Vladik',24,'male',700),
    ('Valera',27,'male',800),
    ('Valya',33,'female',600),
    ('Grisha',31,'male',1100),
    ('Galya',29,'female',800),
    ('Dasha',38,'female',1200),
    ('Diana',40,'female',600),
    ('Dima',50,'male',700),
    ('Denis',45,'male',800),
    ('Edik',36,'male',800),
    ('Asan',43,'male',900),
    ('Feride',41,'female',900),
    ('Lumumba',33,'male',900),
    ('Bobie',63,'male',1100);
    
-- Добавление департамента каждому (связь 1-1)
update developers
set department_id = null;
update developers
join (select distinct id,lds.skill_id from developers dev
			left join link_developers_skills lds
            on lds.dev_id=dev.id
		  ) tmp
set department_id=1
where tmp.id=developers.id and tmp.skill_id is not null;

update developers
set department_id = 2
where id in (10,13,17,11,20,19);
update developers
set department_id = 3
where id in (12,14,18,22);
update developers
set department_id = 4
where id in (15,16,19,23,21,24);