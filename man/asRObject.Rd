% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Interface.R
\docType{methods}
\name{asRObject}
\alias{asRObject}
\alias{asRObject,ProxyObject-method}
\alias{asRObject,vector_R-method}
\alias{asRObject,list-method}
\alias{asRObject,data.frame-method}
\title{Specialize the R Object Returned from an Interface Evaluator}
\usage{
asRObject(object, evaluator)

\S4method{asRObject}{ProxyObject}(object, evaluator)

\S4method{asRObject}{vector_R}(object, evaluator)

\S4method{asRObject}{list}(object, evaluator)

\S4method{asRObject}{data.frame}(object, evaluator)
}
\arguments{
\item{object}{An object constructed from the explicit representation as a dictionary.
The elements of the dictionary will be converted into objects for the slots of the same
name.  Application-written methods will re-interpret the object into the intended \R form,
not necessarily from the same class.}

\item{evaluator}{This argument will be supplied as the evaluator object doing the conversion.
Therefore, methods may have one of the specific evaluator classes (e.g., \code{"PythonInterface"},
in their signature.}
}
\description{
The result of a server language expression is returned as a string, using the JSON
standard notation to represent a scalar, list or dictionary.  Methods for this function
get the simple R object obtained from deparsing and interpret it generally.
}
\details{
The methods supplied with the `XR` pacakage handle the standard mechanisms for interpretation.
Additional methods are likely to interpret proxy class objects for which the standard
XR representation in terms of class and slots is not what's actually wanted.
}
\section{Methods (by class)}{
\itemize{
\item \code{ProxyObject}: When a proxy object appears, usually as an element of a list, it
is expanded, by using the `Get()` method of the evaluator and calling `asRObject()` on the
result.

\item \code{vector_R}: To distinguish typed R vectors from a general JSON list, encode the
desired data as an object from the "vector_R" class.
Vector types whose elements cannot be represented in JSON (e..g, "complex") should
be returned as a list of character strings in a format that R will parse as
elements of the suitable vector object. (e.g, ".5+3i")

\item \code{list}: Both lists and dictionaries will come here from the basic conversion.
`names(object)` will either be NULL or all non-empty, from a dictionary.

\item \code{data.frame}: Assume this has been done via .RClass; avoid inheriting the list method
}}

\section{Writing Application Methods}{

Application packages will typically write methods for special classes, and often for classes
themselves defined in the package.  One good reason is that the server language does not
naturally return the eventually intended object in a convenient form; for example, because
it does not have typed arrays.  Then a special class will be defined in \R.  The server code
will generate a dictionary with the \code{".RClass"} element having the class name, plus
whatever slots make sense.  The application method for \code{asRObject()} will take these
slots and construct whatever object is really intended.  For an example, see the method
for class \code{vector_R}.
}

\references{
Chambers, John M. (2016)
\emph{Extending R},
Chapman & Hall/CRC.
( Chapter 13, discussing this package, is included in the package: \url{../doc/Chapter_XR.pdf}.)
}
