library(RMySQL)


mydb <- dbConnect(
  MySQL(), 
  user="newuser",
  password="will-20",
  dbname="ITDAproject",
  host="127.0.0.1"
)

dbListTables(mydb)

air_reserve <- dbGetQuery(mydb, 
"
SELECT R.*, RI.*
FROM air_reserve R left JOIN restaurant_info RI USING(ID);
")

air_visit <- dbGetQuery(mydb, 
                        "
SELECT V.*, RI.*
FROM air_visit V left JOIN restaurant_info RI USING(ID);
")
date_info <- dbGetQuery(mydb, 
                        "
SELECT * 
FROM date_info;
")
restaurant_info <- dbGetQuery(mydb, 
                              "
SELECT * 
FROM restaurant_info;
")

# It's polite to let the database know when you're done
dbDisconnect(mydb)

library(tidyverse)

glimpse(air_reserve)
glimpse(air_visit)
glimpse(date_info)
glimpse(restaurant_info)

# We will now write the csv files that we will use in the rest of the analysis

write.csv(air_reserve,"reservation_data.csv")
write.csv(air_visit,"visit_data.csv")
write.csv(date_info,"date_info.csv")
write.csv(restaurant_info,"restaurant_info.csv")

