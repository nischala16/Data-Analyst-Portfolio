--Total Costs & Charges by Department

drop table if exists costs_charges_by_department;

create table costs_charges_by_department as
select 
    mdc_description as department,
    sum(total_costs) as total_costs,
    sum(total_charges) as total_charges,
    round(avg(total_costs), 2) as avg_cost_per_visit
from hospital_data_clean
group by mdc_description
order by total_costs desc;

--Cost Per Day By Department

drop table if exists cost_per_day_by_department;

create table cost_per_day_by_department as
select 
    mdc_description as department,
    round(sum(total_costs) * 1.0 / sum(length_of_stay), 2) as cost_per_day
from hospital_data_clean
group by mdc_description
order by cost_per_day desc;



