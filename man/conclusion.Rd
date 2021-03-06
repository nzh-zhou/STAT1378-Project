% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/conclusion.R
\name{conclusion}
\alias{conclusion}
\title{Report test conclusion}
\usage{
conclusion(data, question, output = "LaTeX")
}
\arguments{
\item{data}{the data input; must be of class "data.frame"}

\item{question}{the question number; must be an integer between 1 and 3 inclusive}

\item{output}{unnecessary argument used for consistency; must be either "LaTeX" or "R"}
}
\value{
the conclusion of the statistical test
}
\description{
Report test conclusion
}
\examples{
conclusion(pro, 1, output = "R")
}
