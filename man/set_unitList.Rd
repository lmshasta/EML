% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/set_unitList.R
\name{set_unitList}
\alias{set_unitList}
\title{set_unitList}
\usage{
set_unitList(units, unitTypes = NULL, as_metadata = FALSE)
}
\arguments{
\item{units}{a data.frame describing the custom units, see details.}

\item{unitTypes}{optional, a data.frame defining any additional unitTypes not already defined}

\item{as_metadata}{logical, default FALSE. If true, returns an `additionalMetadata` element, see below.}
}
\value{
unitList list object
}
\description{
Define custom units, including new unitTypes.  Note that it is not necessary to define
most common units.
}
\details{
The units data.frame must have the following columns:
 - id: the referenced name of unit (singular). e.g. 'meter', 'second'
 - unitType: the base type of unit, e.g. 'length'.  If not from a standard type, a new unitType must be provided
 - multiplierToSI: the multiplicative constant to convert to the SI unit.
 - parentSI: the name of the parent SI unit, e.g. second.
 - description: a text string describing the unit of measure.
 The following columns are optional:
 - name: usually the same as the id of the unit, e.g. second
 - abbreviation: common abbreviation, e.g. s
 - constantToSI: an additive constant to convert to the equivalent SI unit. If not given, default is "0"

In practice, researchers may save these tables of custom units they frequently use in an external .csv
or other format and read them in to R for ready re-use.

The unitType table must have the following columns:
 - id: the name by which the unitType is referred to.
 - name: optional, default is same as the id
 - dimension: name of a base dimension of the unit
 - power: the power to which the dimension is raised (NA implies power of 1)
}
\examples{
## create the "unitType" table for custom unit
id <- c("speed", "speed", "acceleration", "acceleration", "frequency")
dimension <- c("length", "time", "length", "time", "time")
power <- c(NA, "-1", NA, "-2", "-1")
unitTypes <- data.frame(
  id = id, dimension = dimension,
  power = power, stringsAsFactors = FALSE
)

## Create the units table
id <- c("minute", "centimeter")
unitType <- c("time", "length")
parentSI <- c("second", "meter")
multiplierToSI <- c("0.0166", "1")
description <- c("one minute is 60 seconds", "centimeter is a 100th of a meter")
units <- data.frame(
  id = id, unitType = unitType, parentSI = parentSI,
  multiplierToSI = multiplierToSI, description = description,
  stringsAsFactors = FALSE
)

unitList <- set_unitList(units, unitTypes)
}
