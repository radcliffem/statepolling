library(jsonlite)

gather_data<-function(n){
	data<-fromJSON("http://elections.huffingtonpost.com/pollster/api/polls.json?topic=2016-president&page=1&showall=false")
	
	first_url<-"http://elections.huffingtonpost.com/pollster/api/polls.json?topic=2016-president&page="
	last_url<-"&showall=false"
	
	for(i in 2:n){
		url<-paste(first_url, i, last_url, sep="")
		data<-rbind(data, fromJSON(url))
	}
	
	data	

}