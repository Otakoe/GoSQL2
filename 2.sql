select pr.project_name, sum(dev.salary) as value
	from projects pr
join link_developers_projects ldp
	on ldp.project_id = pr.id
join developers dev
	on dev.id=ldp.dev_id
group by pr.project_name
order by value desc
limit 1
