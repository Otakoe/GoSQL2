set @createColumnSalary=("alter table developers add salary float;");
set @dropColumnSalary = (
	SELECT IF(
		(SELECT COUNT(1)
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE table_schema = 'gosqltask1'
        and table_name = 'developers'
		AND column_name = 'salary'
        ) > 0,
		"alter table developers drop column salary;",
		/*else пустышка*/
        "drop table if exists neverExists;"
	)
);

PREPARE functionDropIfExist FROM @dropColumnSalary;
EXECUTE functionDropIfExist;
DEALLOCATE PREPARE functionDropIfExist;

PREPARE functionCreate FROM @createColumnSalary;
EXECUTE functionCreate;
DEALLOCATE PREPARE functionCreate;

update developers dev
join (select dev.id,sk.grade
	from developers dev
    join link_developers_skills lds
on dev.id=lds.dev_id
join skills sk
on sk.id=lds.skill_id) tmp
set dev.salary=600 where tmp.grade='Junior' and tmp.id=dev.id;

update developers dev
join (select dev.id,sk.grade
	from developers dev
    join link_developers_skills lds
on dev.id=lds.dev_id
join skills sk
on sk.id=lds.skill_id) tmp
set dev.salary=1200 where tmp.grade='Middle' and tmp.id=dev.id;

update developers dev
join (select dev.id,sk.grade
	from developers dev
    join link_developers_skills lds
on dev.id=lds.dev_id
join skills sk
on sk.id=lds.skill_id) tmp
set dev.salary=3000 where tmp.grade='Senior' and tmp.id=dev.id;


update developers dev
join (select dev.id,sk.skill_name
	from developers dev
    join link_developers_skills lds
on dev.id=lds.dev_id
join skills sk
on sk.id=lds.skill_id) tmp
set dev.salary=dev.salary+300 where tmp.skill_name='C++' and tmp.id=dev.id;

update developers dev
join (select dev.id,sk.skill_name
	from developers dev
    join link_developers_skills lds
on dev.id=lds.dev_id
join skills sk
on sk.id=lds.skill_id) tmp
set dev.salary=dev.salary+500 where tmp.skill_name='Java' and tmp.id=dev.id;

update developers dev
join (select dev.id,sk.skill_name
	from developers dev
    join link_developers_skills lds
on dev.id=lds.dev_id
join skills sk
on sk.id=lds.skill_id) tmp
set dev.salary=dev.salary+600 where tmp.skill_name='C#' and tmp.id=dev.id;

update developers dev
join (select dev.id,sk.skill_name
	from developers dev
    join link_developers_skills lds
on dev.id=lds.dev_id
join skills sk
on sk.id=lds.skill_id) tmp
set dev.salary=dev.salary+400 where tmp.skill_name='lua' and tmp.id=dev.id;
