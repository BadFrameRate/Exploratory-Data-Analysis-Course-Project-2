#Read data files
pm25data<-readRDS("./summarySCC_PM25.rds")
scc_detail<-readRDS("./Source_Classification_Code.rds")

#calculating data for plotting
sources2<-scc_detail[grep("Mobile.*Road|Mobile.*Comm",levels(scc_detail$EI.Sector)),"SCC"]
tot_emissions24510<-with(pm25data[pm25data$SCC %in% sources2 & which(pm25data$fips=="24510"),],
                         tapply(Emissions,year,sum))

#plot 5
png("plot5.png")
plot(names(tot_emissions24510), tot_emissions24510, typ="l", col="red", lwd=2, 
     ylab="Total PM2.5 emmissions in tons", xlab="Year")
dev.off()