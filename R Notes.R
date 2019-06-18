seq(2,74)
seq(1,5,.5)
seq(from=1,to=5,by=.1)
seq(5,0,-1)
#colon produces int, c produces numeric, seq produces either

paste(1:4)
class(paste(1:4))
paste('xyz',1:10)
paste('xyz',c(2,5,7,'test',4.5))
paste('xyz',1:10,sep='')

rep(c(3,4,5),3)
rep(1:10,times=3)
x=c(1,2,3) #creating x
rep(x,each=3)#using each
rep(x,each=3,times=3)#combining arguments

x=4:20
which(x==10)
x[3]

#Video 12
#1)

myobject = 1:10
myobject <- 1:10
1:10->myobject
assign('myobject',1:10)

#2)

sum(myobject)

#3)

char=paste('R is great and',c(4,7,45),'and I will love it')


#4)

vec=1:3
new=c(rep(vec,times=3),vec[1])
new=rep(vec,length=31)

#5)
    
new[7]

#Video 13

#{} are instructions for something to follow

myfirstfn <- function(x) {x+x}
myfirstfn(10)

mysecondfn<-function(t,z) {
  value = z*3
  value = value*t
  print(value)}
t=5
z=9
mysecondfn(t,z)

for(i in 1:15) {print(i)}
for(z in 1:15) {print(z)}

#Video 14

#datasets package to find practice datasets
#head() and tail() to get first and last 6 rows from a dataset
#summary() to get basic statistics for each variable (min,max,mean,media,quarts, etc)
#can plot datasets
#hist() is useful for datasets with one variable ie time series

#$ for specifying column
sum(mtcars$wt) #sum of wt col of mtcars

#attach() to attach dataset to R session environment
#detach() to detach''''
#useful if working with one main dataframe
attach(mtcars)
sum(wt)
detach(mtcars)

#indexing datasets
mtcars[2,6]#brackets, row, then col of variable
mtcars[c(2,5,8),6]#vector of rows, col of var

#Video 15

#import dataset
#.csv comma seperated values-> recommended file type
#generally want to untick "strings as factors" in import dataset

#scan function: copy data from excel, do scan(), run line, paste into console, enter
#^works for double (default)
#for any other class, specify what ie characters=scan(what="character")

#Video 16

#fread- from package data.table
#separator is automatically recognized, strings are not automatically converted to factors, can use stringsAsFactors=true, automatically converted to factors
#output: data.table class by default, data.frame if data.table=false in input
#make sure wanted data is in current directory
#mydata=fread("full name of dataset in directory")
#can copy table from anywhere ie online, copy in fread within quotes and run to get object in r
#if this data does not copy headers, can set col.names to a vector of headers in fread to get headers in object

#use foreign for more exotic types of data
#ie sas, stata,octave, minilab, spss
#function('fn') fn in working directory

#can also use hmisc package
#.csv highly preferrable, when exporting try todo in .csv

#Video 18
#object lengths must be equal for plot
#title parameter is main=
#color parameter is col=
#title color is col.main=
#cex.main changes title size (scale factor)
#xlab= and ylab= for axis titles
#las= to adjust axis scales

#session parameter par(), for 2X2 plot matrix mfrow=c(2,2)

#Video 19

#colors() gives list of all available colors and color codes
#?pch gives point symbols codes, 21-25 can be colored
#can also use a string for pch=
#par(mfrow=c(1,1),col.axis='black') will restore plot session defaults

#ablineclip needs library(plotrix)
#lwd= for line width
#lty= has value from 0-6 for 7 different line styles, line style 0 is blank
#v= is for x value of vertical line

#plot(type='Type _) is for different _ plot types, 'p' (points) is default, 'l' is default for time series
#par(mar=c(_,_,_,_)) changes margins
#plot(bty='n') means remove box around plot,bty= is box type
#text() for explanatory text
#text(x,y,text,cex=,col=) x and y are starting coordinates for text 

#par(new=TRUE) plots new graph on top of new (hold on)
#when overlapping plots, be sure to change color and do plot(ann=F, axes=F) to suppress axes
#then can set plot(side=_) to add different axis on other side
#also add explanatory text
#for title can use \n in string for long title
#par() gives par defaults

#use plots>export to export plots as image or pdf

#Video 20

plot(1:length(rivers),rivers,col='green',pch=20,xlab='',ylab='length in miles',main='Length of\nMajor N. American Rivers', col.main='red')

#Video 21

#use session>set working directory to set where .csv is as working
#use import dataset>from text for .csv

#Video 22

#apply family of function- elegant way to do loops

x = matrix(c(1:9),nr=3,byrow=T)

apply(x,1,mean) #gives mean of every row
apply(x,2,mean) #gives mean of every col

apply(x,1,plot)

#Video 23

library(ggplot2)
attach(diamonds)

qqnorm(depth) #}Too curvy for normal dist
hist(depth)   #}Shows that the data is not normalized

depthsmall = sample(depth,5000)#shapiro test only works with a max 5000 points

shapiro.test(depthsmall)#p value is highly significant (small) meaning not normal distribution

library(nortest)#more normality tests

cvm.test(depth)#low p val

lillie.test(depth)#low p val

sf.test(depthsmall) #shapiro family of tests, only works with a max 5000 points
#low p val

pearson.test(depth) #low p val

# therefore not normally distributed,
# need to use nonparametric stats tests,
# or need to some log transformation

# Video 24

library(lattice)

histogram(~Sepal.Length | Species, xlab='',
          data=iris,layout=c(3,1),type='density',
          main='Lattice Histogram',sub='Iris Sataset, Sepal Length')

# Q Q plot = Quantile Quantile Plots
# plot qualities of the dataset againsts qualities of a theoretical 
# distribution 
# in case the chosen distribution is met you can find a nearly linear plot

qqmath(~Sepal.Length | Species, data=iris)

qqmath(~Sepal.Length | Species, data=iris, distribution = qunif)

# Boxplots in lattice
bwplot(Species~Sepal.Length,data=iris)

#violin plot in lattice

bwplot(Species~Sepal.Length,data=iris,panel = panel.violin)


#Exercises
#1a
length(lynx)
#1b
order(lynx)
#1c
ind = which(lynx<500)
set = subset(lynx,lynx<500)
#subset is basically masking and which is find

#2a-d

hist(lynx,breaks = 7,xlab = '',ylab = '',
     main = 'Exercise Question\n Histogram',sub='r-tutorials.com',
     col = c('blue','salmon'))

# 3a
mysepal = iris$Sepal.Length

# 3b
summation = sum(mysepal)
mean = mean(mysepal)
med = median(mysepal)
maximum = max(mysepal)
minimum = min(mysepal)

# 3c
summary(mysepal)

# 4a-c
install.packages('dplyr')
library(dplyr)
?arrange
remove.packages('dplyr')

#5
x = c(3,6,9)
myvec = c(1,rep(x,times=3),1)
library(dplyr)
nth(myvec, 5)

# 6
mysubset = subset(mtcars,am==1)
mysubset[c(1,2),c(2,1)]

# 7

head(mtcars,9)

library(dplyr)
arrange(mtcars,carb)

# 8











