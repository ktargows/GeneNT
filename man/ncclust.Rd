\name{ncclust}
\alias{ncclust}
\title{Network constrained clustering}
\description{
This function does network constrained clustering based on Floyd-Warshall algorithm, R function allshortestpaths()in R packpage e1071. 
}
\usage{
ncclust(p, pG2, kG2)
}
\arguments{
  \item{p}{p is the exponential tuning factor with default value 1. it can also be set to other intergers whenever necessary.}
  \item{pG2}{pG2 is the gene pairs that are screened using the two-stage algorithm based on Pearson correlation statistic.}
  \item{kG2}{kG2 is the gene pairs that are screened using the two-stage algorithm based on Kendall correlation statistic.}
}
\details{
This function is written in comparison to the traditional clustering implemented as tdclust(). 
}
\value{
This function returns a network constrained distance matrix that can be used by any distance based clustering software. 
}
\references{
Zhu, D., Hero, A.O., Qin, Z.S. and Swaroop, A. High throughput screening of co-expressed gene pairs with controlled False Discovery Rate (FDR) and Minimum Acceptable Strength (MAS). \emph{J Comput Biol, in press}.
Zhu, D., Hero, A.O., Hong, C., Khanna, R., and Swaroop A. Network constrained clustering for gene microarray data. {\it Submitted}
}
\author{Dongxiao Zhu (http://dongxiaozhu.googlepages.com/home)}

\seealso{\code{\link{tdclust}}}
\examples{
## load GeneNT library
library(RBGL)
library(e1071)
library(GeneNT)

## load example dataset
data(dat) 
## Note, data matrix name has to be "dat"

## use (FDR, MAS) criteria (0.2, 0.5) as example to screen gene pairs 
## use "BY" procedure to do multiple comparison adjustment
g1 <- corfdrci(0.2, 0.5, "BY") 
pG1 <- g1$pG1
## pG2 contains gene pairs that passed two-stage screening
pG2 <- g1$pG2  
## use (FDR, MAS) criteria (0.2, 0.5) as example to screen gene pairs
## use "BY" procedure to do multiple comparison adjustment 
g2 <- kendallfdrci(0.2, 0.5, "BY") 
kG1 <- g2$kG1
## kG2 contains gene pairs that passed two-stage screening
kG2 <- g2$kG2  
## generate Pajek compatible matrix to visualize network
getBM(pG2, kG2) 
## clustering from network using network constraint clustering, for example, p = 6.
ncclust(6, pG2, kG2) 
}
\keyword{cluster}
\keyword{htest}
