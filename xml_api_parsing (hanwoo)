#Function for Carcass imformation API parsing (Hanwoo)

#author: Youngjun Na
#Email: ruminoreticulum@gmail.com
#Github: https://github.com/YoungjunNa
#Date: 9/7/2017

#API key
API_key<-"GET YOUR SERVICE KEY FROM data.go.kr"

#function
hanwoo<-function(Cattle_No){
  
  #package
  require("XML")
  
  #import basic informations
  url1<-paste("http://data.ekape.or.kr/openapi-data/service/user/mtrace/breeding/cattle?cattleNo=",Cattle_No,"&ServiceKey=",API_key,sep="")
  xmlfile1<-xmlParse(url1)
  xmltop1<-xmlRoot(xmlfile1)
  get_inform<-xmlToDataFrame(getNodeSet(xmlfile1,"//item"),stringsAsFactors=FALSE)
  
  #import an issueNo
  url2<-paste("http://data.ekape.or.kr/openapi-data/service/user/grade/confirm/issueNo?animalNo=",Cattle_No,"&ServiceKey=",API_key,sep="")
  xmlfile2<-xmlParse(url2)
  xmltop2<-xmlRoot(xmlfile2)
  get_issueNo<-xmlToDataFrame(getNodeSet(xmlfile2,"//item"),stringsAsFactors=FALSE)
  
  Issue_No<-gsub(" ","",as.character(get_issueNo$issueNo)) #OR Issue_No<-stringr::str_trim(as.character(get_issueNo$issueNo))
  
  #import the carcass characteristics (by using the IssueNo)
  url3<-paste("http://data.ekape.or.kr/openapi-data/service/user/grade/confirm/cattle?issueNo=",Issue_No,"&ServiceKey=",API_key,sep="")
  xmlfile3<-xmlParse(url3)
  xmltop3<-xmlRoot(xmlfile3)
  get_hanwoo<-xmlToDataFrame(getNodeSet(xmlfile3,"//item"),stringsAsFactors=FALSE)
  
  print(get_hanwoo)
  
}

#test
hanwoo("002083191603")
