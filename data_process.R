library(tidyverse)

data1<-read_csv("EPS_25032023025613899.csv")
data2<-read_csv("EPS_25032023025804992.csv")
data3<-read_csv("EPS_25032023025234523.csv")
data4<-read_csv("EPS_25032023025245634.csv")
data5<-read_csv("EPS_25032023025892157.csv")
data6<-read_csv("EPS_25032023025578431.csv")

pivot_fun <- function(x, value_column = "Environmental_Policy_Stringency_Value") {
  x %>%
    pivot_longer(starts_with("1990"), names_to = "year", values_to = value_column)%>%
    select(Country,Year,value_column)
}

combine_new<-function(x, y) {
  data_new<-merge(x,y,by=c("Country","Year"))
}

data1_new<-pivot_fun(data1,"Carbon dioxide_value")
data2_new<-pivot_fun(data2,"Methane_Value")
data3_new<-pivot_fun(data3,"Nitrous oxide_Value")
data4_new<-pivot_fun(data4,"Variable of Ambient Particulate Matter")
data5_new<-pivot_fun(data5,"Particulates (PM2.5) _Value")
data6_new<-pivot_fun(data6)

data_new<-combine_new(data1_new,data2_new)
data_new<-combine_new(data_new,data3_new)
data_new<-combine_new(data_new,data4_new)
data_new<-combine_new(data_new,data5_new)
data_new<-combine_new(data_new,data6_new)

