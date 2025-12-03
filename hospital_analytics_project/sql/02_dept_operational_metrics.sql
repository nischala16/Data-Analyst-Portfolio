--Average Length of Stay by Department

create table avg_los_by_department as
select 
    mdc_description as department,
    round(avg(length_of_stay), 2) as avg_los,
    count(*) as total_visits
from hospital_data_clean
group by mdc_description
order by avg_los desc;

--Median Length of Stay by Department

drop table if exists median_los_by_dep;

create table median_los_by_dep as
with ordered_los as (
    select
        mdc_description as department,
        length_of_stay,
        row_number() over (
            partition by mdc_description 
            order by length_of_stay
        ) as rn,
        count(*) over (partition by mdc_description) as cnt
    from hospital_data_clean
)
select
    department,
    round(
        case 
            when cnt % 2 = 1 then -- odd number of rows
                cast(
                    (select length_of_stay 
                     from ordered_los o2
                     where o2.department = o1.department
                       and o2.rn = (cnt + 1) / 2
                    ) as real
                )
            else -- even number of rows
                cast(
                    (select avg(length_of_stay)
                     from ordered_los o2
                     where o2.department = o1.department
                       and o2.rn in (cnt / 2, (cnt / 2) + 1)
                    ) as real
                )
        end
    , 2) as median_los
from ordered_los o1
group by department
order by median_los desc;

--SLA Performance(LOS<= 5 days)

drop table if exists sla_by_department;

create table sla_by_department as
select 
    mdc_description as department,
    count(*) as total_patients,
    sum(case when length_of_stay <= 5 then 1 else 0 end) as sla_met,
    round(sum(case when length_of_stay <= 5 then 1 else 0 end) * 100.0 / count(*), 2) as sla_percent
from hospital_data_clean
group by mdc_description
order by sla_percent asc;



