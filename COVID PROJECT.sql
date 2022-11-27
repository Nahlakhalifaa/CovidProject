
SELECT*FROM [Covid project]..['coviddeaths]
order by 3,4

SELECT location,date,total_cases,new_cases,total_deaths,[population] FROM [Covid project]..['coviddeaths]
order by 1,2

-- looking at total cases vs total deaths
SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as deathpercentage FROM [Covid project]..['coviddeaths]
order by 1,2

SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as deathpercentage FROM [Covid project]..['coviddeaths]
where location like '%states%'
order by 1,2

-- looking at total cases vs populatin
--shows what percentage of population got covid


SELECT location,date,total_cases,total_deaths,(total_cases/[population])*100 as populationpercentage FROM [Covid project]..['coviddeaths]
order by 1,2

--looking at countries with highest infiction Rate compaerd to population
SELECT location,population,MAX(total_cases)AS HighestInfictionCount,MAX(total_cases/[population])*100 as populationpercentageinfected FROM [Covid project]..['coviddeaths]
GROUP BY location,population
order by populationpercentageinfected desc

--showing countries with Hightest death count per population

SELECT location,MAX(cast(total_deaths as int))AS TotalDeathsCount FROM [Covid project]..['coviddeaths]
GROUP BY location,population
order by TotalDeathsCount desc
--showing continents with Hightest death count
SELECT continent,MAX(cast(total_deaths as int))AS TotalDeathsCount FROM [Covid project]..['coviddeaths]
where continent is not null
GROUP BY continent
order by TotalDeathsCount desc 


--GLOBAL NUMBER

SELECT SUM(new_cases)AS TotalCases,SUM(cast(new_deaths as int)) as Totaldeaths,SUM(CAST(new_deaths AS INT))/sum(new_cases)*100 as deathsprecentage
FROM [Covid project]..['coviddeaths]
where continent is not null
order by 1,2

 select * from [Covid project]..['covidvaccenations]

 select * from [Covid project]..['coviddeaths] as de
 join [Covid project] .. ['covidvaccenations] AS vac
 on de.location = vac.location
 and de.date = de.date

 select de.continent,de.location,de.date,de.population,vac.new_vaccinations,sum(convert(int,vac.new_vaccinations )) over (partition by de.location order by de.location,de.date) from [Covid project]..['coviddeaths] as de
 join [Covid project] .. ['covidvaccenations] AS vac
 on de.location = vac.location
 and de.date = vac.date
 where de.continent is not null





