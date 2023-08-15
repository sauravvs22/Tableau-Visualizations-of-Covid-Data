--1. Deaths vs Cases

select Sum(new_cases) as total_cases, Sum(cast(new_deaths as int)) as total_deaths, Sum(cast(new_deaths as int))/sum(NULLIF(new_cases, 0))*100 as DeathPercentage

FROM PortfolioProject..CovidDeaths
Where continent is not null
--Where location like '%India%'
--Group by date
order by 1,2


--2. Total death count
select location, Sum(cast(new_deaths as bigint)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where location like '%India%'
where continent is null and location not in ('World', 'High income', 'Upper middle income', 'Lower middle income', 'European Union', 'Low income' )
Group by location
order by TotalDeathCount desc


--3. Population Infected by country

select Location, population, Max(0 + total_cases) as HighestInfectionCount,
Max((total_cases)/(population))*100 as PercentPopulationInfected 
From PortfolioProject..CovidDeaths
--Where location like '%India%'
Group by location, population
order by PercentPopulationInfected desc

--4. Population Infected by date

select Location, population, date, Max(0 + total_cases) as HighestInfectionCount,
Max((total_cases)/(population))*100 as PercentPopulationInfected 
From PortfolioProject..CovidDeaths
--Where location like '%India%'
Group by location, population, date
order by PercentPopulationInfected desc



