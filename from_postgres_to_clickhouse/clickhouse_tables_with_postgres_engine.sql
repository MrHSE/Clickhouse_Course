CREATE TABLE company (
  companyid UInt32,
  name String,
  location String
) ENGINE = PostgreSQL('localhost:45824', 'clickhouse', 'company', 'postgres', '')
;

CREATE TABLE department (
  departmentid UInt32,
  name String,
  description String
) ENGINE = PostgreSQL('localhost:45824', 'clickhouse', 'department', 'postgres', '')
;

CREATE TABLE companydepartment (
  companyid UInt32,
  departmentid UInt32,
) ENGINE = PostgreSQL('localhost:45824', 'clickhouse', 'companydepartment', 'postgres', '')
;

CREATE TABLE person (
  personid UInt64,
  name String,
  surname String,
  socialsecurityid UInt64,
  companyid UInt32
) ENGINE = PostgreSQL('localhost:45824', 'clickhouse', 'person', 'postgres', '')
;

CREATE TABLE employee (
  employeeid UInt32,
  personid UInt64,
  position String,
) ENGINE = PostgreSQL('localhost:45824', 'clickhouse', 'employee', 'postgres', '')
;

CREATE TABLE manager (
  managerid UInt32,
  personid UInt64,
  departmentid UInt32
) ENGINE = PostgreSQL('localhost:45824', 'clickhouse', 'manager', 'postgres', '')
;
