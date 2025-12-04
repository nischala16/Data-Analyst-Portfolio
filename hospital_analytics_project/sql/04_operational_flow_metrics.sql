--Admission Types

drop table if exists admission_types;

create table admission_types as
select 
    admission_type,
    count(*) as total_admissions
from hospital_data_clean
group by admission_type
order by total_admissions desc;

--Patient Disposition Breakdown

drop table if exists patient_disposition;

create table patient_disposition as
select 
    disposition as patient_disposition,
    count(*) as total_patients
from hospital_data_clean
group by disposition
order by total_patients desc;

--Severity of Illness Mix

drop table if exists severity_mix;

create table severity_mix as
select 
    severity_description as severity_level,
    count(*) as total_patients
from hospital_data_clean
group by severity_description
order by total_patients desc;

