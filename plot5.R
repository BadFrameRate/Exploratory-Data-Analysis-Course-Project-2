#Read data files
pm25data<-readRDS("./summarySCC_PM25.rds")
scc_detail<-readRDS("./Source_Classification_Code.rds")

#calculating data for plotting
sources2<-scc_detail[grep("Motor|vehicle", scc_detail$Short.Name, ignore.case=T), "SCC"]
tot_emissions24510<-pm25data %>% subset(., SCC %in% sources2) %>% subset(., fips=="24510") %>%
                    with(., tapply(Emissions, year, sum))

#plot 5
png("plot5.png")
plot(names(tot_emissions24510), tot_emissions24510, typ="l", col="red", lwd=2, 
     ylab="Total PM2.5 emmissions in tons", xlab="Year")
dev.off()