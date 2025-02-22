# data merging
# I have datasets from 9 sites.
# I have a total of ~ 91,000 observations. 
# whats the best way to merge these together??????
# the brand ones will be easiest using SKU

# lightspeed data

lightspeeddata <- read_csv('Data/lightspeed_products.csv')

lightspeeddata2 <- lightspeeddata %>% 
  mutate(UPC = as.numeric(UPC)) %>% 
  mutate(`System ID` = as.character(format(`System ID`, scientific = FALSE))) %>% 
  mutate(EAN = trimws(as.character(format(EAN, scientific = FALSE)))) %>% 
  select(`System ID`,
         UPC,
         EAN, 
        `Custom SKU`,
        `Manufact. SKU`)

# simplify data from shopify
# number of products with descriptions (New) = 2,316
# number of Products without Descriptions (New) = 2,806
windancedata2 <- windancedata %>% 
  filter(!is.na(Title)) %>% 
  filter(is.na(`Body (HTML)`)) %>% 
  filter(!grepl('Used', Type)) %>% 
  filter(Published == TRUE) %>% 
  mutate(`Variant SKU` = substring(`Variant SKU`,2)) %>% 
  left_join(lightspeeddata2, by = c('Variant SKU' = 'System ID')) %>% 
  select(`Variant SKU`,
        Title,
        `Body (HTML)`,
        Vendor,
        Type,
        UPC,
        EAN,
        `Custom SKU`,
        `Manufact. SKU`)

# windancedata2 enow hase as SKU data and name. Now I want to join the other dataframes to this based on SKUs. 

# I also need lightspeed data to match SKUs from shopify

# Brand Data

# north
# mystic
# slingshot
# ride engine
# foil drive

# Competitor Data

# Force Kite and Wake
# Green Hat
# NY Kite Center
# Real Watersports
# 