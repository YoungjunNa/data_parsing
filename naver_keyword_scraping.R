
library(rvest)
library(stringr)

keyword <- "청와대"
keyword <- gsub(" ","+",keyword)

#naver results into dataframe

#1st_depth
url <- paste0("https://search.naver.com/search.naver?where=nexearch&sm=osp_hty&ie=UTF-8&query=",keyword)
html <- read_html(url, encoding="UTF-8")

related_depth_1 <-html %>% html_node(".relate_area") %>% html_children() %>% html_text() 
related_depth_1 <- related_depth_1[2] 
#related_depth_1 <- gsub("  ","",related_depth_1)
related_depth_1 <- str_split(related_depth_1, "   ") 
related_depth_1 <- data.frame(related_depth_1)
colnames(related_depth_1) <- "first_depth"

#2nd_depth
n <- nrow(related_depth_1)
result <- related_depth_1
result <- cbind(result, second_depth=NA)
result <- cbind(result, searching_time=Sys.time())

for(i in 0:(n-1)){
  
  nb=i+1
  keyword <- result[nb,1]
  keyword <- gsub(" ","+",keyword)
  
  #naver results into dataframe
  url <- paste0("https://search.naver.com/search.naver?where=nexearch&sm=osp_hty&ie=UTF-8&query=",keyword)
  html <- read_html(url, encoding="UTF-8")
  
  related_depth_2 <-html %>% html_node(".relate_area") %>% html_children() %>% html_text() 
  related_depth_2 <- related_depth_2[2] 
  #related_depth_2 <- gsub("  ","",related_depth_2)
  
  result[nb,2] <- related_depth_2 
  
}