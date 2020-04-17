-- Выбор самых оплачиваемых сотрудников из департаментов, топ 3 по зарплатам
-- Выбор каждого департамента вручную без использования лупа
select result.name,result.salary,dep.name 
from (
		select dev.name,dev.salary,dev.department_id
			from developers dev
		-- присоединяю выбор из уникальных топ 3 зп
		inner join (select distinct salary,department_id 
				from developers 
                where department_id = 1 
                order by salary 
                desc limit 3
			) tmp
			on dev.salary=tmp.salary and tmp.department_id=dev.department_id
	-- присоединяю следующий департамент
		union
		select dev.name,dev.salary,dev.department_id
			from developers dev
		-- присоединяю выбор из уникальных топ 3 зп
		inner join (select distinct salary,department_id 
						from developers 
						where department_id = 2 
						order by salary 
						desc limit 3
					) tmp
			on dev.salary=tmp.salary and tmp.department_id=dev.department_id
		union
	-- присоединяю следующий департамент
		select dev.name,dev.salary,dev.department_id
			from developers dev
		-- присоединяю выбор из уникальных топ 3 зп
		inner join (select distinct salary,department_id 
						from developers 
						where department_id = 3 
						order by salary 
						desc limit 3
					) tmp
			on dev.salary=tmp.salary and tmp.department_id=dev.department_id
		union
	-- присоединяю следующий департамент
		select dev.name,dev.salary,dev.department_id
			from developers dev
		-- присоединяю выбор из уникальных топ 3 зп
		inner join (select distinct salary,department_id 
						from developers 
						where department_id = 4 
						order by salary 
						desc limit 3
					) tmp
			on dev.salary=tmp.salary and tmp.department_id=dev.department_id) as result
-- присоединяю таблицу с названиями департаментов
inner join departments dep
on dep.id = result.department_id
