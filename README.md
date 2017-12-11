# Exam Final: Semester Project 

This is the final project for Intro to Computer Programming fall 2017. The group members for this project are Matthew Dean (Part 1), Kate Fisher (Part 2), and Jack Sparkman (Part 3).  

## Part 1: **Data Reduction and Visualization**
---
  
## Part 2: **Obtaining the error in tumor cell count**
---
In the second part of our analysis, we created a concise, graphical representation of tumor growth as a function of time. The matlab script for this section adds up the total number of tumor cells recorded for each day. We make the assumption that each sum has an uncertainty equal to the total number of cells at the edge of the tumor. Therefore, the script must also identify the boundaries in the data and sum up these values. This was accomplished using bwboundaries(). 

Using these values, we created two graphs with the errorbar() function. The first graph has default scaling, and the second graph has a log scaled y-axis. We can use these graphs to analyze our hypothesis that the data adheres to the Gompertzian growth model.




![ErrorBarPlot](https://github.com/sparkmanjp/finalproject/blob/master/src/TumorGrowthWithErrorBars.png)

![ErrorBarPlotLog](https://github.com/sparkmanjp/finalproject/blob/master/src/LogTumorGrowthWithErrorBars.png)

## Part 3: The Mathematical Model of Tumor Growth
--- 
In this section, we will attempt to find a line of best fit for the data we have been given. Our intial hypothesis is that
tumor growth will follow a Gompertzian growth pattern. Therefore, our goal is to find the unknown parameters of the 
physical model that will create a line of best fit for our experimental data.  

We are given a set of points for each time, and we think that this distribution is fit by the guassian distribution. We would
typically use mean and standard deviation to try to find this best fit, but in this case the mean is not constant, but is 
instead, modeled by the phyical gompertzian model. So to solve this problem, we use the physical model to find the mean at
each time, then calculate the normal probability density function for each of these means. Summing over all of the logs of these
probabilities gives the total probability of a particular data set. The built-in MATLAB function fminsearch can then be utilized
to give the parameters that grant the gompertzian model that gives the best fit to the data. 

Running our function reveals the following ...
```
The optimal parameters for the values are...
lamda = 8.0729,   c = 0.1102,    sigma = 4.0743
```  

Inputing these values into the physical model and plotting against time grants a not only a very good fit to the data, 
but the best fit available. Alternatively, log-scaling the y-axis will give a plot that allows for easy visualization of the 
gompertzian growth at work. At first, the tumor grows very quickly, but as space inside the rat's brain is finite, the growth
is forced to slow down.

 Here are two plots, the first of which shows the plot of our data with the best fit line in a linear scale, and the second 
 of which is the same but log-scaled. 
 
![FinalPlot](https://github.com/sparkmanjp/finalproject/blob/master/src/PlotFinal.png 'Linearly scaled plot')  
![FinalPlotLog](https://github.com/sparkmanjp/finalproject/blob/master/src/PlotFinalLog.png 'Log scaled plot')
 
 
 ###### *Note: These parts are meant to be indepedent from one another, so the final plots in part 3 are missing the error bars found in part 2. For a detailed explination and visualization of error in the data, see part 2.*
