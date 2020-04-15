select s.skill_name,sum(dev.salary) as value
	from developers dev
join link_developers_skills lds
	on lds.dev_id = dev.id
join skills s
	on lds.skill_id=s.id and s.skill_name='Java'