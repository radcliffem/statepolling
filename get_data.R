setwd("~/Desktop/statedata/")

source('~/Desktop/statedata/scrapedata.R', chdir = TRUE)
source('~/Desktop/statedata/cleanup.R', chdir = TRUE)

partial<-read.csv("cleaned_data.csv")
partial<-partial[,c("pollster", "start", "end", "state", "clinton", "trump")]
new<-gather_data(10)
new_clean<-cleanup(new)
full<-rbind(new_clean, partial)
full_clean<-clear_duplicates(full)
write.csv(full_clean, "cleaned_data.csv")

write(paste("data=", toJSON(full_clean)), file="clean.json")