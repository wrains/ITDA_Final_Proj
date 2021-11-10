library(RMySQL)


mydb = dbConnect(
  MySQL(), 
  user="newuser",
  password="",
  dbname="itdaproject",
  host="127.0.0.1"
)

dbListTables(mydb)