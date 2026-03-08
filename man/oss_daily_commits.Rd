\name{oss_daily_commits}
\alias{oss_daily_commits}
\docType{data}
\title{Daily Commit Activity (from git repositories)}
\description{
  Daily commit counts for FreeBSD, OpenBSD, NetBSD, and PostgreSQL,
  extracted directly from cloned git repositories. Includes all
  commits from all authors.
}
\usage{data(oss_daily_commits)}
\format{
  A data frame with 44939 rows and 4 variables:
  \describe{
    \item{project}{character, project name}
    \item{date}{Date, commit date}
    \item{commits}{integer, commits that day}
    \item{cumulative_commits}{integer, running total}
  }
}
\source{
  Cloned from \url{https://github.com/freebsd/freebsd-src},
  \url{https://github.com/openbsd/src},
  \url{https://github.com/NetBSD/src},
  \url{https://github.com/postgres/postgres}
}
\examples{
data(oss_daily_commits)
fb <- oss_daily_commits[oss_daily_commits$project == "freebsd", ]
plot(fb$date, fb$cumulative_commits, type = "l",
     xlab = "Date", ylab = "Total Commits",
     main = "FreeBSD Cumulative Commits")
}
\keyword{datasets}
