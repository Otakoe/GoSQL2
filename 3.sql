select s.skill_name,sum(dev.salary) as value
	from developers as dev
join link_developers_skills as lds
	on lds.dev_id = dev.id
join skills as s
	on lds.skill_id=s.id and s.skill_name='Java'