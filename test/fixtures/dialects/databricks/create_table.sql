CREATE TABLE tablename
(
    id_column INT,
    othercolumn STRING,
    generated_always_as_expression DATE GENERATED ALWAYS AS (CAST(birth_date AS DATE)),
    generated_by_default BIGINT GENERATED BY DEFAULT AS IDENTITY,
    generated_always BIGINT GENERATED ALWAYS AS IDENTITY,
    generated_column_start_with BIGINT GENERATED ALWAYS AS IDENTITY (START WITH 10),
    generated_column_increment_by BIGINT GENERATED ALWAYS AS IDENTITY (INCREMENT BY 5),
    generated_column_start_with_increment_by BIGINT GENERATED ALWAYS AS IDENTITY (START WITH 10 INCREMENT BY 5)
)
USING DELTA
LOCATION "s3://someplace"
CLUSTER BY (id_column);
OPTIMIZE tablename;


OPTIMIZE tablename
WHERE date >= current_timestamp() - INTERVAL 1 day
ZORDER BY (eventType, eventTime);


-- Creates a Delta table
CREATE TABLE student (id INT, name STRING, age INT);

-- Use data from another table
CREATE TABLE student_copy AS SELECT * FROM student;

-- Creates a CSV table from an external directory
CREATE TABLE student USING CSV LOCATION '/path/to/csv_files';

-- Specify table comment and properties
CREATE TABLE student (id INT, name STRING, age INT)
    COMMENT 'this is a comment'
    TBLPROPERTIES ('foo'='bar');

-- Specify table comment and properties with different clauses order
CREATE TABLE student (id INT, name STRING, age INT)
    TBLPROPERTIES ('foo'='bar')
    COMMENT 'this is a comment';

-- Create partitioned table
CREATE TABLE student (id INT, name STRING, age INT)
    PARTITIONED BY (age);

-- Create a table with a generated column
CREATE TABLE rectangles(a INT, b INT,
                          area INT GENERATED ALWAYS AS (a * b));

-- Create a table with a primary key
CREATE TABLE rectangles(a INT, b INT PRIMARY KEY);

-- Create a table with a not null primary key
CREATE TABLE rectangles(a INT NOT NULL, b INT NOT NULL PRIMARY KEY);

-- Create a table with a foreign key relation
CREATE OR REPLACE TABLE TABLE1 (
  DATE_VALUE DATE NOT NULL
    CONSTRAINT DATE_CONSTRAINT
    FOREIGN KEY REFERENCES TABLE2
);
