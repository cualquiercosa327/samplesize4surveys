#' @import TeachingSampling
#' @export
#' 
#' @title
#' Statistical errors for the estimation of a difference of means 
#' @description 
#' This function computes the cofficient of variation and the standard error when estimating a difference of means under a complex sample design.
#' @return 
#' The coefficient of variation and the margin of error for a predefined sample size.
#' @details
#' We note that the coefficent of variation is defined as: \deqn{cve = \frac{\sqrt{Var(\bar{y}_1 - \bar{y}_2)}}{\bar{y}_1 - \bar{y}_2}} 
#' Also, note that the magin of error is defined as: \deqn{\varepsilon = z_{1-\frac{\alpha}{2}}\sqrt{Var(\bar{y}_1 - \bar{y}_2)}}
#'  
#' @author Hugo Andres Gutierrez Rojas <hagutierrezro at gmail.com>
#' @param N The population size.
#' @param n The sample size.
#' @param mu1 The value of the estimated mean of the variable of interes for the first population.
#' @param mu2 The value of the estimated mean of the variable of interes for the second population.
#' @param sigma1 The value of the estimated variance of the variable of interes for the first population.
#' @param sigma2 The value of the estimated mean of a variable of interes for the second population.
#' @param DEFF The design effect of the sample design. By default \code{DEFF = 1}, which corresponds to a simple random sampling design.
#' @param conf The statistical confidence. By default \code{conf = 0.95}.
#' @param plot Optionally plot the errors (cve and margin of error) against the sample size.
#' 
#' @references 
#' Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}. Editorial Universidad Santo Tomas
#' @seealso \code{\link{ss4p}}
#' @examples 
#' e4dm(N=10000, n=400, mu1 = 100, mu2 = 12, sigma1 = 10, sigma2=8)
#' e4dm(N=10000, n=400, mu1 = 100, mu2 = 12, sigma1 = 10, sigma2=8, plot=TRUE)
#' e4dm(N=10000, n=400, mu1 = 100, mu2 = 12, sigma1 = 10, sigma2=8, DEFF=3.45, conf=0.99, plot=TRUE)


e4dm <- function(N, n, mu1, mu2, sigma1, sigma2, DEFF = 1, conf = 0.95, plot = FALSE) {
  
  S2 <- DEFF * (sigma1^2 + sigma2^2)
  Z <- 1 - ((1 - conf)/2)
  f <- n/N
  VAR <- (1/n) * (1 - f) * S2
  CVE <- 100 * sqrt(VAR)/abs(mu1 - mu2)
  ME <- qnorm(Z) * sqrt(VAR)
  
  if (plot == TRUE) {
    
    nseq <- seq(1, N, 10)
    cveseq <- rep(NA, length(nseq))
    meseq <- rep(NA, length(nseq))
    
    for (k in 1:length(nseq)) {
      fseq <- nseq[k]/N
      varseq <- (1/nseq[k]) * (1 - fseq) * S2
      cveseq[k] <- 100 * sqrt(varseq)/abs(mu1 - mu2)
      meseq[k] <- qnorm(Z) * sqrt(varseq)
    }
    
    par(mfrow = c(1, 2))
    plot(nseq, cveseq, type = "l", lty = 1, pch = 1, col = 3, ylab = "Coefficient of variation (%)", xlab = "Sample Size")
    points(n, CVE, pch = 8, bg = "blue")
    abline(h = CVE, lty = 3)
    abline(v = n, lty = 3)
    
    plot(nseq, meseq, type = "l", lty = 1, pch = 1, col = 3, ylab = "Margin of error", xlab = "Sample Size")
    points(n, ME, pch = 8, bg = "blue")
    abline(h = ME, lty = 3)
    abline(v = n, lty = 3)
  }
  
  msg <- cat("With the parameters of this function: N =", N, "n = ", n, "mu1 =", mu1, "mu2 =", mu2,
             "sigma1 =", sigma1, "sigma2 =", sigma2, "DEFF = ", DEFF, "conf =", conf, ". 
             \nThe estimated coefficient of variation is ", CVE, ". 
             \nThe margin of error is", ME, ". \n \n")
  
  result <- list(cve = CVE, Margin_of_error = ME)
  result
} 