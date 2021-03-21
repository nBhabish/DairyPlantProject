# Loading configurations --------------------------------------------------
install.packages("pacman")
pacman::p_load(tidyverse, rvest, purrr, stringr, here)


# Loading helper functions ---------------------------------------------

source(file = here("helpers.R"))


# Butter ------------------------------------------------------------------

dairyFoodButterCompaniesPages <- tibble(page_num = 1:3)

### Creating Dairy Foods Butter Companies Dataset ---------------------------------------------------

dairyFoodButterCompaniesPages <- dairyFoodButterCompaniesPages %>%
  mutate(
    page_link = paste0(
      "https://www.dairyfoods.com/directories/7376/topic/105395?id_raw=7376&page=",
      page_num,
      "&topic_id_raw=105395"
    )
  )


### Adding Company Names and their links ------------------------------------

dairyFoodButterCompaniesPages <- dairyFoodButterCompaniesPages %>%
  mutate(companyNames = map(page_link, get_company_names)) %>%
  mutate(companiesLinks = map(page_link, get_company_links)) %>%
  unnest(c(companyNames, companiesLinks))

dairyFoodButterCompaniesPages


### Creating Company Links for all Butter Companies --------------------------------

dairyFoodsURL <- "https://www.dairyfoods.com"


dairyFoodButterCompaniesPages <- dairyFoodButterCompaniesPages %>%
  mutate(companiesLinks = paste0(dairyFoodsURL, companiesLinks))

### Scraping Product Lists from each company --------------------------------

dairyFoodButterCompaniesPages <- dairyFoodButterCompaniesPages %>%
  mutate(productLists = map(companiesLinks, get_product_list)) %>%
  unnest(productLists) %>% 
  mutate(companyType = "Butter")



# Cheese ------------------------------------------------------------------

dairyFoodCheeseCompaniesPages <- tibble(page_num = 1:21)

### Creating Dairy Foods Cheese Companies Dataset ---------------------------

dairyFoodCheeseCompaniesPages <- dairyFoodCheeseCompaniesPages %>%
  mutate(
    page_link = paste0(
      "https://www.dairyfoods.com/directories/7376/topic/105396?id_raw=7376&page=",
      page_num,
      "&topic_id_raw=105396"
    )
  )

### Adding Cheese Company Names and their Links -----------------------------

dairyFoodCheeseCompaniesPages <- dairyFoodCheeseCompaniesPages %>%
  mutate(companyNames = map(page_link, get_company_names)) %>%
  mutate(companiesLinks = map(page_link, get_company_links)) %>%
  unnest(c(companyNames, companiesLinks))

### Creating Company Links for all Cheese Companies --------------------------------

dairyFoodsURL <- "https://www.dairyfoods.com"

dairyFoodCheeseCompaniesPages <- dairyFoodCheeseCompaniesPages %>%
  mutate(companiesLinks = paste0(dairyFoodsURL, companiesLinks))

dairyFoodCheeseCompaniesPages

### Scraping Product Lists from each Cheese company --------------------------------

dairyFoodCheeseCompaniesPages <- dairyFoodCheeseCompaniesPages %>%
  mutate(productLists = map(companiesLinks, get_product_list)) %>%
  unnest(productLists) %>% 
  mutate(companyType = "Cheese")

  

# Dry Milk Products -------------------------------------------------------


dairyFoodDryMilkCompaniesPages <- tibble(page_num = 1:4)


### Creating Dairy Foods Cheese Companies Dataset ---------------------------

dairyFoodDryMilkCompaniesPages <-
  dairyFoodDryMilkCompaniesPages %>%
  mutate(
    page_link = paste0(
      "https://www.dairyfoods.com/directories/7376/topic/105397?id_raw=7376&page=",
      page_num,
      "&topic_id_raw=105397"
    )
  )


### Adding Dry Milk Company Names and their Links -----------------------------

dairyFoodDryMilkCompaniesPages <-
  dairyFoodDryMilkCompaniesPages %>%
  mutate(companyNames = map(page_link, get_company_names)) %>%
  mutate(companiesLinks = map(page_link, get_company_links)) %>%
  unnest(c(companyNames, companiesLinks))

### Creating Company Links for all Dry Milk Companies --------------------------------

dairyFoodsURL <- "https://www.dairyfoods.com"

dairyFoodDryMilkCompaniesPages <-
  dairyFoodDryMilkCompaniesPages %>%
  mutate(companiesLinks = paste0(dairyFoodsURL, companiesLinks))

dairyFoodDryMilkCompaniesPages

### Scraping Product Lists from each Dry Milk company --------------------------------

dairyFoodDryMilkCompaniesPages <-
  dairyFoodDryMilkCompaniesPages %>%
  mutate(productLists = map(companiesLinks, get_product_list)) %>%
  unnest(productLists) %>% 
  mutate(companyType = "Dry Milk Products")






# FROZEN DESSERT PRODUCTS -------------------------------------------------------


dairyFoodFrozenDessertCompaniesPages <- tibble(page_num = 1:5)


### Creating Dairy Foods FROZEN DESSERT Companies Dataset ---------------------------

dairyFoodFrozenDessertCompaniesPages <-
  dairyFoodFrozenDessertCompaniesPages %>%
  mutate(
    page_link = paste0(
      "https://www.dairyfoods.com/directories/7376/topic/105399?id_raw=7376&page=",
      page_num,
      "&topic_id_raw=105399"
    )
  )


### Adding FROZEN DESSERT Company Names and their Links -----------------------------

dairyFoodFrozenDessertCompaniesPages <-
  dairyFoodFrozenDessertCompaniesPages %>%
  mutate(companyNames = map(page_link, get_company_names)) %>%
  mutate(companiesLinks = map(page_link, get_company_links)) %>%
  unnest(c(companyNames, companiesLinks))

### Creating Company Links for all FROZEN DESSERT Companies --------------------------------

dairyFoodsURL <- "https://www.dairyfoods.com"

dairyFoodFrozenDessertCompaniesPages <-
  dairyFoodFrozenDessertCompaniesPages %>%
  mutate(companiesLinks = paste0(dairyFoodsURL, companiesLinks))

dairyFoodFrozenDessertCompaniesPages

### Scraping Product Lists from each FROZEN DESSERT company --------------------------------

dairyFoodFrozenDessertCompaniesPages <-
  dairyFoodFrozenDessertCompaniesPages %>%
  mutate(productLists = map(companiesLinks, get_product_list)) %>%
  unnest(productLists)%>% 
  mutate(companyType = "Frozen Dessert Products")





# MILK & LIQUID DAIRY PRODUCTS -------------------------------------------------------

tolower("MILK & LIQUID DAIRY PRODUCTS")


dairyFoodMilkAndLiquidDairyCompaniesPages <- tibble(page_num = 1:35)


### Creating Dairy Foods milk & liquid dairy products companies Dataset ---------------------------

dairyFoodMilkAndLiquidDairyCompaniesPages <-
  dairyFoodMilkAndLiquidDairyCompaniesPages %>%
  mutate(
    page_link = paste0(
      "https://www.dairyfoods.com/directories/7376/topic/105400?id_raw=7376&page=",
      page_num,
      "&topic_id_raw=105400"
    )
  )


### Adding milk & liquid dairy products company names and their Links -----------------------------

dairyFoodMilkAndLiquidDairyCompaniesPages <-
  dairyFoodMilkAndLiquidDairyCompaniesPages %>%
  mutate(companyNames = map(page_link, get_company_names)) %>%
  mutate(companiesLinks = map(page_link, get_company_links)) %>%
  unnest(c(companyNames, companiesLinks))

dairyFoodMilkAndLiquidDairyCompaniesPages

### Creating Company Links for all milk & liquid dairy products companies --------------------------------

dairyFoodsURL <- "https://www.dairyfoods.com"

dairyFoodMilkAndLiquidDairyCompaniesPages <-
  dairyFoodMilkAndLiquidDairyCompaniesPages %>%
  mutate(companiesLinks = paste0(dairyFoodsURL, companiesLinks))

dairyFoodMilkAndLiquidDairyCompaniesPages

### Scraping product lists from each milk & liquid dairy products company --------------------------------

dairyFoodMilkAndLiquidDairyCompaniesPages <-
  dairyFoodMilkAndLiquidDairyCompaniesPages %>%
  mutate(productLists = map(companiesLinks, get_product_list)) %>%
  unnest(productLists)%>% 
  mutate(companyType = "Milk & Liquid Dairy Products")











# NONDAIRY BEVERAGES -------------------------------------------------------

tolower("NONDAIRY BEVERAGES")


dairyFoodNonDairyBeveragesCompaniesPages <- tibble(page_num = 1)


### Creating Dairy Foods nondairy beverages companies Dataset ---------------------------

dairyFoodNonDairyBeveragesCompaniesPages <-
  dairyFoodNonDairyBeveragesCompaniesPages %>%
  mutate(
    page_link = paste0(
      "https://www.dairyfoods.com/directories/7376-dairy-plants-usa/topic/105401-nondairy-beverages"
    )
  )


### Adding nondairy beverages company names and their Links -----------------------------

dairyFoodNonDairyBeveragesCompaniesPages <-
  dairyFoodNonDairyBeveragesCompaniesPages %>%
  mutate(companyNames = map(page_link, get_company_names)) %>%
  mutate(companiesLinks = map(page_link, get_company_links)) %>%
  unnest(c(companyNames, companiesLinks))

dairyFoodNonDairyBeveragesCompaniesPages

### Creating Company Links for all nondairy beverages companies --------------------------------

dairyFoodsURL <- "https://www.dairyfoods.com"

dairyFoodNonDairyBeveragesCompaniesPages <-
  dairyFoodNonDairyBeveragesCompaniesPages %>%
  mutate(companiesLinks = paste0(dairyFoodsURL, companiesLinks))

dairyFoodNonDairyBeveragesCompaniesPages

### Scraping product lists from each nondairy beverages company --------------------------------

dairyFoodNonDairyBeveragesCompaniesPages <-
  dairyFoodNonDairyBeveragesCompaniesPages %>%
  mutate(productLists = map(companiesLinks, get_product_list)) %>%
  unnest(productLists) %>% 
  mutate(companyType = "Nondairy Beverages")


# NONFAT DRY MILK (HUMAN) -------------------------------------------------------

tolower("NONFAT DRY MILK (HUMAN)")


dairyFoodNonFatDryMilkCompaniesPages <- tibble(page_num = 1:2)


### Creating Dairy Foods nonfat dry milk (human) companies Dataset ---------------------------

dairyFoodNonFatDryMilkCompaniesPages <-
  dairyFoodNonFatDryMilkCompaniesPages %>%
  mutate(
    page_link = paste0(
      "https://www.dairyfoods.com/directories/7376/topic/105398?id_raw=7376&page=",
      page_num,
      "&topic_id_raw=105398"
    )
  )


### Adding nonfat dry milk (human) company names and their Links -----------------------------

dairyFoodNonFatDryMilkCompaniesPages <-
  dairyFoodNonFatDryMilkCompaniesPages %>%
  mutate(companyNames = map(page_link, get_company_names)) %>%
  mutate(companiesLinks = map(page_link, get_company_links)) %>%
  unnest(c(companyNames, companiesLinks))

dairyFoodNonFatDryMilkCompaniesPages

### Creating Company Links for all nonfat dry milk (human) companies --------------------------------

dairyFoodsURL <- "https://www.dairyfoods.com"

dairyFoodNonFatDryMilkCompaniesPages <-
  dairyFoodNonFatDryMilkCompaniesPages %>%
  mutate(companiesLinks = paste0(dairyFoodsURL, companiesLinks))

dairyFoodNonFatDryMilkCompaniesPages

### Scraping product lists from each nonfat dry milk (human) company --------------------------------

dairyFoodNonFatDryMilkCompaniesPages <-
  dairyFoodNonFatDryMilkCompaniesPages %>%
  mutate(productLists = map(companiesLinks, get_product_list)) %>%
  unnest(productLists)%>% 
  mutate(companyType = "Nonfat Dry Milk (Human)")


# PACKAGING -------------------------------------------------------

tolower("PACKAGING")


dairyFoodPackagingCompaniesPages <- tibble(page_num = 1:14)


### Creating Dairy Foods packaging companies Dataset ---------------------------

dairyFoodPackagingCompaniesPages <-
  dairyFoodPackagingCompaniesPages %>%
  mutate(
    page_link = paste0(
      "https://www.dairyfoods.com/directories/7376/topic/105402?id_raw=7376&page=",
      page_num,
      "&topic_id_raw=105402"
    )
  )


### Adding packaging company names and their Links -----------------------------

dairyFoodPackagingCompaniesPages <-
  dairyFoodPackagingCompaniesPages %>%
  mutate(companyNames = map(page_link, get_company_names)) %>%
  mutate(companiesLinks = map(page_link, get_company_links)) %>%
  unnest(c(companyNames, companiesLinks))

dairyFoodPackagingCompaniesPages

### Creating Company Links for packaging companies --------------------------------

dairyFoodsURL <- "https://www.dairyfoods.com"

dairyFoodPackagingCompaniesPages <-
  dairyFoodPackagingCompaniesPages %>%
  mutate(companiesLinks = paste0(dairyFoodsURL, companiesLinks))

dairyFoodPackagingCompaniesPages

### Scraping product lists from each packaging company --------------------------------

dairyFoodPackagingCompaniesPages <-
  dairyFoodPackagingCompaniesPages %>%
  mutate(productLists = map(companiesLinks, get_product_list)) %>%
  unnest(productLists)%>% 
  mutate(companyType = "Packaging")


# SPECIALTY PRODUCTS -------------------------------------------------------

tolower("SPECIALTY PRODUCTS")


dairyFoodSpecialtyCompaniesPages <- tibble(page_num = 1:2)


### Creating Dairy Foods specialty products companies dataset ---------------------------

dairyFoodSpecialtyCompaniesPages <-
  dairyFoodSpecialtyCompaniesPages %>%
  mutate(
    page_link = paste0(
      "https://www.dairyfoods.com/directories/7376/topic/105404?id_raw=7376&page=",
      page_num,
      "&topic_id_raw=105404"
    )
  )


### Adding specialty products company names and their Links -----------------------------

dairyFoodSpecialtyCompaniesPages <-
  dairyFoodSpecialtyCompaniesPages %>%
  mutate(companyNames = map(page_link, get_company_names)) %>%
  mutate(companiesLinks = map(page_link, get_company_links)) %>%
  unnest(c(companyNames, companiesLinks))

dairyFoodSpecialtyCompaniesPages

### Creating Company Links for specialty products companies --------------------------------

dairyFoodsURL <- "https://www.dairyfoods.com"

dairyFoodSpecialtyCompaniesPages <-
  dairyFoodSpecialtyCompaniesPages %>%
  mutate(companiesLinks = paste0(dairyFoodsURL, companiesLinks))

dairyFoodSpecialtyCompaniesPages

### Scraping product lists from each specialty products company --------------------------------

dairyFoodSpecialtyCompaniesPages <-
  dairyFoodSpecialtyCompaniesPages %>%
  mutate(productLists = map(companiesLinks, get_product_list)) %>%
  unnest(productLists)%>% 
  mutate(companyType = "Specialty Products")



# WHEY & WHEY PRODUCTS -------------------------------------------------------

tolower("WHEY & WHEY PRODUCTS")


dairyFoodWheyCompaniesPages <- tibble(page_num = 1:9)


### Creating Dairy Foods whey & whey products companies dataset ---------------------------

dairyFoodWheyCompaniesPages <- dairyFoodWheyCompaniesPages %>%
  mutate(
    page_link = paste0(
      "https://www.dairyfoods.com/directories/7376/topic/105405?id_raw=7376&page=",
      page_num,
      "&topic_id_raw=105405"
    )
  )


### Adding whey & whey products company names and their Links -----------------------------

dairyFoodWheyCompaniesPages <- dairyFoodWheyCompaniesPages %>%
  mutate(companyNames = map(page_link, get_company_names)) %>%
  mutate(companiesLinks = map(page_link, get_company_links)) %>%
  unnest(c(companyNames, companiesLinks))

dairyFoodWheyCompaniesPages

### Creating Company Links for whey & whey products companies --------------------------------

dairyFoodsURL <- "https://www.dairyfoods.com"

dairyFoodWheyCompaniesPages <- dairyFoodWheyCompaniesPages %>%
  mutate(companiesLinks = paste0(dairyFoodsURL, companiesLinks))

dairyFoodWheyCompaniesPages

### Scraping product lists from each whey & whey products company --------------------------------

dairyFoodWheyCompaniesPages <- dairyFoodWheyCompaniesPages %>%
  mutate(productLists = map(companiesLinks, get_product_list)) %>%
  unnest(productLists)%>% 
  mutate(companyType = "Whey & Whey Products")






# YOGURT & SOUR CREAM -------------------------------------------------------

tolower("YOGURT & SOUR CREAM")


dairyFoodYogurtAndSourCreamCompaniesPages <- tibble(page_num = 1:11)


### Creating Dairy Foods yogurt & sour cream companies dataset ---------------------------

dairyFoodYogurtAndSourCreamCompaniesPages <-
  dairyFoodYogurtAndSourCreamCompaniesPages %>%
  mutate(
    page_link = paste0(
      "https://www.dairyfoods.com/directories/7376/topic/105406?id_raw=7376&page=",
      page_num,
      "&topic_id_raw=105406"
    )
  )


### Adding yogurt & sour cream company names and their Links -----------------------------

dairyFoodYogurtAndSourCreamCompaniesPages <-
  dairyFoodYogurtAndSourCreamCompaniesPages %>%
  mutate(companyNames = map(page_link, get_company_names)) %>%
  mutate(companiesLinks = map(page_link, get_company_links)) %>%
  unnest(c(companyNames, companiesLinks))

dairyFoodYogurtAndSourCreamCompaniesPages

### Creating Company Links for yogurt & sour cream companies --------------------------------

dairyFoodsURL <- "https://www.dairyfoods.com"

dairyFoodYogurtAndSourCreamCompaniesPages <-
  dairyFoodYogurtAndSourCreamCompaniesPages %>%
  mutate(companiesLinks = paste0(dairyFoodsURL, companiesLinks))

dairyFoodYogurtAndSourCreamCompaniesPages

### Scraping product lists from each yogurt & sour cream company --------------------------------

dairyFoodYogurtAndSourCreamCompaniesPages <-
  dairyFoodYogurtAndSourCreamCompaniesPages %>%
  mutate(productLists = map(companiesLinks, get_product_list)) %>%
  unnest(productLists)%>% 
  mutate(companyType = "Yogurt & Sour Cream")




bigData <- rbind(dairyFoodButterCompaniesPages,
      dairyFoodCheeseCompaniesPages,
      dairyFoodDryMilkCompaniesPages,
      dairyFoodFrozenDessertCompaniesPages,
      dairyFoodMilkAndLiquidDairyCompaniesPages,
      dairyFoodNonDairyBeveragesCompaniesPages,
      dairyFoodNonFatDryMilkCompaniesPages,
      dairyFoodPackagingCompaniesPages,
      dairyFoodSpecialtyCompaniesPages,
      dairyFoodWheyCompaniesPages,
      dairyFoodYogurtAndSourCreamCompaniesPages)



# Row Binding all the individual datasets ---------------------------------

bigData <- bigData %>%
  mutate(noSpace = str_remove_all(productLists, pattern = " ")) %>% 
  mutate(mainCategories = str_extract(noSpace, pattern = "^[A-Z 0-9 [:punct:]]+$")) %>%
  mutate(subCategories = str_extract(noSpace, pattern = "(.*[a-z].*)")) %>% 
  fill(mainCategories, .direction = "down") %>% 
  drop_na() %>% 
  mutate(primaryProducts = paste0(mainCategories, "_",subCategories)) %>% 
  select(companyType, companies, primaryProducts) %>% 
  group_by(companyType, companies) %>% 
  mutate(row=row_number()) %>% 
  pivot_wider(names_from = row, values_from = primaryProducts) %>% 
  mutate(companies = factor(companies),
         companyType = factor(companyType)) 


# Dataset Manipulation ----------------------------------------------------

primaryProductsDF <- bigData %>% 
  ungroup() %>% 
  select(-c(companies, companyType))

x <- ncol(primaryProductsDF)

companyIdentification <- bigData %>% 
  select(companies, companyType)

columnNames <- tibble(colNumber = 1:x)

columnNames <- columnNames %>% 
  mutate(colNames = paste0("primary.product", colNumber))



# Changing column names  --------------------------------------------------

colnames(primaryProductsDF) <- columnNames$colNames

dairyDataset <- cbind(companyIdentification, primaryProductsDF) 

dairyDataset <- dairyDataset %>% 
  rename(companyName = "companies")

write.csv(dairyDataset, file = "dairyDataset.csv")

  
