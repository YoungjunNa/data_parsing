# 한우 개체 번호 제대로 저장하기
a <- readxl::read_excel("kdhanwoo-final.xlsx")
write.csv(a,"cattle.txt", row.names = FALSE)

a<-read.csv("cattle.txt", colClasses=c("character"))
b<-paste("00",a[,1], sep="")
write.csv(b,"cattle.txt", row.names = FALSE, quote=F) # quote=F 따옴표 제거

df<-read.table("filepath",colClasses = "character")
df$var<- paste("00",df$var,sep="")

# OR

a <- 2123456789 %>% str
sprintf("%012d",a) %>% str


# as.numeric
a<-as.numeric(a$month)
b<-data.frame(month=f)

library(dplyr)
i<-mutate(a, month2=as.numeric(month)) #크~

#한우 개체번호 수정하기
#e.g.: 002 1234 5678 9 into 002123456789

library(stringr)

hanwoo<-readxl::read_excel("jdfarm.xlsx",col_names=FALSE)
colnames(hanwoo)<-"livestockId"
hanwoo$livestockId<-str_sub(hanwoo$livestockId,start=1,end=13)
hanwoo$livestockId<-gsub(" ","",hanwoo$livestockId)
write.csv(hanwoo, "jdfarm.csv", row.names=FALSE)
read.csv("jdfarm.csv", colClasses=c("character"))
