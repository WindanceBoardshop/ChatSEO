# Get Product data
# this gets product data from
# Foil Drive
# force Kite and Wake
# Green Hat Kiteboarding
# Mystic Boarding
# North Action Sports
# Real Water sports
# Slingshot Water sports

# Data I should Get but is harder to do 
# Mac Kite
# Fone
# 


# loas libs
library(tidyverse)
library(httr2)

# get data from slingshot

# Base URL
url <- "https://slingshotsports.com/products.json?limit=250&page="
page <- 1
all_products <- list()  # Initialize empty list

repeat {
  # Construct the full URL
  fullurl <- paste0(url, page)
  
  # Perform the GET request and parse JSON
  response <- request(fullurl) %>% 
    req_method("GET") %>% 
    req_perform() %>% 
    resp_body_json()
  
  # Check if products exist
  if (length(response$products) == 0) {
    message("No more products found. Stopping download.")
    break
  }
  
  # Append to master list
  all_products <- append(all_products, response$products)
  
  # Print progress
  message("Fetched page ", page, " with ", length(response$products), " products.")
  
  # Increment page number
  page <- page + 1
}

# unnest data and format

slingdata <- all_products %>% 
  tibble %>% 
  unnest_wider(1) %>% 
  unnest_longer(variants) %>% 
  unnest_wider(variants,names_sep = '_')

# get data from real


# Base URL
url <- "https://realwatersports.com/products.json?limit=250&page="
page <- 1
all_products <- list()  # Initialize empty list

repeat {
  # Construct the full URL
  fullurl <- paste0(url, page)
  
  # Perform the GET request and parse JSON
  response <- request(fullurl) %>% 
    req_method("GET") %>% 
    req_perform() %>% 
    resp_body_json()
  
  # Check if products exist
  if (length(response$products) == 0) {
    message("No more products found. Stopping download.")
    break
  }
  
  # Append to master list
  all_products <- append(all_products, response$products)
  
  # Print progress
  message("Fetched page ", page, " with ", length(response$products), " products.")
  
  # Increment page number
  page <- page + 1
}

# unnest data and format

realdata <- all_products %>% 
  tibble %>% 
  unnest_wider(1) %>% 
  unnest_longer(variants) %>% 
  unnest_wider(variants,names_sep = '_')

# get data from north


# Base URL
url <- "https://northactionsports.com/products.json?limit=250&page="
page <- 1
all_products <- list()  # Initialize empty list

repeat {
  # Construct the full URL
  fullurl <- paste0(url, page)
  
  # Perform the GET request and parse JSON
  response <- request(fullurl) %>% 
    req_method("GET") %>% 
    req_perform() %>% 
    resp_body_json()
  
  # Check if products exist
  if (length(response$products) == 0) {
    message("No more products found. Stopping download.")
    break
  }
  
  # Append to master list
  all_products <- append(all_products, response$products)
  
  # Print progress
  message("Fetched page ", page, " with ", length(response$products), " products.")
  
  # Increment page number
  page <- page + 1
}

# unnest data and format

northdata <- all_products %>% 
  tibble %>% 
  unnest_wider(1) %>% 
  unnest_longer(variants) %>% 
  unnest_wider(variants,names_sep = '_')

# get data from mystic


# Base URL
url <- "https://mysticboarding.com/products.json?limit=250&page="
page <- 1
all_products <- list()  # Initialize empty list

repeat {
  # Construct the full URL
  fullurl <- paste0(url, page)
  
  # Perform the GET request and parse JSON
  response <- request(fullurl) %>% 
    req_method("GET") %>% 
    req_perform() %>% 
    resp_body_json()
  
  # Check if products exist
  if (length(response$products) == 0) {
    message("No more products found. Stopping download.")
    break
  }
  
  # Append to master list
  all_products <- append(all_products, response$products)
  
  # Print progress
  message("Fetched page ", page, " with ", length(response$products), " products.")
  
  # Increment page number
  page <- page + 1
}

# unnest data and format

mysticdata <- all_products %>% 
  tibble %>% 
  unnest_wider(1) %>% 
  unnest_longer(variants) %>% 
  unnest_wider(variants,names_sep = '_')

# get greenhat data


# Base URL
url <- "https://greenhatkiteboarding.com/products.json?limit=250&page="
page <- 1
all_products <- list()  # Initialize empty list

repeat {
  # Construct the full URL
  fullurl <- paste0(url, page)
  
  # Perform the GET request and parse JSON
  response <- request(fullurl) %>% 
    req_method("GET") %>% 
    req_perform() %>% 
    resp_body_json()
  
  # Check if products exist
  if (length(response$products) == 0) {
    message("No more products found. Stopping download.")
    break
  }
  
  # Append to master list
  all_products <- append(all_products, response$products)
  
  # Print progress
  message("Fetched page ", page, " with ", length(response$products), " products.")
  
  # Increment page number
  page <- page + 1
}

# unnest data and format

greendata <- all_products %>% 
  tibble %>% 
  unnest_wider(1) %>% 
  unnest_longer(variants) %>% 
  unnest_wider(variants,names_sep = '_')

# get windance data

windancedata <- read_csv('Data/shopify_products.csv')

# get foil drive data


# Base URL
url <- "https://foildrive.com/products.json?limit=250&page="
page <- 1
all_products <- list()  # Initialize empty list

repeat {
  # Construct the full URL
  fullurl <- paste0(url, page)
  
  # Perform the GET request and parse JSON
  response <- request(fullurl) %>% 
    req_method("GET") %>% 
    req_perform() %>% 
    resp_body_json()
  
  # Check if products exist
  if (length(response$products) == 0) {
    message("No more products found. Stopping download.")
    break
  }
  
  # Append to master list
  all_products <- append(all_products, response$products)
  
  # Print progress
  message("Fetched page ", page, " with ", length(response$products), " products.")
  
  # Increment page number
  page <- page + 1
}

# unnest data and format

foildrivedata <- all_products %>% 
  tibble %>% 
  unnest_wider(1) %>% 
  unnest_longer(variants) %>% 
  unnest_wider(variants,names_sep = '_')

# get force wake data

  # Base URL
  url <- "https://forcekiteandwake.com/products.json?limit=250&page="
page <- 1
all_products <- list()  # Initialize empty list

repeat {
  # Construct the full URL
  fullurl <- paste0(url, page)
  
  # Perform the GET request and parse JSON
  response <- request(fullurl) %>% 
    req_method("GET") %>% 
    req_perform() %>% 
    resp_body_json()
  
  # Check if products exist
  if (length(response$products) == 0) {
    message("No more products found. Stopping download.")
    break
  }
  
  # Append to master list
  all_products <- append(all_products, response$products)
  
  # Print progress
  message("Fetched page ", page, " with ", length(response$products), " products.")
  
  # Increment page number
  page <- page + 1
}

# unnest data and format

forcewakedata <- all_products %>% 
  tibble %>% 
  unnest_wider(1) %>% 
  unnest_longer(variants) %>% 
  unnest_wider(variants,names_sep = '_')


# get data from Calikites



# Base URL
url <- "https://www.calikites.com/products.json?limit=250&page="
page <- 1
all_products <- list()  # Initialize empty list

repeat {
  # Construct the full URL
  fullurl <- paste0(url, page)
  
  # Perform the GET request and parse JSON
  response <- request(fullurl) %>% 
    req_method("GET") %>% 
    req_perform() %>% 
    resp_body_json()
  
  # Check if products exist
  if (length(response$products) == 0) {
    message("No more products found. Stopping download.")
    break
  }
  
  # Append to master list
  all_products <- append(all_products, response$products)
  
  # Print progress
  message("Fetched page ", page, " with ", length(response$products), " products.")
  
  # Increment page number
  page <- page + 1
}

# unnest data and format

forcewakedata <- all_products %>% 
  tibble %>% 
  unnest_wider(1) %>% 
  unnest_longer(variants) %>% 
  unnest_wider(variants,names_sep = '_')

# get data from Ride Engine



# Base URL
url <- "https://rideengine.com/products.json?limit=250&page="
page <- 1
all_products <- list()  # Initialize empty list

repeat {
  # Construct the full URL
  fullurl <- paste0(url, page)
  
  # Perform the GET request and parse JSON
  response <- request(fullurl) %>% 
    req_method("GET") %>% 
    req_perform() %>% 
    resp_body_json()
  
  # Check if products exist
  if (length(response$products) == 0) {
    message("No more products found. Stopping download.")
    break
  }
  
  # Append to master list
  all_products <- append(all_products, response$products)
  
  # Print progress
  message("Fetched page ", page, " with ", length(response$products), " products.")
  
  # Increment page number
  page <- page + 1
}

# unnest data and format

rideenginedata <- all_products %>% 
  tibble %>% 
  unnest_wider(1) %>% 
  unnest_longer(variants) %>% 
  unnest_wider(variants,names_sep = '_')


# get data from NY kite




# Base URL
url <- "https://nykitecenter.com/products.json?limit=250&page="
page <- 1
all_products <- list()  # Initialize empty list

repeat {
  # Construct the full URL
  fullurl <- paste0(url, page)
  
  # Perform the GET request and parse JSON
  response <- request(fullurl) %>% 
    req_method("GET") %>% 
    req_perform() %>% 
    resp_body_json()
  
  # Check if products exist
  if (length(response$products) == 0) {
    message("No more products found. Stopping download.")
    break
  }
  
  # Append to master list
  all_products <- append(all_products, response$products)
  
  # Print progress
  message("Fetched page ", page, " with ", length(response$products), " products.")
  
  # Increment page number
  page <- page + 1
}

# unnest data and format

nykitedata <- all_products %>% 
  tibble %>% 
  unnest_wider(1) %>% 
  unnest_longer(variants) %>% 
  unnest_wider(variants,names_sep = '_')
