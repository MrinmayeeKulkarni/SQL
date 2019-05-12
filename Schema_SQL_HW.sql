-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employees" (
    "Emp_no" INT   NOT NULL,
    "Birthdate" DATE   NOT NULL,
    "First_name" VARCHAR   NOT NULL,
    "Last_name" VARCHAR   NOT NULL,
    "Gender" VARCHAR   NOT NULL,
    "Hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Emp_no"
     )
);

CREATE TABLE "Dept" (
    "Dept_no" VARCHAR   NOT NULL,
    "Dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Dept" PRIMARY KEY (
        "Dept_no"
     )
);

CREATE TABLE "Dept_manager" (
    "Dept_no" VARCHAR   NOT NULL,
    "Emp_no" INT   NOT NULL,
    "From_date" DATE   NOT NULL,
    "To_date" DATE   NOT NULL,
    CONSTRAINT "pk_Dept_manager" PRIMARY KEY (
        "Dept_no"
     )
);

CREATE TABLE "Dept_emp" (
    "ID" Serial   NOT NULL,
    "Emp_no" INT   NOT NULL,
    "Dept_no" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_Dept_emp" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Titles" (
    "ID" Serial   NOT NULL,
    "Emp_no" INT   NOT NULL,
    "Title" VARCHAR   NOT NULL,
    "From_date" DATE   NOT NULL,
    "To_date" DATE   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Salaries" (
    "Emp_no" INT   NOT NULL,
    "Salary" INT   NOT NULL,
    "From_date" DATE   NOT NULL,
    "To_date" DATE   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Emp_no"
     )
);

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Dept" ("Dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Dept" ("Dept_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

