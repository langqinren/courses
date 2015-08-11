rm(list=ls())
options(na.action=na.exclude)

thisFile <- function() {
  cmdArgs <- commandArgs(trailingOnly = FALSE)
  needle <- "--file="
  match <- grep(needle, cmdArgs)
  if (length(match) > 0) {
    # Rscript
    return(sub(needle, "", cmdArgs[match]))
  } else {
    # 'source'd via R console
    return(normalizePath(sys.frames()[[1]]$ofile))
  }
}

gradientDescent <- function(X, Y) {
  t0 = t1 = 0
  
  alpha = 0.07
  niter = 1500
  m = length(X)
  
  for (s in 1:niter) { # number of iterations
    
    dt0 = 0
    dt1 = 0
    for (i in 1:m) {   # number of instances
       dt0 = dt0 + (t0*1 + t1*X[i] - Y[i]) * 1       
       dt1 = dt1 + (t0*1 + t1*X[i] - Y[i]) * X[i] 
    }
    
    t0 = t0 - alpha * dt0 / m
    t1 = t1 - alpha * dt1 / m
    print(t0)
    print(t1)
    
    J = 0
    for (i in 1:m) {
      J = J + (t0*1 + t1*X[i] - Y[i])^2
    }
    J = J/(2*m)
  }
  
  return(c(t0, t1))
}
  
  

curFile <- thisFile()
xFile <- paste(c("ex2Data/", "ex2x.dat"), collapse='')
yFile <- paste(c("ex2Data/", "ex2y.dat"), collapse='')

xPath <- gsub("exe2.R$", xFile, curFile)
yPath <- gsub("exe2.R$", yFile, curFile)

X  = read.csv(xPath, header = FALSE);
Y  = read.csv(yPath, header = FALSE);
T  = gradientDescent(X$V1, Y$V1)
t0 = T[1]
t1 = T[2]

#plot(X$V1, Y$V1, xlab="Age in years", ylab="Height in meters");
#x = 2:8
#y = x * t1 + 1 * t0
#lines(x, y)

