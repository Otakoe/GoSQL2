alter table developers
drop column salary;
alter table developers
add salary float;

update developers as dev
join (select dev.id,sk.grade
	from developers as dev
    join link_developers_skills as lds
on dev.id=lds.dev_id
join skills as sk
on sk.id=lds.skill_id) as tmp
set dev.salary=600 where tmp.grade='Junior' and tmp.id=dev.id;

update developers as dev
join (select dev.id,sk.grade
	from developers as dev
    join link_developers_skills as lds
on dev.id=lds.dev_id
join skills as sk
on sk.id=lds.skill_id) as tmp
set dev.salary=1200 where tmp.grade='Middle' and tmp.id=dev.id;

update developers as dev
join (select dev.id,sk.grade
	from developers as dev
    join link_developers_skills as lds
on dev.id=lds.dev_id
join skills as sk
on sk.id=lds.skill_id) as tmp
set dev.salary=3000 where tmp.grade='Senior' and tmp.id=dev.id;


update developers as dev
join (select dev.id,sk.skill_name
	from developers as dev
    join link_developers_skills as lds
on dev.id=lds.dev_id
join skills as sk
on sk.id=lds.skill_id) as tmp
set dev.salary=dev.salary+300 where tmp.skill_name='C++' and tmp.id=dev.id;

update developers as dev
join (select dev.id,sk.skill_name
	from developers as dev
    join link_developers_skills as lds
on dev.id=lds.dev_id
join skills as sk
on sk.id=lds.skill_id) as tmp
set dev.salary=dev.salary+500 where tmp.skill_name='Java' and tmp.id=dev.id;

update developers as dev
join (select dev.id,sk.skill_name
	from developers as dev
    join link_developers_skills as lds
on dev.id=lds.dev_id
join skills as sk
on sk.id=lds.skill_id) as tmp
set dev.salary=dev.salary+600 where tmp.skill_name='C#' and tmp.id=dev.id;

update developers as dev
join (select dev.id,sk.skill_name
	from developers as dev
    join link_developers_skills as lds
on dev.id=lds.dev_id
join skills as sk
on sk.id=lds.skill_id) as tmp
set dev.salary=dev.salary+400 where tmp.skill_name='lua' and tmp.id=dev.id;
