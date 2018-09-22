CREATE DATABASE IF NOT EXISTS employment;
USE employment;

CREATE TABLE IF NOT EXISTS users(
id int(255) auto_increment not null,
role_user varchar(20),
first_name varchar(60),
last_name varchar(60),
surname varchar(255),
email varchar(255),
password_user varchar(255),
image_user varchar(255),
created_at datetime,
update_at datetime,
remember_token varchar(255),
state int(2),
CONSTRAINT pk_users PRIMARY KEY(id)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS regions(
id char(6) NOT NULL DEFAULT '',
name_region varchar(50) NOT NULL DEFAULT '',
created_at timestamp NULL DEFAULT NULL,
updated_at timestamp NULL DEFAULT NULL,
CONSTRAINT pk_regions PRIMARY KEY(id)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS provinces(
id char(6) NOT NULL DEFAULT '',
name_province varchar(50) NOT NULL DEFAULT '',
region_id char(6) NOT NULL DEFAULT '',
created_at timestamp NULL DEFAULT NULL,
updated_at timestamp NULL DEFAULT NULL,
CONSTRAINT pk_provinces PRIMARY KEY(id),
CONSTRAINT fk_provinces_regions FOREIGN KEY(region_id) REFERENCES regions(id)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS districts(
id char(6) NOT NULL DEFAULT '',
name_district varchar(50) NOT NULL DEFAULT '',
region_id char(6) NOT NULL DEFAULT '',
province_id char(6) NOT NULL DEFAULT '',
created_at timestamp NULL DEFAULT NULL,
updated_at timestamp NULL DEFAULT NULL,
CONSTRAINT pk_districts PRIMARY KEY(id),
CONSTRAINT fk_districts_regions FOREIGN KEY(region_id) REFERENCES regions(id),
CONSTRAINT fk_districts_provinces FOREIGN KEY(province_id) REFERENCES provinces(id)
)Engine=InnoDB;


CREATE TABLE IF NOT EXISTS employers(
id int(255) auto_increment not null,
first_name varchar(60),
last_name varchar(60),
surname varchar(255),
dni varchar(15),
email varchar(255),
address varchar(255),
reference varchar(255),
cell_phone varchar(255),
property_type int(10),
amount_people varchar(10),
pet int(10),
amount_pet varchar(10),
created_at datetime,
update_at datetime,
CONSTRAINT pk_employers PRIMARY KEY(id)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS type_jobs(
id int(255) auto_increment not null,
name_job varchar(255),
state_job varchar(255),
created_at datetime,
update_at datetime,
CONSTRAINT pk_type_jobs PRIMARY KEY(id)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS employees(
id int(255) auto_increment not null,
first_name varchar(60),
last_name varchar(60),
surname varchar(255),
dni varchar(15),
email varchar(255),
address varchar(255),
reference varchar(255),
cell_phone varchar(255),
district_id char(255),
province_id char(255),
region_id char(255),
record int(1),
curriculum int(1),
state_employees int(1),
created_at datetime,
update_at datetime,
CONSTRAINT pk_employees PRIMARY KEY(id),
CONSTRAINT fk_employees_districts FOREIGN KEY(district_id) REFERENCES districts(id),
CONSTRAINT fk_employees_provinces FOREIGN KEY(province_id) REFERENCES provinces(id),
CONSTRAINT fk_employees_regions FOREIGN KEY(region_id) REFERENCES regions(id)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS employee_experience(
id int(255) auto_increment not null,
amount_month varchar(255),
type_job_id int(255),
employee_id int(255),
created_at datetime,
update_at datetime,
CONSTRAINT pk_employee_experience PRIMARY KEY(id),
CONSTRAINT fk_employee_experience_type_jobs FOREIGN KEY(type_job_id) REFERENCES type_jobs(id),
CONSTRAINT fk_employee_experience_employees FOREIGN KEY(employee_id) REFERENCES employees(id)
)Engine=InnoDB;


CREATE TABLE IF NOT EXISTS employment_profiles(
id int(255) auto_increment not null,
modality int(5) DEFAULT 0 not null,
schedules_employment json,
schedules_employment_second json,
contract_type int(5),
salary_range varchar(30),
salary_range_two varchar(30),
age_range varchar(30),
age_range_two varchar(30),
date_admission datetime,
date_departure datetime,
date_placement datetime,
created_at datetime,
update_at datetime,
region_id char(6),
employer_id int(255),
employee_id int(255),
type_job_id int(255),
CONSTRAINT pk_employment_profiles PRIMARY KEY(id),
CONSTRAINT fk_employment_profiles_regions FOREIGN KEY(region_id) REFERENCES regions(id),
CONSTRAINT fk_employment_profiles_employers FOREIGN KEY(employer_id) REFERENCES employers(id),
CONSTRAINT fk_employment_profiles_employees FOREIGN KEY(employee_id) REFERENCES employees(id),
CONSTRAINT fk_employment_profiles_type_jobs FOREIGN KEY(type_job_id) REFERENCES type_jobs(id)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS contracts(
id int(255) auto_increment not null,
date_start datetime,
date_end datetime,
number_contract varchar(255),
number_ballot varchar(255),
salary varchar(35),
modality int(3) DEFAULT 0 not null,
employer_id int(255),
employee_id int(255),
type_job_id int(255),
created_at datetime,
update_at datetime,
CONSTRAINT pk_contracts PRIMARY KEY(id),
CONSTRAINT fk_contracts_employers FOREIGN KEY(employer_id) REFERENCES employers(id),
CONSTRAINT fk_contracts_employees FOREIGN KEY(employee_id) REFERENCES employees(id),
CONSTRAINT fk_contracts_type_jobs FOREIGN KEY(type_job_id) REFERENCES type_jobs(id)
)Engine=InnoDB;