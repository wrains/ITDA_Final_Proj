library(RMySQL)


mydb <- dbConnect(
  MySQL(), 
  user="newuser",
  password="will-20",
  dbname="ITDAproject",
  host="127.0.0.1"
)

dbListTables(mydb)

dbGetQuery(mydb, "SELECT * FROM air_reserve;")
# It's polite to let the database know when you're done
dbDisconnect(mydb)
