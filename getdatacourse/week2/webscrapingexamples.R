con = url("http://jobs.rubyinside.com/a/jbb/find-jobs")
htmlCode = readLines(con)
close(con)
htmlCode

library(XML)
url <- "http://jobs.rubyinside.com/a/jbb/find-jobs"
html <- htmlTreeParse(url, useInternalNodes=T)
title <- xpathSApply(html, "//title", xmlValue)

url <- "http://jobs.rubyinside.com/a/jbb/find-jobs"
library(httr); html2 = GET(url)
content2 = content(html2,as="text")
parsedHtml = htmlParse(content2,asText=TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)

pg2 = GET("http://httpbin.org/basic-auth/user/passwd", authenticate("user","passwd"))
pg2

google = handle("http://google.com")
pg1 = GET(handle=google,path="/")
pg2 = GET(handle=google,path="search")