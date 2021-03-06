% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/e4S2.R
\name{e4S2}
\alias{e4S2}
\title{Statistical errors for the estimation of a single variance}
\usage{
e4S2(N, n, K = 0, DEFF = 1, conf = 0.95, plot = FALSE)
}
\arguments{
\item{N}{The population size.}

\item{n}{The sample size.}

\item{K}{The excess kurtosis of the variable in the population.}

\item{DEFF}{The design effect of the sample design. By default \code{DEFF = 1}, which corresponds to a simple random sampling design.}

\item{conf}{The statistical confidence. By default \code{conf = 0.95}.}

\item{plot}{Optionally plot the errors (cve and margin of error) against the sample size.}
}
\value{
The coefficient of variation and the margin of error for a predefined sample size.
}
\description{
This function computes the cofficient of variation and the margin of error when estimating a single variance under a sample design.
}
\details{
We note that the coefficient of variation is defined as: \deqn{cve = \frac{\sqrt{Var(\hat{S^2})}}{\hat{S^2}}} 
Also, note that the magin of error is defined as: \deqn{\varepsilon = z_{1-\frac{\alpha}{2}}\sqrt{Var(\hat{S^2})}}
}
\examples{
e4S2(N=10000, n=400, K = 0)
e4S2(N=10000, n=400, K = 1, DEFF = 2, conf = 0.99)
e4S2(N=10000, n=400, K = 2, DEFF = 2, conf = 0.99, plot=TRUE)
}
\references{
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}. Editorial Universidad Santo Tomas
}
\seealso{
\code{\link{ss4p}}
}
\author{
Hugo Andres Gutierrez Rojas <hagutierrezro at gmail.com>
}
