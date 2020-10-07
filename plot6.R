#Read data files
pm25data<-readRDS("./summarySCC_PM25.rds")
scc_detail<-readRDS("./Source_Classification_Code.rds")

#calculating and modifying data for plotting
sources2<-scc_detail[grep("Motor|Vehicle",scc_detail$Short.Name,ignore.case = T),"SCC"]
tot_emissions24510<-pm25data %>% subset(.,SCC %in% sources2) %>% subset(.,fips=="24510") %>%
                with(.,tapply(Emissions, year, sum))
tot_emissions06037<-pm25data %>% subset(.,SCC %in% sources2) %>% subset(.,fips=="06037") %>%
                    with(.,tapply(Emissions, year, sum))
plot_data<-data.frame(Baltimore_city=tot_emissions24510, 
                      Los_Angeles_County=tot_emissions06037,
                      year=c(1999,2002,2005,2008)) %>%
           gather(city, value, 1:2)

#plot 6
png("plot6.png")
ggplot(plot_data,aes(year,value,col=city))+geom_line()+geom_point()+
  labs(y="Total PM2.5 emissions in tons")
dev.off()