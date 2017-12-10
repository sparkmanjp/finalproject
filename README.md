#Exam Final: Semester Project 
This is the final project for Matthew Dean (Part 1), Kate Fisher (Part 2), and Jack Sparkman (Part 3).  

##Part 1: **Data Reduction and Visualization**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
##Part 2: **Obtaining the error in tumor cell count**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  

##Part 3: **The Mathematical Model of Tumor Growth**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
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
gompertzian growth at work. At first, the tumor grows very quickly, but at space inside the rat's brain is finite, the growth
is forced to slow down.

 Here are two plots, the first of which shows the plot of our data with the best fit line in a linear scale, and the second 
 of which is the same but log-scaled. 
 
 