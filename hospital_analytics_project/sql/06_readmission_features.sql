--Average LOS by Severity

drop table if exists avg_los_by_severity;

create table avg_los_by_severity as
select
    severity_description as severity,
    round(avg(length_of_stay), 2) as avg_los
from hospital_data_clean
group by severity_description
order by avg_los desc;


--Average Cost per Severity Level

drop table if exists avg_cost_by_severity;

create table avg_cost_by_severity as
select
    severity_description as severity,
    round(avg(total_costs), 2) as avg_cost
from hospital_data_clean
group by severity_description
order by avg_cost desc;




