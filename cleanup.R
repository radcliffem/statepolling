           
cleanup<- function(data){
	
	cleaned <- data.frame(pollster=character(),
                 start=as.Date(character()),
                 end=character(), 
                 state=factor(),
                 clinton=integer(),
                 trump=integer())

	for(i in 1:nrow(data)){
		for(j in 1:nrow(data$questions[i][[1]])){

	if((grepl("^2016 General" , data$questions[i][[1]]$name[j])[1]==FALSE) && 
	    (grepl("President", data$questions[i][[1]]$name[j])[1]==TRUE)&&
	    (sum(grepl("Clinton", data$questions[i][[1]]$subpopulations[[j]]$responses[[1]]$choice))>0)&&
	    (grepl("Primary", data$questions[i][[1]]$name[j])[1]==FALSE)&&
	    (grepl("Caucus", data$questions[i][[1]]$name[j])[1]==FALSE)&&
	    (sum(grepl("Trump", data$questions[i][[1]]$subpopulations[[j]]$responses[[1]]$choice))>0)){
		
		state<-substring(data$questions[i][[1]]$name[j], 6)
		state<-substring(state, 1, regexpr('Pres', state)-2)
		trump<-data$questions[i][[1]]$subpopulations[[j]]$responses[[1]]$value[which(data$questions[i][[1]]$subpopulations[[j]]$responses[[1]]$choice=="Trump")]
		clinton<-data$questions[i][[1]]$subpopulations[[j]]$responses[[1]]$value[which(data$questions[i][[1]]$subpopulations[[j]]$responses[[1]]$choice=="Clinton")]
	
		
		cleaned<-rbind(cleaned,data.frame(pollster=c(data$pollster[i]), start=c(as.Date(data$start_date[i])), end=c(as.Date(data$end_date[i])), state=c(state), clinton=c(clinton), trump=c(trump)))
	}
	}
	
	}

cleaned
}


clear_duplicates<-function(df){

	shortdata<-df[,c("pollster", "start", "state")]
	
	for(i in c((nrow(shortdata)-1):1)){
		for(j in c(nrow(shortdata):(i+1))){
			if(sum(shortdata[i,]==shortdata[j,])==3){

				if(df$clinton[i]+df$trump[i]>df$clinton[j]+df$trump[j]){
					df<-df[-j,]
				}else{
					df<-df[-i,]
			
				}
			
			}
		}
		
		
	}
	
	df
}




