library(datasets)
pdf(file = "myplot.pdf")
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")
dev.off()

#dev.copy
#dev.copy2pdf

library(datasets)
with(faithful, plot(eruptions, waiting))
dev.copy(png, file = "geyserplot.png")
dev.off()
dev.cur()
#See that the screen is still open
dev.off()
