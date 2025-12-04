--Patients by Age Group

drop table if exists patients_by_age;

create table patients_by_age as
select
    age_group,
    count(*) as total_patients
from hospital_data_clean
group by age_group
order by total_patients desc;

--Race / Ethnicity Distribution

drop table if exists race_ethnicity;

create table race_ethnicity as
select
    race,
    ethnicity,
    count(*) as total_patients
from hospital_data_clean
group by race, ethnicity
order by total_patients desc;

--Gender Distribution

drop table if exists gender_distribution;

create table gender_distribution as
select
    gender,
    count(*) as total_patients
from hospital_data_clean
group by gender
order by total_patients desc;
