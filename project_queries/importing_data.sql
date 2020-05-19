-- Data is being imported using pgAdmin, however some data and datasets must be adjusted and corrected
-- This file contains the queries run to make these adjustments and corrections


-- Update the data type for state_name, the current data type does not allow for enough characters to fit 'District of Columbia'
ALTER TABLE states
ALTER COLUMN state_name TYPE VARCHAR(20);


-- Add Puerto Rico and DC to the states dataset
INSERT INTO states
VALUES ('PR', 'Puerto Rico'),
        ('DC', 'District of Columbia');


-- Update the data type for school_name, the current data type doesnt allow for enough character to fit some names
ALTER TABLE schools
ALTER COLUMN school_name  TYPE  VARCHAR(75);
