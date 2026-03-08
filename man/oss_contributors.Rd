\name{oss_contributors}
\alias{oss_contributors}
\docType{data}
\title{Open Source Project Contributor Signups (Monthly)}
\description{
  Monthly new contributor signup counts for open source projects.
  No personal information included.

  FreeBSD data represents Phabricator account registrations.
  Other projects approximate signup date as the date of each
  author's first commit on GitHub (top 100 contributors).

  Note: signups and commit activity are different metrics.
}
\usage{data(oss_contributors)}
\format{
  A data frame with 447 rows and 5 variables:
  \describe{
    \item{project}{character, project name}
    \item{source}{character, data source (phabricator or github)}
    \item{month}{Date, first day of each month}
    \item{new_contributors}{integer, new contributors that month}
    \item{cumulative}{integer, running total for that project}
  }
}
\source{
  FreeBSD: \url{https://reviews.freebsd.org}

  GitHub: \url{https://github.com/freebsd/freebsd-src},
  \url{https://github.com/openbsd/src},
  \url{https://github.com/NetBSD/src},
  \url{https://github.com/postgres/postgres}
}
\examples{
data(oss_contributors)
projects <- split(oss_contributors, oss_contributors$project)
plot(NULL, xlim = range(oss_contributors$month),
     ylim = c(0, max(oss_contributors$cumulative)),
     xlab = "Date", ylab = "Total Contributors",
     main = "Open Source Contributor Signups")
cols <- c(freebsd = "red", openbsd = "orange",
          netbsd = "blue", postgresql = "purple")
for (p in names(projects)) {
  d <- projects[[p]]
  lines(d$month, d$cumulative, col = cols[p], lwd = 2)
}
legend("topleft", names(cols), col = cols, lwd = 2)
}
\keyword{datasets}
