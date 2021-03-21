
# Creating a function to get links ----------------------------------------

get_company_links <- function(page) {
  page <- read_html(page)
  
  page %>%
    html_nodes(".directory-listing__company a") %>%
    html_attr("href") %>%
    as_tibble() %>%
    rename(companiesLinks = "value")
}


# Creating a function to grab company names ---------------------------------------

get_company_names <- function(page) {
  page <- read_html(page)
  
  page %>%
    html_nodes(".directory-listing__company a") %>%
    html_text() %>%
    as_tibble() %>%
    rename(companies = "value")
}


# Function to grab product list from each company --------------------------------

get_product_list <- function(page) {
  page <- read_html(page)
  
  page %>%
    html_nodes(".directory-categories-tree__category-link") %>%
    html_text() %>%
    as_tibble() %>%
    rename(productLists = "value")
}