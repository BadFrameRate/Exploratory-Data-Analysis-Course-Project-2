#Read data files
pm25data<-readRDS("./summarySCC_PM25.rds")
scc_detail<-readRDS("./Source_Classification_Code.rds")

#calculate total emissions for each year
total_emissions<-with(pm25data, tapply(Emissions, year, sum,))

#plot 1
options(scipen=10) #to remove scientific notation from plots
png("plot1.png")
plot(names(total_emissions), total_emissions, typ="l", col="red", lwd=2, 
     ylab="Total PM2.5 emmissions in tons", xlab="Year")
dev.off()