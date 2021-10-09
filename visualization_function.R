#function1
plot1<-function(x){
  try(if(!is.data.frame(x)) stop("Input data must be a data frame."))
  
  color=ifelse(x$country=="China","red","blue")
  group<-ifelse(x$country=="China",1,2)
  plota<-ggplot(data=x) +
    geom_line(aes(x=year,y=gdp,colour=country,group=group))+
    geom_point(aes(x=year,y=gdp,colour=color))+
    labs(x="YEAR",
         y="GDP",
         subtitle="Line Chart: US vs China of GDP",
         caption="Source:Gapminder")
  return(plota)
}
#input: plot1(tidy_use)


#function2
plot2<-function(x){
  try(if(!is.data.frame(x)) stop("Input data must be a data frame."))
  
  plotb<-ggplot(data=x) +
    geom_bar(aes(x=year,y=gdp,fill=country),position="dodge",stat="identity")+
    labs(x="YEAR",
         y="GDP",
         subtitle="Bar graph: US vs China of GDP",
         caption="Source: Gapminder")
  return(plotb)
}
#input: plot2(tidy_use)


#function3
plot3<-function(x){
  try(if(!is.data.frame(x)) stop("Input data must be a data frame."))
  
  plotc<-ggplot(data=x, aes(x=co2, fill=country)) +
    geom_density(alpha=0.3)
  return(plotc)
}
#input: plot3(tidy_use)


#This task is in Assignment 1 "hand_fuction"

##########################################################

#plot1, line chart
color=ifelse(tidy_use$country=="China","red","blue")
group<-ifelse(tidy_use$country=="China",1,2)
plot1<-ggplot(data=tidy_use) +
  geom_line(aes(x=year,y=gdp,colour=country,group=group))+
  geom_point(aes(x=year,y=gdp,colour=color))+
  labs(x="YEAR",
       y="GDP",
       subtitle="Line Chart: US vs China of GDP",
       caption="Source:Gapminder")
plot1


#plot2, bar graph
plot2<-ggplot(data=tidy_use) +
  geom_bar(aes(x=year,y=gdp,fill=country),position="dodge",stat="identity")+
  labs(x="YEAR",
       y="GDP",
       subtitle="Bar graph: US vs China of GDP",
       caption="Source: Gapminder")
plot2


#plot3, density 
plot3<-ggplot(data=tidy_use, aes(x=co2, fill=country)) +
  geom_density(alpha=0.3)
plot3


