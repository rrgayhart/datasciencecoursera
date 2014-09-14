library(httr)
library(sqldf)
library(RCurl)

get_for_data <- function(){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
  data_response <- getURL(url)
  new_data <- read.fortran(data_response, '4x')
}

get_html_scrape <- function(line_num){
  con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
  htmlCode = readLines(con)
  close(con)
  to_char <- nchar(htmlCode[[line_num]])
  to_char
}

pull_sql_package_data <- function(){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
  data_response <- getURL(url)
  acs <- read.csv(textConnection(data_response))
}

pull_github_data <- function(){ 
  oauth_endpoints("github")

#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
#    Set callback url to http://localhost:1410
  myapp <- oauth_app("github")

  github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

  gtoken <- config(token = github_token)
  req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
  stop_for_status(req)
  data <- content(req, as='parsed')
}