\name{oss_daily_authors}
\alias{oss_daily_authors}
\docType{data}
\title{Daily New Committers (from git repositories)}
\description{
  Daily counts of authors making their first commit to each project.
  Extracted from cloned git repositories. Includes all authors.
}
\usage{data(oss_daily_authors)}
\format{
  A data frame with 2932 rows and 4 variables:
  \describe{
    \item{project}{character, project name}
    \item{date}{Date, date of first commit}
    \item{new_authors}{integer, new committers that day}
    \item{cumulative_authors}{integer, running total of unique committers}
  }
}
\source{
  Cloned from \url{https://github.com/freebsd/freebsd-src},
  \url{https://github.com/openbsd/src},
  \url{https://github.com/NetBSD/src},
  \url{https://github.com/postgres/postgres}
}
\examples{
data(oss_daily_authors)
projects <- split(oss_daily_authors, oss_daily_authors$project)
plot(NULL, xlim = range(oss_daily_authors$date),
     ylim = c(0, max(oss_daily_authors$cumulative_authors)),
     xlab = "Date", ylab = "Total Unique Committers",
     main = "Cumulative Committers Over Time")
cols <- c(freebsd = "red", openbsd = "orange",
          netbsd = "blue", postgresql = "purple")
for (p in names(projects)) {
  lines(projects[[p]]$date, projects[[p]]$cumulative_authors,
        col = cols[p], lwd = 2)
}
legend("topleft", names(cols), col = cols, lwd = 2)
}
\keyword{datasets}
