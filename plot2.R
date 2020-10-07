#Read data files
pm25data<-readRDS("./summarySCC_PM25.rds")
scc_detail<-readRDS("./Source_Classification_Code.rds")


#calculate total emissions for each year in fips=24510
totemissions24510<-with(pm25data[which(pm25data$fips=="24510"),],
                        tapply(Emissions, year, sum))

#plot 2
options(scipen=10)
png("plot2.png")
plot(names(totemissions24510), totemissions24510, typ="l", col="red", lwd=2, 
     ylab="Total PM2.5 emmissions in tons", xlab="Year")
dev.off()