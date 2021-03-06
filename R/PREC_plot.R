PREC_plot <- function(region_data, abpar){

a <- abpar[1]
b <- abpar[2]
a_b <- abpar[3]

area <- region_data[,1]
qmean_area <- region_data[,4]
qmax_area <- region_data[,5]
area_log <- region_data[,6]
qmax_area_log <- region_data[,8]

area_log_max <- max(area_log)
area_log_min <- min(area_log)
qmax_area_log_max <- max(qmax_area_log)

# calculation of global Xlim, ylim
xlim_area_log <- ceiling(area_log_max)
xlim_area <- 10^(xlim_area_log)
xlim_area_log1 <- floor(area_log_min)
xlim_area1 <- 10^(xlim_area_log1)
ylim_qmax_log <- ceiling(qmax_area_log_max)
ylim_qmax <- 10^(ylim_qmax_log)

min_area <- min(area_log)
max_area <- max(area_log)

min_Q_R <- min(a_b+b*min_area)
max_Q_R <- max(a_b+b*max_area)

pA <-c(10^min_area, 10^max_area)
pR <-c(10^min_Q_R, 10^max_Q_R)

min_Q_I <- min(a+b*min_area)
max_Q_I <- max(a+b*max_area)

pI <-c(10^min_Q_I, 10^max_Q_I)

# cubic meters per second per square km are used only for the plots 
# L per s per square km are used every where else
plot(area, qmean_area/1000,
     log="xy",
     #xlim=c(xlim_area1, xlim_area),
     ylim=c(1, max(qmax_area)+100)/1000,
     lty=2,
     main="Regional Envelope Curve (REC)",
     xlab=expression("Drainage Area"~~bgroup("(",km^2,")")),
     ylab=expression("Unit Discharge"~~bgroup("(",m^3/s/km^{2},")")),
     cex=1,
     col="blue",
     pch=21)
#     par(new=T)
points(area, qmax_area/1000,
     #xlim=c(xlim_area1, xlim_area),
     #ylim=c(1, ylim_qmax),
     #main="",xlab="", ylab="",
     cex=1,
     col="red",
     pch=21,
     lwd=2)

lines(pA,pR/1000, col='blue', lty=2, lwd=1)
lines(pA,pI/1000, col='red', lty=1, lwd=2)

leg.col = c("red","blue")
leg.text = c("REC (Record flood)","Regression (Index-flood)")
legend.pos="bottomleft"

legend(legend.pos, lty=c(1,2), lwd=c(2,1),col=leg.col, legend=leg.text)
par(new=F)
}
