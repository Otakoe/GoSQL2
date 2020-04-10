select project_name,cost
from projects
where cost = (select min(cost) from projects)