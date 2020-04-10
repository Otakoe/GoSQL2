select avg(dev.salary)
	from developers as dev
    join link_developers_projects as ldp
	on ldp.dev_id=dev.id
    join projects as pr
	on pr.id = ldp.project_id
    where pr.project_name=
	(select project_name
		from projects
		where cost = (select min(cost) from projects))
