% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Interface.R
\name{objectDictionary}
\alias{objectDictionary}
\title{Generate the Explicit Dictionary form for an R Object}
\usage{
objectDictionary(object, exclude = character())
}
\arguments{
\item{object}{the object to use to infer the representation}

\item{exclude}{slots or the like that should \emph{not} be in the dictionary form.}
}
\value{
a named list with the required entries, e.g., \code{".RClass"}.
}
\description{
The XR interface strategy uses an explicit named list (i.e., dictionary) to describe an R object
from a particular class.  This function creates the suitable form for such a dictionary, based on
the formal class or the contents of an object.  Used by some interface packages (e.g., XRJulia) but
likely only of information value otherwise, to tell you how to code an object in the server language.
}
\references{
Chambers, John M. (2016)
\emph{Extending R},
Chapman & Hall/CRC.
( Chapter 13, discussing this package, is included in the package: \url{../doc/Chapter_XR.pdf}.)
}
