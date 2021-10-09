setwd("C:/Users/L/Downloads")

#install.packages("readxl")
library(readxl)

#install.packages("xlsx")
library("xlsx")

library(tidyverse)

library(tidyr)
library(dplyr)

#install.packages("reader")
library(reader)

##########################################################

#read excel
gdp_all<-read_xlsx("gdp_total_yearly_growth.xlsx")
co2_all<-read_excel("co2_intensity_of_economic_output_kg_co2_per_2011_ppp_of_gdp.xlsx")

as_tibble(gdp_all)
as_tibble(co2_all)

#select 2000 to 2012
gdp<-select(gdp_all,"country","2000":"2012")
co2<-select(co2_all,"country","2000":"2012")

##########################################################

#use pivot_long to tidy the data
gdp_tidy<- gdp %>% 
  pivot_longer(!country,names_to="year",values_to="gdp")

co2_tidy<- co2 %>% 
  pivot_longer(!country,names_to="year",values_to="co2")

#use inner_join to combine the data
tidy<- co2_tidy %>% inner_join(gdp_tidy)

#select two countries
tidy_use<- filter(tidy,country=="United States" | country=="China")


