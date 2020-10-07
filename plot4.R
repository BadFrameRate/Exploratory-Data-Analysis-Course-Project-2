#Read data files
pm25data<-readRDS("./summarySCC_PM25.rds")
scc_detail<-readRDS("./Source_Classification_Code.rds")

#calculating and modifying data for plotting
sources<-scc_detail[grep("^Fuel.*Coal",x=scc_detail$EI.Sector),"SCC"]
totemissions<-with(pm25data[pm25data[,2] %in% as.character(sources),],
                   tapply(Emissions, year, sum))
#plot 4
options(scipen=10)
png("plot4.png")
plot(names(totemissions), totemissions, typ="l", col="red", lwd=2, 
     ylab="Total PM2.5 emmissions in tons", xlab="Year")
dev.off()