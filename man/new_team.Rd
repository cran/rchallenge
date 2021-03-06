% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/new.r
\name{new_team}
\alias{new_team}
\title{Create new teams submission folders in your challenge.}
\usage{
new_team(
  ...,
  path = ".",
  submissions_dir = "submissions",
  quiet = FALSE,
  showWarnings = FALSE
)
}
\arguments{
\item{...}{strings. names of the team subdirectories.}

\item{path}{string. root path of the challenge. see \code{\link{new_challenge}}.}

\item{submissions_dir}{string. subdirectory of the submissions. see \code{\link{new_challenge}}.}

\item{quiet}{logical. deactivate text output.}

\item{showWarnings}{logical. should the warnings on failure be shown? see \code{\link{dir.create}}.}
}
\value{
The paths of the created teams are returned.
}
\description{
Create new teams submission folders in your challenge.
}
\examples{
path <- tempdir()
wd <- setwd(path)
new_challenge()
new_team("team_foo", "team_bar")
setwd(wd)
unlink(path)
}
