select projects.project_name, sum(developers.salary) as value
	from projects,developers,link_developers_projects
	where projects.id=link_developers_projects.project_id 
		and developers.id=link_developers_projects.dev_id
	group by projects.project_name
	order by value desc
	limit 1