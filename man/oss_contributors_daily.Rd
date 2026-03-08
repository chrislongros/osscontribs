\name{oss_contributors_daily}
\alias{oss_contributors_daily}
\docType{data}
\title{Open Source Project Contributor Signups (Daily, FreeBSD only)}
\description{
  Daily signup counts for the FreeBSD Phabricator code review platform.
  Represents account registrations, not commit activity.
  Suitable for time series analysis. No personal information included.
}
\usage{data(oss_contributors_daily)}
\format{
  A data frame with 2531 rows and 5 variables:
  \describe{
    \item{project}{character, always "freebsd"}
    \item{source}{character, always "phabricator"}
    \item{date}{Date, the signup date}
    \item{new_contributors}{integer, new signups that day}
    \item{cumulative}{integer, running total}
  }
}
\source{
  Aggregated from public Phabricator user data at
  \url{https://reviews.freebsd.org}
}
\examples{
data(oss_contributors_daily)
plot(oss_contributors_daily$date,
     oss_contributors_daily$new_contributors,
     type = "h", xlab = "Date", ylab = "New Signups",
     main = "FreeBSD Daily Phabricator Signups")
}
\keyword{datasets}
