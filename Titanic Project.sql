
Select*
From [dbo].[Titanic]

--Update the Embarked column record by replacing Q, S, C with Queenstown, Southampton, and Cherbourg respectively
Update [dbo].[Titanic]
Set [Embarked]= 'Southampton'
Where [Embarked] = 'S'

Update [dbo].[Titanic]
Set [Embarked]= 'Cherbourg'
Where [Embarked] = 'C'

Update [dbo].[Titanic]
Set [Embarked]= 'Queenstown'
Where [Embarked] = 'Q'


--Looking at the average age of passengers who survived and those who did not:
SELECT Survived, AVG(Age) AS AvgAge
FROM Titanic
GROUP BY Survived;


--Shows the top 5 most common titles (e.g., Mr., Mrs., Miss) among the passengers:
SELECT Top 5 Title, COUNT(*) AS Count
FROM Titanic
GROUP BY Title
ORDER BY Count DESC


--Shows the average fare paid by passengers in each passenger class (Pclass):
SELECT Pclass, AVG(Fare) AS AvgFare
FROM Titanic
GROUP BY Pclass;

--Looking at the passengers with the highest and lowest fare:
SELECT *
FROM Titanic
WHERE Fare = (SELECT MAX(Fare) FROM Titanic)
   OR Fare = (SELECT MIN(Fare) FROM Titanic);

--Looking at the survival rate for male vs female passengers:
SELECT Sex, 
       SUM(Survived) AS TotalSurvived, 
       COUNT(*) AS TotalPassengers,
      SUM(Survived) * 100.0 / COUNT(*)  AS SurvivalRate
FROM [dbo].[Titanic]
GROUP BY Sex;

--Calculate the average family size (SibSp + Parch + 1) for passengers who survived and those who did not:
SELECT Survived, AVG(SibSp + Parch + 1) AS AvgFamilySize
FROM [dbo].[Titanic]
GROUP BY Survived;

--Retrieve the names of passengers whose age is missing (NULL):
SELECT Name
FROM [dbo].[Titanic]
WHERE Age IS NULL;

--Shows the most common port of embarkation (Embarked) and its corresponding number of passengers:
SELECT TOP 1 Embarked, COUNT(*) AS Count
FROM Titanic
GROUP BY Embarked
ORDER BY Count DESC

--Calculate the average age for passengers in each passenger class and gender combination:
SELECT Pclass, Sex, AVG(Age) AS AvgAge
FROM Titanic
GROUP BY Pclass, Sex;

--Retrieve passengers who were traveling alone (Family_Size = 1) and did not survive:
SELECT *
FROM Titanic
WHERE Family_Size = 1 AND Survived = 0;