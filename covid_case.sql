select*from worldometer_data;
/*Total Cases vs Total Deaths*/
Select *
From worldometer_data;

select Continent,TotalCases,TotalDeaths,(TotalCases/TotalDeaths)*100 as DeathPercentage
 from worldometer_data
 order by DeathPercentage Desc;
 
 /*Total Cases vs Population*/
 
 select Continent,TotalCases,Population,(TotalCases/Population)*100 as PopulationPercentage
 from worldometer_data
  group by Continent
 order by PopulationPercentage Desc;
 
 /*Continent with Highest Infection Rate compared to Population*/
 
 select Continent,max(TotalCases),Population, (TotalCases/Population)*100 as PopulationPercentage 
 from worldometer_data
 group by Continent,Population
 order by PopulationPercentage Desc;
 

 
 
 
 
 
 
 
 