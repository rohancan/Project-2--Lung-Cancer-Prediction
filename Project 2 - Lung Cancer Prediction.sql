-- Select the first 10 rows from the lung cancer table
SELECT TOP 10 * FROM LUNG_CANCER.dbo.[survey lung cancer];

-- UPDATE - The UPDATE statement in SQL Server is used to modify existing data in a table. 
-- It allows you to change the values of one or more columns in one or more rows of a table.

-- CASE - The CASE statement in SQL Server is a conditional expression that returns a value based on one or more conditions. 
-- It is similar to an "if-then-else" statement in other programming languages.


-- Replace the records under the attribute "GENDER"
UPDATE LUNG_CANCER.dbo.[survey lung cancer]
SET GENDER = CASE 
                    WHEN GENDER = 'M' THEN 'Male' 
                    WHEN GENDER = 'F' THEN 'Female' 
                END;

-- Obtain all the male patients 
SELECT * FROM LUNG_CANCER.DBO.[survey lung cancer] 
WHERE GENDER = 'Male';

-- Obtain the total number of patients by gender
SELECT GENDER, COUNT(GENDER) AS Number_of_patients FROM LUNG_CANCER.DBO.[survey lung cancer] 
GROUP BY GENDER;

-- Obtain all the male patients who are diagnosed with Lung Cancer
SELECT * FROM LUNG_CANCER.DBO.[survey lung cancer] 
WHERE GENDER = 'Male' AND LUNG_CANCER = 'YES';

-- Obtain the total number of patients who were diagnosed with Lung Cancer
SELECT LUNG_CANCER, COUNT(LUNG_CANCER) AS Number_of_patients FROM LUNG_CANCER.DBO.[survey lung cancer]
GROUP BY LUNG_CANCER;

-- Obtain the total number of male & female patients who were diagnosed with Lung Cancer 
SELECT GENDER, LUNG_CANCER, COUNT(LUNG_CANCER) AS Number_of_patients FROM LUNG_CANCER.DBO.[survey lung cancer]
GROUP BY GENDER, LUNG_CANCER;

-- Obtain the total number of male & female patients who were smoking
SELECT GENDER, SMOKING, COUNT(SMOKING) AS Total_Patients FROM LUNG_CANCER.DBO.[survey lung cancer]
GROUP BY GENDER, SMOKING;

-- Obtain the total number of male & female patients grouped by the attributes "SMOKING" & "LUNG_CANCER"
SELECT GENDER, SMOKING, LUNG_CANCER, COUNT(LUNG_CANCER) AS Total_Patients FROM LUNG_CANCER.DBO.[survey lung cancer]
GROUP BY GENDER, SMOKING, LUNG_CANCER;

-- Obtain the total number of male & female patients grouped by the attributes "ALLERGY" & "LUNG_CANCER"
SELECT GENDER, ALLERGY, LUNG_CANCER, COUNT(LUNG_CANCER) AS Total_Patients FROM LUNG_CANCER.DBO.[survey lung cancer]
GROUP BY GENDER, ALLERGY, LUNG_CANCER;

-- Obtain the total number of male & female patients grouped by the attributes "ALCOHOL_CONSUMING" & "LUNG_CANCER"
SELECT GENDER, [ALCOHOL CONSUMING], LUNG_CANCER, COUNT(LUNG_CANCER) AS Total_Patients FROM LUNG_CANCER.DBO.[survey lung cancer]
GROUP BY GENDER, [ALCOHOL CONSUMING], LUNG_CANCER;

-- Obtain the total number of male & female patients grouped by the attributes "YELLOW_FINGERS" & "LUNG_CANCER"
SELECT GENDER, YELLOW_FINGERS, LUNG_CANCER, COUNT(LUNG_CANCER) AS Total_Patients FROM LUNG_CANCER.DBO.[survey lung cancer]
GROUP BY GENDER, YELLOW_FINGERS, LUNG_CANCER;

-- Obtain the total number of male & female patients grouped by the attributes "ANXIETY" & "LUNG_CANCER"
SELECT GENDER, ANXIETY, LUNG_CANCER, COUNT(LUNG_CANCER) AS Total_Patients FROM LUNG_CANCER.DBO.[survey lung cancer]
GROUP BY GENDER, ANXIETY, LUNG_CANCER;

-- Obtain the total number of male & female patients grouped by the attributes "CHRONIC DISEASE" & "LUNG_CANCER"
SELECT GENDER, [CHRONIC DISEASE], LUNG_CANCER, COUNT(LUNG_CANCER) AS Total_Patients FROM LUNG_CANCER.DBO.[survey lung cancer]
GROUP BY GENDER, [CHRONIC DISEASE], LUNG_CANCER;

--
-- Obtain the total number of male patients who are diagnosed with lung cancer and above the age of 40 years
SELECT COUNT(*) as total_male_patients
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE GENDER = 'Male' AND AGE > 40 AND LUNG_CANCER = 'YES';

-- Let us convert all the categorical attributes to numerical
-- Convert the categorical attribute "SMOKING" to a numerical attribute
UPDATE LUNG_CANCER.DBO.[survey lung cancer]
SET SMOKING = 
    CASE SMOKING 
        WHEN 'No' THEN 1
        WHEN 'Yes' THEN 2  
    END;

-- Convert the categorical attribute "YELLOW_FINGERS" to a numerical attribute
UPDATE LUNG_CANCER.DBO.[survey lung cancer]
SET YELLOW_FINGERS = 
    CASE YELLOW_FINGERS 
        WHEN 'No' THEN 1
        WHEN 'Yes' THEN 2  
    END;

-- Convert the cateogorical attribute "ANXIETY" to a numerical attribute
UPDATE LUNG_CANCER.DBO.[survey lung cancer]
SET ANXIETY = 
    CASE ANXIETY 
        WHEN 'No' THEN 1
        WHEN 'Yes' THEN 2  
    END;

-- Convert the categorical attribute "PEER_PRESSURE" to a numerical attribute
UPDATE LUNG_CANCER.DBO.[survey lung cancer]
SET PEER_PRESSURE = 
    CASE PEER_PRESSURE 
        WHEN 'No' THEN 1
        WHEN 'Yes' THEN 2  
    END;

-- Convert the categorical attribute "ALLERGY" to a numerical attribute
UPDATE LUNG_CANCER.DBO.[survey lung cancer]
SET [ALLERGY ] = 
    CASE [ALLERGY ] 
        WHEN 'No' THEN 1
        WHEN 'Yes' THEN 2  
    END;

-- Convert the categorical attribute "COUGHING" to a numerical attribute
UPDATE LUNG_CANCER.DBO.[survey lung cancer]
SET COUGHING = 
    CASE COUGHING 
        WHEN 'No' THEN 1
        WHEN 'Yes' THEN 2  
    END;

-- Convert the categorical attribute "WHEEZING" to a numerical attribute
UPDATE LUNG_CANCER.DBO.[survey lung cancer]
SET WHEEZING = 
    CASE WHEEZING 
        WHEN 'No' THEN 1
        WHEN 'Yes' THEN 2  
    END;

-- Convert the categorical attribute "FATIGUE" to a numerical attribute
UPDATE LUNG_CANCER.DBO.[survey lung cancer]
SET [FATIGUE ] = 
    CASE [FATIGUE ] 
        WHEN 'No' THEN 1
        WHEN 'Yes' THEN 2  
    END;

-- Convert the categorical attribute "SHORTNESS OF BREATH" to a numerical attribute
UPDATE LUNG_CANCER.DBO.[survey lung cancer]
SET [SHORTNESS OF BREATH] = 
    CASE [SHORTNESS OF BREATH] 
        WHEN 'No' THEN 1
        WHEN 'Yes' THEN 2  
    END;

-- Convert the categorical attribute "CHRONIC DISEASE" to a numerical attribute
UPDATE LUNG_CANCER.DBO.[survey lung cancer]
SET [CHRONIC DISEASE] = 
    CASE [CHRONIC DISEASE] 
        WHEN 'No' THEN 1
        WHEN 'Yes' THEN 2  
    END;

-- Convert the categorical attribute "Alcohol consuming" to a numerical attribute
UPDATE LUNG_CANCER.DBO.[survey lung cancer]
SET [ALCOHOL CONSUMING] = 
    CASE [ALCOHOL CONSUMING] 
        WHEN 'No' THEN 1
        WHEN 'Yes' THEN 2  
    END;

-- Obtain the average age of men diagnosed with lung cancer
SELECT GENDER,AVG(CAST (AGE AS int)) AS Average_men_with_Lung_Cancer
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE GENDER='Male' AND LUNG_CANCER = 'YES'
GROUP BY GENDER;

-- From this, we can see that the average age of men diagnosed with lung cancer is 63 years old

-- Obtain the average age of women diagoned with lung cancer
SELECT GENDER,AVG(CAST (AGE AS int)) AS Average_men_with_Lung_Cancer
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE GENDER='Female' AND LUNG_CANCER = 'YES'
GROUP BY GENDER;

-- The average age of women diagnosed with lung cancer is 62 years old

-- Find the percentage of the cancer patients who are smokers
-- ROUND - The ROUND function in SQL Server is used to round a numeric value to a specified precision. 
-- It is commonly used to control the number of decimal places in a number.

-- SUBQUERY - A subquery in SQL Server is a query that is nested inside another query and is used to retrieve data that will be used in the main query. 
-- Subqueries can be used in various parts of a SQL statement, such as the SELECT, FROM, WHERE, and HAVING clauses.

SELECT A.smokers_lung_cancer, A.total_lung_cancer, ROUND( CAST(A.smokers_lung_cancer AS float)/ CAST(A.total_lung_cancer AS float), 3)*100 as percentage_smokers_with_LC
FROM
(SELECT
(SELECT COUNT(SMOKING)
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE SMOKING = 2 AND LUNG_CANCER ='YES') AS smokers_lung_cancer,
(SELECT COUNT(LUNG_CANCER)
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE LUNG_CANCER ='YES') AS total_lung_cancer
)A

-- We can see that there are about 57.4% of the smokers who are diagnosed with lung cancer

-- Find the percentage of lung cancer patients who consume alcohol
SELECT B.alcohol_lung_cancer, B.total_lung_cancer, ROUND( CAST(B.alcohol_lung_cancer AS float)/ CAST(B.total_lung_cancer AS float), 3)*100 as percentage_alcohol_with_LC
FROM
(SELECT
(SELECT COUNT([ALCOHOL CONSUMING])
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE [ALCOHOL CONSUMING] = 2 AND LUNG_CANCER ='YES') AS alcohol_lung_cancer,
(SELECT COUNT(LUNG_CANCER)
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE LUNG_CANCER ='YES') AS total_lung_cancer
)B

-- We can observe that there are about 61.1% of the lung cancer patients consumed alcohol

-- Find the percentage of lung cancer patients who experience the symptom of allergy
SELECT B.allergy_lung_cancer, B.total_lung_cancer, ROUND( CAST(B.allergy_lung_cancer AS float)/ CAST(B.total_lung_cancer AS float), 3)*100 as percentage_allergy_with_LC
FROM
(SELECT
(SELECT COUNT([ALLERGY])
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE [ALLERGY] = 2 AND LUNG_CANCER ='YES') AS allergy_lung_cancer,
(SELECT COUNT(LUNG_CANCER)
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE LUNG_CANCER ='YES') AS total_lung_cancer
)B

-- We can observe that about 62% of the lung cancer patients experienced this symptom of allergy

-- Find the percentage of the lung cancer patients who experience Anxiety
SELECT B.anxiety_lung_cancer, B.total_lung_cancer, ROUND( CAST(B.anxiety_lung_cancer AS float)/ CAST(B.total_lung_cancer AS float), 3)*100 as percentage_anxiety_with_LC
FROM
(SELECT
(SELECT COUNT(ANXIETY)
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE [ANXIETY] = 2 AND LUNG_CANCER ='YES') AS anxiety_lung_cancer,
(SELECT COUNT(LUNG_CANCER)
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE LUNG_CANCER ='YES') AS total_lung_cancer
)B

-- We can see that among all the lung cancer patients, about 52.6% of them had anxiety

-- Find the percentage of the lung cancer patients who had coughing
SELECT B.coughing_lung_cancer, B.total_lung_cancer, ROUND( CAST(B.coughing_lung_cancer AS float)/ CAST(B.total_lung_cancer AS float), 3)*100 as percentage_coughing_with_LC
FROM
(SELECT
(SELECT COUNT(COUGHING)
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE [COUGHING] = 2 AND LUNG_CANCER ='YES') AS coughing_lung_cancer,
(SELECT COUNT(LUNG_CANCER)
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE LUNG_CANCER ='YES') AS total_lung_cancer
)B

-- We can see that among all the lung cancer patients, about 63% of them experienced coughing

-- Find the percentage of the lung cancer patients who experienced wheezing
SELECT B.wheezing_lung_cancer, B.total_lung_cancer, ROUND( CAST(B.wheezing_lung_cancer AS float)/ CAST(B.total_lung_cancer AS float), 3)*100 as percentage_wheezing_with_LC
FROM
(SELECT
(SELECT COUNT(WHEEZING)
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE [WHEEZING] = 2 AND LUNG_CANCER ='YES') AS wheezing_lung_cancer,
(SELECT COUNT(LUNG_CANCER)
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE LUNG_CANCER ='YES') AS total_lung_cancer
)B

-- We can see that about 60% of the lung cancer patients experienced wheezing

-- Find the % of lung cancer patients that experienced fatigue
SELECT B.fatigue_lung_cancer, B.total_lung_cancer, ROUND( CAST(B.fatigue_lung_cancer AS float)/ CAST(B.total_lung_cancer AS float), 3)*100 as percentage_fatigue_with_LC
FROM
(SELECT
(SELECT COUNT(FATIGUE)
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE [FATIGUE] = 2 AND LUNG_CANCER ='YES') AS fatigue_lung_cancer,
(SELECT COUNT(LUNG_CANCER)
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE LUNG_CANCER ='YES') AS total_lung_cancer
)B

-- We can see that 70% of the lung cancer patients experienced fatigue

-- Find the percentage of the lung cancer patients that experienced shortness of breath
SELECT B.breathlessness_lung_cancer, B.total_lung_cancer, ROUND( CAST(B.breathlessness_lung_cancer AS float)/ CAST(B.total_lung_cancer AS float), 3)*100 as percentage_breathlessness_with_LC
FROM
(SELECT
(SELECT COUNT([SHORTNESS OF BREATH])
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE [SHORTNESS OF BREATH] = 2 AND LUNG_CANCER ='YES') AS breathlessness_lung_cancer,
(SELECT COUNT(LUNG_CANCER)
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE LUNG_CANCER ='YES') AS total_lung_cancer
)B

-- We can see that among all the lung cancer patients, about 65.2% of them experienced shortness of breath. 

-- Determine the ages of the youngest and oldest patients who experienced allergy
SELECT MIN(AGE) youngest_allergy,MAX(AGE) oldest_allergy
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE [ALLERGY] = 2
GROUP BY [ALLERGY]

-- We can see that the youngest patient with allergy is 21 years and the oldest patient with allergy is 81 years old.

-- Determine the ages of the youngest and oldest patients who experienced wheezing
SELECT MIN(AGE) youngest_wheezing,MAX(AGE) oldest_wheezing
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE [WHEEZING] = 2
GROUP BY [WHEEZING]

-- From this, we can see that the youngest patient who experienced wheezing is 38 years old and the oldest patient is 81 years old.

-- Determine the ages of the youngest and oldest patients who experienced coughing
SELECT MIN(AGE) youngest_coughing,MAX(AGE) oldest_coughing
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE [COUGHING] = 2
GROUP BY [COUGHING]

-- Among all the patients who experienced coughing, the youngest patient is 38 years old and the oldest patient is 81 years old. 

-- Determine the ages of the youngest and oldest patients who consume alcohol
SELECT MIN(AGE) youngest_alc,MAX(AGE) oldest_alc
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE [ALCOHOL CONSUMING] = 2
GROUP BY [ALCOHOL CONSUMING]

-- The youngest patient who consumed alcohol is 39 years & the oldest patient who consumed alcohol is 81 years old

-- Determine the ages of the youngest and the oldest patients who experienced shortness of breath
SELECT MIN(AGE) youngest_breathlessness,MAX(AGE) oldest_breathlessness
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE [SHORTNESS OF BREATH] = 2
GROUP BY [SHORTNESS OF BREATH]

-- We can see that the youngest patient who experienced shortness of breath is only 21 years and the oldest patient who experienced shortness
-- of breath is 87 years old

-- Determine the ages of the youngest and oldest patients who experienced fatigue
SELECT MIN(AGE) youngest_fatigue,MAX(AGE) oldest_fatigue
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE [FATIGUE] = 2
GROUP BY [FATIGUE]

-- The youngest patient who experienced fatigue is 21 years old and the oldest patient is 87 years old

-- Find the total number of men & women who have lung cancer from the group
SELECT COUNT(GENDER) AS Men_with_LC
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE GENDER = 'Male' AND LUNG_CANCER = 'YES'

SELECT COUNT(GENDER) AS Women_with_LC
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE GENDER = 'Female' AND LUNG_CANCER = 'YES'

-- We can see that about 145 men & 125 women are diagnosed with lung cancer

-- Determine who smoked more between men & women
SELECT COUNT(GENDER) men_smokers
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE GENDER='Male' AND SMOKING= 2

SELECT COUNT(GENDER) Women_smokers
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE GENDER='Female' AND SMOKING= 2

-- Among all the patients, there were more men smokers than women smokers
-- Since we already deduced that more men are diagnosed with Lung cancer than women, its most likely that smoking is a key factor that causes lung Cancer

-- Determine the key factors that can predict that someone will be diagnosed with lung cancer
-- First, we can create a tableof all the patients that are diagnosed with lung cancer
-- Then, we look at the count of each feature to determine which factors have the highest counts

SELECT SUM (CASE B.SMOKING WHEN 2 THEN 1
ELSE 0
END) Smokers_LC,
SUM (CASE B.YELLOW_FINGERS WHEN 2 THEN 1
ELSE 0
END) Yellow_Fingers_LC,
SUM (CASE B.ANXIETY WHEN 2 THEN 1
ELSE 0
END) Anxiety_LC,
SUM (CASE B.PEER_PRESSURE WHEN 2 THEN 1
ELSE 0
END) Peer_Pressure_LC,
SUM (CASE B.[CHRONIC DISEASE] WHEN 2 THEN 1
ELSE 0
END) Chronic_LC,
SUM (CASE B.[FATIGUE ] WHEN 2 THEN 1
ELSE 0
END) Fatigued_LC,
SUM (CASE B.[ALLERGY ] WHEN 2 THEN 1
ELSE 0
END) Allergy_LC,
SUM (CASE B.WHEEZING WHEN 2 THEN 1
ELSE 0
END) Wheezing_LC,
SUM (CASE B.[ALCOHOL CONSUMING] WHEN 2 THEN 1
ELSE 0
END) Alcohol_LC,
SUM (CASE B.COUGHING WHEN 2 THEN 1
ELSE 0
END) Coughing_LC,
SUM (CASE B.[SHORTNESS OF BREATH] WHEN 2 THEN 1
ELSE 0
END) Short_breathe_LC,
SUM (CASE B.[SWALLOWING DIFFICULTY] WHEN 2 THEN 1
ELSE 0
END) Swallowing_Dificulty_LC,
SUM (CASE B.[CHEST PAIN] WHEN 2 THEN 1
ELSE 0
END) Chest_pain_LC
FROM (SELECT *
FROM LUNG_CANCER.DBO.[survey lung cancer]
WHERE LUNG_CANCER='YES') AS B


-- From the given output, one can infer that a patient who is diagnosed with lung cancer would most likely complain of the following symptoms: "Fatigue", "Shortness of breath", "Coughing" & "Allergy"
-- As these are the highest count of symptoms among all the patients that are diagnosed with lung cancer.


