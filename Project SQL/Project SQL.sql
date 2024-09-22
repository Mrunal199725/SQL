Create database Project;
Use Project;

Select * from Beauty_products;

-- 1. Which product has the highest rating?
Select Product_name, Brand, Category
From beauty_products
Order by Rating desc
Limit 1;

-- Insights --   
-- From this we will get to know about the highest rating product from the data

-- 2. Which product has the most reviews?
 Select Product_name, Brand, Category
From beauty_products
Order by Number_of_reviews desc
Limit 1;

-- Insights --   
-- This information shows which product has the highest number of reviews from the data

-- 3. Which are the top 5 brands
Select Product_name, Brand, Category
From beauty_products
Order by Price_usd
Limit 5;  

-- Insights -- 
-- This shows the top 5 brands from the dataset

-- 4. What is the average rating across all products?
Select avg(rating) as Avg_Rate
From beauty_products;

-- Insights --   
-- This shows the average ratings for all the products

-- 5. What are the most common main ingredients across the products?
SELECT Main_Ingredient, COUNT(*) AS Ingredient_Count
FROM beauty_products
GROUP BY Main_Ingredient
ORDER BY Ingredient_Count DESC;  

-- Insights --  
-- This shows the ingredients used in each of the product

-- 6. Which brand has the most products aimed at unisex users?
SELECT Brand, COUNT(*) AS Product_Count
FROM beauty_products
WHERE Gender_Target = 'Unisex'
GROUP BY Brand
ORDER BY Product_Count DESC
LIMIT 5; 

-- Insights --  
-- This gives us the information of the top 5 brands that are used by specifically unisex gender

-- 7. Which country of origin has the most products listed?
SELECT Country_of_Origin, COUNT(*) AS Product_Count
FROM beauty_products
GROUP BY Country_of_Origin
ORDER BY Product_Count DESC
LIMIT 5;

-- Insights --   
-- This gives us the inforamtion regarding the counrty of origin have the most products listed

-- 8. How many products target sensitive skin?
SELECT COUNT(*) AS Sensitive_Skin_Count
FROM beauty_products
WHERE Skin_Type = 'Sensitive';

-- Insights --  
-- This shows how much products are deliberately targets the sensitive skin

-- 9. How many products are there for each skin type (sensitive, dry, normal, oily, combination)?
SELECT Skin_Type, COUNT(*) AS Product_Count
FROM beauty_products
GROUP BY Skin_Type; 

-- Insights --  
-- This shows how much products are there for each of the skin type

-- 10. Which product has the highest rating among those with more than 1000 reviews?
SELECT Product_Name, Brand, Rating
FROM beauty_products
WHERE Number_of_Reviews > 1000
ORDER BY Rating DESC
LIMIT 5;  

-- Insights --  
-- From this query we will get to know the products that have the highest rating

-- 11. How many products are aimed specifically at females compared to males?
SELECT Gender_Target, COUNT(*) AS Product_Count
FROM beauty_products
WHERE Gender_Target IN ('Female', 'Male')
GROUP BY Gender_Target;

-- Insights --    
-- This query shows how much products are usable for male and for female separately

-- 12. How frequently is each product intended to be used (daily, weekly, monthly, occasional)?
SELECT Product_Name, Usage_Frequency
FROM beauty_products; 

-- Insights --  
-- This shows the usage frequency for all the products

-- 13. What types of packaging are used for the products (tube, bottle, compact, jar)?
SELECT DISTINCT Packaging_Type
FROM beauty_products; 

-- Insights --   
-- This show the data for the packaging type

-- 14. Are there any patterns in the usage frequency of products based on their main ingredient and skin type?
SELECT 
    Main_Ingredient,
    Skin_Type,
    Usage_Frequency,
    COUNT(*) AS Product_Count,
    AVG(Price_USD) AS Average_Price,
    AVG(Rating) AS Average_Rating
FROM 
    beauty_Products
GROUP BY 
    Main_Ingredient, 
    Skin_Type, 
    Usage_Frequency
ORDER BY 
    Main_Ingredient, 
    Skin_Type, 
    Usage_Frequency;
    
-- Insights --      
-- This gives us the information of main ingredients for the skin types with usage frequency, number of products their average prices and the average rating

-- 15. In which countries do the highest-rated products originate, and what categories and price ranges do they fall into?
SELECT 
    Country_of_Origin,
    Category,
    MAX(Rating) AS Highest_Rating,
    MIN(Price_USD) AS Lowest_Price,
    MAX(Price_USD) AS Highest_Price
FROM 
    Beauty_Products
GROUP BY 
    Country_of_Origin, 
    Category
ORDER BY 
    Highest_Rating DESC, 
    Country_of_Origin;
  
-- Insights --    
-- This is the data for category of the products having the country of origin, their highest rating with the lowest and the highest prices

-- 16. What percentage of products have ratings between 3 and 4, and how does that compare to those above or below this range?
SELECT
    COUNT(*) AS total_products,
    SUM(CASE WHEN Rating BETWEEN 3 AND 4 THEN 1 ELSE 0 END) AS in_range,
    SUM(CASE WHEN Rating < 3 THEN 1 ELSE 0 END) AS below_range,
    SUM(CASE WHEN Rating > 4 THEN 1 ELSE 0 END) AS above_range,
    (SUM(CASE WHEN Rating BETWEEN 3 AND 4 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage_in_range,
    (SUM(CASE WHEN Rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage_below_range,
    (SUM(CASE WHEN Rating > 4 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage_above_range
FROM
    Beauty_products;
    
-- Insights --      
-- This query helps analyze product performance in terms of customer satisfaction, guiding decisions for brands, marketers, and product managers.

-- 17. Which main ingredient appears most frequently, and what is its average rating?
SELECT
    Main_Ingredient,
    COUNT(*) AS ingredient_count,
    AVG(Rating) AS average_rating
FROM
    Beauty_products
GROUP BY
    Main_Ingredient
ORDER BY
    ingredient_count DESC
LIMIT 1;

-- Insights --  
-- This information can help identify popular ingredients in the dataset and how well they are rated by consumers.

-- 18. How do ratings of face masks compare to those of cleansers?
SELECT
    Category,
    COUNT(*) AS product_count,
    AVG(Rating) AS average_rating
FROM
   Beauty_products
WHERE
    Category IN ('Face Mask', 'Cleanser')
GROUP BY
    Category;
    
-- Insights --      
-- It can inform product development and marketing strategies based on customer preferences and performance.

-- 19. Are there notable trends in pricing or ratings based on the country of origin?
SELECT
    Country_of_Origin,
    COUNT(*) AS product_count,
    AVG(Price_USD) AS average_price,
    AVG(Rating) AS average_rating
FROM
   Beauty_products
GROUP BY
    Country_of_Origin
ORDER BY
    average_price DESC;
 
-- Insights --  
-- The analysis of pricing and ratings by country of origin reveals potential market opportunities, quality perceptions, and cultural influences in beauty product preferences.

-- 20. How do luxury beauty brands from different countries compare in terms of pricing and ratings?
SELECT
    Brand,
    Country_of_Origin,
    Product_Name,
    Price_USD,
    Rating
FROM
    Beauty_products
WHERE
    Price_USD > 100  -- Assuming luxury brands are priced above $100
ORDER BY
    Country_of_Origin, 
    Brand;
    
-- Insights --      
-- This detailed data will allow for direct comparisons of individual luxury products across different countries, showcasing variations in pricing and customer satisfaction.



 



     
 
 
 
 
  
  


