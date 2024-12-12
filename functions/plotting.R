## Investigatory Scatter Plot ##

#Creates a scatter plot of two continuous variables, colours based on species
#x_lab and y_lab inputted as a string

scatter_plot <- function(dataSet, 
                         x_column, 
                         y_column, 
                         x_lab, 
                         y_lab,
                         colourScheme){
  ggplot(data = dataSet, 
         aes(x = {{x_column}}, #specifies the x and y axis
             y = {{y_column}}, 
             colour = species, #the variable that determines colour
             linetype = species #the variable that determines regression line type 
         )) +
    geom_point(size = 2, #geom_point adds in the data points
               alpha = 0.7) + #alpha controls opacity of points
    scale_colour_manual(values = (colourScheme)) + #specifies the colours 
    labs(x = x_lab, y = y_lab, colour = "Species") + #labels the axis and legend
    theme_bw() + #specifies the bw theme
    theme(legend.position = c(0.125, 0.775), #legend location
          legend.background = element_rect(
            linetype = "solid", colour= "black")) #legend border
}

##linear regression plot ##

#This function takes scatter_plot() and adds the linear regression line.
#The linear regression line can be changed for different linear models by changing
#the 'model' parameter. 

#x_lab and y_lab inputted as a string

linear_regression_plot <- function(dataSet, 
                                   x_column, 
                                   y_column, 
                                   x_lab, 
                                   y_lab, 
                                   colourScheme, 
                                   model){
  scatter_plot(dataSet, 
               {{x_column}}, 
               {{y_column}}, #
               x_lab, 
               y_lab, 
               colourScheme) +
    geom_line(aes(y = {{model}}), #adds lines following the linear model
              size = 1, 
              color = "black", 
              show.legend = FALSE) #legend is already shown from scatter_plot()
}

## Q-Q plot ##

qqplot <-  function(model) {
  qqnorm(resid(model)) #Plots the points
  qqline(resid(model), col = "red") #Adds a reference line 
}


## Residual plot ##

residualPlot <- function(model) {
  plot(fitted(model), #Plots the variance of the residuals 
       resid(model),
       xlab = "Predicted Values", #labels the x axis
       ylab = "Residuals") #labels the y axis
  abline(0,0) #Adds a reference line at y=0
}



## Printing nicer tables ##

table <- function(dataSet){
  dataSet %>% 
    kbl(align = "c") %>% #content centered within cells
    kable_styling(position = "center") #adds bootstrap theme, aligns table to the centre
}



## Saving figures ##

save_plot_png <- function(plot, filename, size, res, scaling){
  agg_png(filename, width   =  size, #opens the graphics device that saves the png output
          height  =  size, 
          units   =  "cm", 
          res     =  res, 
          scaling =  scaling)
  print(plot) #renders the plot to the device 
  dev.off() #finalises file so it saves correctly
}
