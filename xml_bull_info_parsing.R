#Bull imformation API parsing (Hanwoo)

#author: Youngjun Na
#Email: ruminoreticulum@gmail.com
#Github: https://github.com/YoungjunNa
#Date: 9/27/2017

#Reference: http://hanwoori.nias.go.kr/openapi/openApiIndex.jsp

bull_info<-function(KPN){
  #package
  require("XML")
  
    #import basic informations
  url1<-paste("http://hanwoori.nias.go.kr/openapi/brblInfoOk.jsp?dataType=xml&brblNo=","KPN",KPN,sep="")
  xmlfile1<-xmlParse(url1)
  xmltop1<-xmlRoot(xmlfile1)
  get_inform<-xmlToDataFrame(getNodeSet(xmlfile1,"//item"),stringsAsFactors=FALSE)
  
    print(get_inform)
}
