Select *
From Layoff_stage;

Create Table Layoff_stage
Like layoffs;

Insert Layoff_stage
Select *
From layoffs;

----- Removing Duplicate if any 

Select *,
Row_number () over(
Partition by company, location, Industry, total_laid_off, percentage_laid_off,'date', stage, country, funds_raised_millions) As Row_Numb
From layoff_stage;

 CREATE TABLE `layoff_stage2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
   `Row_numb` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

Select *
From Layoff_stage2;

Insert into Layoff_stage2
Select *,
Row_number () over(
Partition by company, location, Industry, total_laid_off, 
percentage_laid_off,'date', stage, country, funds_raised_millions) As Row_Numb
From layoff_stage;

Delete  
From Layoff_stage2
Where Row_numb > 1;

-------------------------------------------- standardizing data

Select company, trim(company)
From Layoff_stage2;

Update Layoff_stage2
set company = trim(company);

Select distinct(industry)
From Layoff_stage2;

Select *
From Layoff_stage2
where Industry LIke "Crypto%";

Update Layoff_stage2
Set Industry = "Crypto"
where Industry LIke "Crypto%";

Select distinct (country), trim(TRAILING '.' from country)
From Layoff_stage2;

	UPDATE Layoff_stage2
	SET country = trim(TRAILING '.' from country)
    Where Country like 'United States%';
    
    
-------------------------------------------- Changing date Format

    Select `date`,
    Str_to_date (`date`, '%m/%d/%Y')
    From layoff_stage2;
    
    Update layoff_stage2
    Set date =   Str_to_date (`date`, '%m/%d/%Y');
    
    Alter table layoff_stage2
    Modify column `date` date;
    
    -------------------------------- Finding NULL value of Industry
    
    Select * 
    From layoff_stage2
    Where industry is Null 
    or Industry = '';
    
    Select *
	From layoff_stage2 TA1
    Join layoff_stage2 TA2
		On ta1.company = ta2.company 
        and ta1.location = ta2.location
	where ta1.industry is null 
    and ta2.industry is not null;
    
    update layoff_stage2 TA1
    Join layoff_stage2 TA2
		On ta1.company = ta2.company 
    set ta1.industry = ta2.industry 
	where ta1.industry is Null 
    and ta2.industry is not null;












    
    
    
    
    
    
    