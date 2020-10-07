#Read data files
pm25data<-readRDS("./summarySCC_PM25.rds")
scc_detail<-readRDS("./Source_Classification_Code.rds")

#calculating and modifying data for plotting
plot_data<-as.data.frame(with(data1[which(data1$fips=="24510"),],
               tapply(Emissions, list(year, type), sum))) %>%
          mutate(year=as.numeric(rownames(.))) %>%
          gather(type,value,1:4)

#plot 3
png("plot3.png")
ggplot(plot_data,aes(year,value))+
  geom_line()+
  facet_wrap(.~type, scales="free_y")+
  geom_line(data=plot_data[which(plot_data$year==1999|plot_data$year==2008),],
            aes(year,value),linetype=2,size=.5,col="red")+
  labs(y="Total PM2.5 emissions in tons")
dev.off()