
-- Total Records

SELECT COUNT(*) AS Total_Records
FROM Customers;

-- ==========================================

-- Check Duplicate Customer IDs

SELECT Customer_ID, COUNT(*) AS Duplicate_Count
FROM Customers
GROUP BY Customer_ID
HAVING COUNT(*) > 1;

-- ==========================================

-- Check Missing Values

SELECT
SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_Nulls,
SUM(CASE WHEN Married IS NULL THEN 1 ELSE 0 END) AS Married_Nulls,
SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS State_Nulls,
SUM(CASE WHEN Value_Deal IS NULL THEN 1 ELSE 0 END) AS ValueDeal_Nulls,
SUM(CASE WHEN Multiple_Lines IS NULL THEN 1 ELSE 0 END) AS MultipleLines_Nulls,
SUM(CASE WHEN Internet_Type IS NULL THEN 1 ELSE 0 END) AS InternetType_Nulls,
SUM(CASE WHEN Online_Security IS NULL THEN 1 ELSE 0 END) AS OnlineSecurity_Nulls,
SUM(CASE WHEN Online_Backup IS NULL THEN 1 ELSE 0 END) AS OnlineBackup_Nulls,
SUM(CASE WHEN Device_Protection_Plan IS NULL THEN 1 ELSE 0 END) AS DeviceProtection_Nulls,
SUM(CASE WHEN Premium_Support IS NULL THEN 1 ELSE 0 END) AS PremiumSupport_Nulls,
SUM(CASE WHEN Streaming_TV IS NULL THEN 1 ELSE 0 END) AS StreamingTV_Nulls,
SUM(CASE WHEN Streaming_Movies IS NULL THEN 1 ELSE 0 END) AS StreamingMovies_Nulls,
SUM(CASE WHEN Streaming_Music IS NULL THEN 1 ELSE 0 END) AS StreamingMusic_Nulls,
SUM(CASE WHEN Unlimited_Data IS NULL THEN 1 ELSE 0 END) AS UnlimitedData_Nulls,
SUM(CASE WHEN Churn_Category IS NULL THEN 1 ELSE 0 END) AS ChurnCategory_Nulls,
SUM(CASE WHEN Churn_Reason IS NULL THEN 1 ELSE 0 END) AS ChurnReason_Nulls
FROM Customers;

-- ==========================================

-- Replace Missing Values

UPDATE Customers
SET
Value_Deal = ISNULL(Value_Deal,'NA'),
Multiple_Lines = ISNULL(Multiple_Lines,'No'),
Internet_Type = ISNULL(Internet_Type,'NA'),
Online_Security = ISNULL(Online_Security,'No'),
Online_Backup = ISNULL(Online_Backup,'No'),
Device_Protection_Plan = ISNULL(Device_Protection_Plan,'No'),
Premium_Support = ISNULL(Premium_Support,'No'),
Streaming_TV = ISNULL(Streaming_TV,'No'),
Streaming_Movies = ISNULL(Streaming_Movies,'No'),
Streaming_Music = ISNULL(Streaming_Music,'No'),
Unlimited_Data = ISNULL(Unlimited_Data,'No'),
Churn_Category = ISNULL(Churn_Category,'NA'),
Churn_Reason = ISNULL(Churn_Reason,'NA');

-- ==========================================

-- Verify Missing Values

SELECT
SUM(CASE WHEN Value_Deal IS NULL THEN 1 ELSE 0 END) AS ValueDeal_Nulls,
SUM(CASE WHEN Internet_Type IS NULL THEN 1 ELSE 0 END) AS InternetType_Nulls,
SUM(CASE WHEN Churn_Category IS NULL THEN 1 ELSE 0 END) AS ChurnCategory_Nulls,
SUM(CASE WHEN Churn_Reason IS NULL THEN 1 ELSE 0 END) AS ChurnReason_Nulls
FROM Customers;

-- ==========================================

-- Check Blank Values

SELECT *
FROM Customers
WHERE
TRIM(State) = ''
OR TRIM(Gender) = ''
OR TRIM(Contract) = ''
OR TRIM(Payment_Method) = '';


-- ==========================================

-- Validate Numerical Ranges

SELECT
MIN(Age) AS Minimum_Age,
MAX(Age) AS Maximum_Age,
MIN(Tenure_in_Months) AS Minimum_Tenure,
MAX(Tenure_in_Months) AS Maximum_Tenure,
MIN(Monthly_Charge) AS Minimum_Monthly_Charge,
MAX(Monthly_Charge) AS Maximum_Monthly_Charge,
MIN(Total_Revenue) AS Minimum_Revenue,
MAX(Total_Revenue) AS Maximum_Revenue
FROM Customers;

-- ==========================================

-- Check Unique Values

SELECT DISTINCT Customer_Status
FROM Customers;

SELECT DISTINCT Contract
FROM Customers;

SELECT DISTINCT Internet_Type
FROM Customers;

SELECT DISTINCT Payment_Method
FROM Customers;

-- ==========================================

-- Final Record Validation

SELECT COUNT(*) AS Final_Record_Count
FROM Customers;

-- ==========================================