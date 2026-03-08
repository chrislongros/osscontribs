\name{oss_weekly_commits}
\alias{oss_weekly_commits}
\docType{data}
\title{Open Source Project Commit Activity (Weekly)}
\description{
  Weekly commit counts for major open source projects from GitHub.
  Measures actual code activity (not signups). Counts are aggregated
  across the top 100 contributors per project (GitHub API limitation).
  No personal information included.
}
\usage{data(oss_weekly_commits)}
\format{
  A data frame with 6307 rows and 5 variables:
  \describe{
    \item{project}{character, project name}
    \item{source}{character, always "github"}
    \item{date}{Date, start of the week (Sunday)}
    \item{commits}{integer, commits that week}
    \item{cumulative_commits}{integer, running total of commits}
  }
}
\source{
  GitHub: \url{https://github.com/freebsd/freebsd-src},
  \url{https://github.com/openbsd/src},
  \url{https://github.com/NetBSD/src},
  \url{https://github.com/postgres/postgres}
}
\examples{
data(oss_weekly_commits)
fb <- oss_weekly_commits[oss_weekly_commits$project == "freebsd", ]
plot(fb$date, fb$commits, type = "l",
     xlab = "Date", ylab = "Commits per Week",
     main = "FreeBSD Weekly Commit Activity (top 100 authors)")
}
\keyword{datasets}
