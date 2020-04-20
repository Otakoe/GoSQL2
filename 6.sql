select pr.project_name as cheaper_project,avg(dev.salary)
	from developers dev
    join link_developers_projects ldp
	on ldp.dev_id=dev.id
    join projects pr
	on pr.id = ldp.project_id
    where pr.id = (select id from projects 
					where cost = (select min(cost) from projects));
        
