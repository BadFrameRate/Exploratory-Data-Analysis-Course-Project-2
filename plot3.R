#Read data files
pm25data<-readRDS("./summarySCC_PM25.rds")
scc_detail<-readRDS("./Source_Classification_Code.rds")

#calculating and modifying data for plotting
plot_data<-as.data.frame(with(data1[which(data1$fips=="24510"),],
               tapply(Emissions, list(year, type), sum))) %>%
          mutate(year=as.numeric(rownames(.))) %>%
          gather(type,value,1:4)

  
  
