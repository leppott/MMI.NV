% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rarify.R
\name{rarify}
\alias{rarify}
\title{Rarify}
\usage{
rarify(inbug, sample.ID, abund, subsiz)
}
\arguments{
\item{inbug}{data frame of SampleID, Count, and TaxaCode}

\item{sample.ID}{data frame field with sample ID}

\item{abund}{data frame field with number of individuals}

\item{subsiz}{target subsample size}
}
\value{
Returns the original data frame with an additional column for count
}
\description{
This function allows you to generate a fixed subsample.
}
\details{
rarify function:
R function to rarify (subsample) a macroinvertebrate sample down to a fixed count;
by John Van Sickle, USEPA. email: VanSickle.John@epa.gov    ;
Version 1.0, 06/10/05;

See rarify.help.txt for function documentation;
See rarify.examples.r.txt for examples of usage;
Modifications to generate reproducible subsamples.  Set the seed for the random number generator to a fixed number.
Erik.Leppo@tetratech.com (2016)
}
\examples{
# Location of files.
path <- getwd()
setwd(path)

library("MMIcalcNV")

# read in test data
#bugnew.raw <- read.csv(file="bugsamples.csv")
bugnew.raw <- NV.bugs
head(bugnew.raw)
#aggregate samples by bug code and sample
bugnew.raw <- bugnew.raw[,c("Samp_Rep","Individuals","TaxaID_Stage")]
bugnew.raw.ag <- aggregate(Individuals~TaxaID_Stage+Samp_Rep,data=bugnew.raw,sum)
#resample to 300 counts
bugnew.300cnt <- rarify(inbug=bugnew.raw.ag, sample.ID="Samp_Rep", abund="Individuals", subsiz=300)
# remove taxa with a count of zero
bugnew.300cnt <- bugnew.300cnt[bugnew.300cnt$Count>0,]
}
\keyword{MMI}
\keyword{NV,}
\keyword{Nevada,}
\keyword{rarify,}
\keyword{subsample,}

