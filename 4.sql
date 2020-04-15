set @createColumnCost=("alter table projects add cost float;");
set @dropColumnCost = (
	SELECT IF(
		(SELECT COUNT(1)
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE table_schema = 'gosqltask1'
        	and table_name = 'projects'
		AND column_name = 'cost'
        	) > 0,
		"alter table projects drop column cost;",
		/*else*/
		"drop table if exists neverExists;"
	)
);

PREPARE functionDropIfExist FROM @dropColumnCost;
EXECUTE functionDropIfExist;
DEALLOCATE PREPARE functionDropIfExist;

PREPARE functionCreate FROM @createColumnCost;
EXECUTE functionCreate;
DEALLOCATE PREPARE functionCreate;

update projects pr
inner join (select pr.project_name, sum(dev.salary) as value
	from projects pr
join link_developers_projects ldp
	on ldp.project_id = pr.id
join developers dev
	on dev.id=ldp.dev_id
group by pr.project_name) tmp
set pr.cost=tmp.value
where pr.project_name=tmp.project_name;