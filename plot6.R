#Read data files
pm25data<-readRDS("./summarySCC_PM25.rds")
scc_detail<-readRDS("./Source_Classification_Code.rds")

#calculating and modifying data for plotting
sources2<-scc_detail[grep("Motor|Vehicle",scc_detail$Short.Name,ignore.case = T),"SCC"]
Baltimore_city<-pm25data %>% subset(.,SCC %in% sources2) %>% subset(.,fips=="24510") %>%
                with(.,tapply(Emissions, year, sum))
Los_Angeles_County<-pm25data %>% subset(.,SCC %in% sources2) %>% subset(.,fips=="06037") %>%
                    with(.,tapply(Emissions, year, sum))
plot_data<-data.frame(Baltimore_city, Los_Angeles_County, year=c(1999,2002,2005,2008)) %>%
           gather(city, value, 1:2)

