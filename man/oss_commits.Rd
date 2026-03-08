\name{oss_commits}
\alias{oss_commits}
\docType{data}
\title{Individual Commit Timestamps (from git repositories)}
\description{
  Every commit from FreeBSD, OpenBSD, NetBSD, and PostgreSQL with
  full timestamps and anonymized author IDs. Extracted from cloned
  git repositories.
}
\usage{data(oss_commits)}
\format{
  A data frame with 2068717 rows and 3 variables:
  \describe{
    \item{project}{character, project name}
    \item{timestamp}{POSIXct, commit timestamp in UTC}
    \item{author_id}{character, anonymized 12-character author hash}
  }
}
\source{
  Cloned from \url{https://github.com/freebsd/freebsd-src},
  \url{https://github.com/openbsd/src},
  \url{https://github.com/NetBSD/src},
  \url{https://github.com/postgres/postgres}
}
\examples{
data(oss_commits)
fb <- oss_commits[oss_commits$project == "freebsd", ]
hours <- as.integer(format(fb$timestamp, "\%H"))
hist(hours, breaks = 0:24, main = "FreeBSD Commits by Hour of Day",
     xlab = "Hour (UTC)", col = "steelblue")
}
\keyword{datasets}
