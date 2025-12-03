-- ============================================
-- step 1: drop old clean table if exists
-- ============================================
drop table if exists hospital_data_clean;

-- ============================================
-- step 2: create cleaned table
-- ============================================
create table hospital_data_clean as
select
    -- basic identifiers
    "Hospital Service Area",
    "Hospital County",
    "Operating Certificate Number",
    "Permanent Facility Id",
    "Facility Name",

    -- demographics
    upper(trim("Age Group")) as age_group,
    "Zip Code - 3 digits" as zip3,
    upper(trim("Gender")) as gender,
    upper(trim("Race")) as race,
    upper(trim("Ethnicity")) as ethnicity,

    -- clinical values
    cast("Length of Stay" as integer) as length_of_stay,
    upper(trim("Type of Admission")) as admission_type,
    upper(trim("Patient Disposition")) as disposition,
    "Discharge Year",

    -- ccsr diagnosis and procedure
    "CCSR Diagnosis Code" as dx_code,
    upper(trim("CCSR Diagnosis Description")) as dx_description,
    "CCSR Procedure Code" as px_code,
    upper(trim("CCSR Procedure Description")) as px_description,

    -- apr drg values
    "APR DRG Code" as drg_code,
    upper(trim("APR DRG Description")) as drg_description,
    "APR MDC Code" as mdc_code,
    upper(trim("APR MDC Description")) as mdc_description,
    "APR Severity of Illness Code" as severity_code,
    upper(trim("APR Severity of Illness Description")) as severity_description,
    upper(trim("APR Risk of Mortality")) as risk_of_mortality,
    upper(trim("APR Medical Surgical Description")) as med_surg,

    -- payment
    upper(trim("Payment Typology 1")) as payor_primary,
    upper(trim("Payment Typology 2")) as payor_secondary,
    upper(trim("Payment Typology 3")) as payor_tertiary,

    -- other values
    "Birth Weight",
    upper(trim("Emergency Department Indicator")) as ed_indicator,

    -- financials (clean & numeric)
    cast(replace("Total Charges", ',', '') as float) as total_charges,
    cast(replace("Total Costs", ',', '') as float) as total_costs

from hospital_data_raw
where
    -- remove impossible los
    cast("Length of Stay" as integer) between 0 and 365
    and "Facility Name" is not null
    and "Discharge Year" is not null;
