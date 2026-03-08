\name{oss_contributors}
\alias{oss_contributors}
\docType{data}
\title{Open Source Project Contributor Growth Statistics}
\description{
  Monthly new contributor counts for major open source projects.
  Data is aggregated by month with no personal information included.

  FreeBSD data comes from the Phabricator code review platform
  (reviews.freebsd.org) and includes all registered users.
  Other projects use GitHub commit author data (top 100 contributors
  by commit count).
}
\usage{data(oss_contributors)}
\format{
  A data frame with 447 rows and 5 variables:
  \describe{
    \item{project}{character, project name (freebsd, openbsd, netbsd, postgresql)}
    \item{source}{character, data source (phabricator or github)}
    \item{month}{Date, first day of each month}
    \item{new_contributors}{integer, number of new contributors that month}
    \item{cumulative}{integer, running total of contributors for that project}
  }
}
\source{
  FreeBSD: \url{https://reviews.freebsd.org}

  GitHub mirrors: \url{https://github.com/freebsd/freebsd-src},
  \url{https://github.com/openbsd/src},
  \url{https://github.com/NetBSD/src},
  \url{https://github.com/postgres/postgres}
}
\examples{
data(oss_contributors)

# Plot cumulative contributor growth per project
projects <- split(oss_contributors, oss_contributors$project)
plot(NULL, xlim = range(oss_contributors$month),
     ylim = c(0, max(oss_contributors$cumulative)),
     xlab = "Date", ylab = "Total Contributors",
     main = "Open Source Contributor Growth")
cols <- c(freebsd = "red", openbsd = "orange", netbsd = "blue", postgresql = "purple")
for (p in names(projects)) {
  d <- projects[[p]]
  lines(d$month, d$cumulative, col = cols[p], lwd = 2)
}
legend("topleft", names(cols), col = cols, lwd = 2, cex = 0.8)
}
\keyword{datasets}
