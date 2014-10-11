library(datasets)
data(cars)
with(cars, plot(speed, dist))

#The Lattice System
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))

#The ggplot2 System
library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)

#------------------------

#Base Plotting
library(datasets)
hist(airquality$Ozone)

with(airquality, plot(Wind, Ozone))

airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")

# pch: the plotting symbol
# lty: the line type (default is solid line), can be dashed, dotted
# lwd: the line width, specified as an integer multiple
# col: the plotting color - colors() gives you a vector of colors by name
# xlab: character string for x-axis label
# ylab: character string for the y-axis label

#par() used to specify the global graphics paramteres

# las: orientation of the axis labels on the plot
# bg: background color
# mar: margin size
# oma: outer margin size
# mfrow: # of plots per row, column (plots filled row-wise)
# mfcol: # of plots per row, column (plots filled column-wise)

# You can see the default params by calling par() with a string of the param eg par('las')

with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in New York City")

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", type = "n"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

par(mfrow = c(1, 2))
with(airquality, {
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
})

par(mfrow = c(1, 3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(airquality, {
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
  plot(Temp, Ozone, main = "Ozone and Temperature")
  mtext("Ozone and Weather in New York City", outer = TRUE)
})