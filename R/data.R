#' Phabricator Contributor Signups (Monthly)
#'
#' Monthly new contributor signup counts. FreeBSD data from Phabricator,
#' other projects from GitHub (top 100 by commit count).
#'
#' @format A data frame with 447 rows and 5 variables:
#' \describe{
#'   \item{project}{character, project name}
#'   \item{source}{character, data source (phabricator or github)}
#'   \item{month}{Date, first day of each month}
#'   \item{new_contributors}{integer, new contributors that month}
#'   \item{cumulative}{integer, running total}
#' }
#' @source FreeBSD: \url{https://reviews.freebsd.org}
"oss_contributors"

#' Phabricator Contributor Signups (Daily, FreeBSD only)
#'
#' Daily signup counts for FreeBSD Phabricator. Represents account
#' registrations, not commit activity.
#'
#' @format A data frame with 2531 rows and 5 variables:
#' \describe{
#'   \item{project}{character, always "freebsd"}
#'   \item{source}{character, always "phabricator"}
#'   \item{date}{Date, signup date}
#'   \item{new_contributors}{integer, new signups}
#'   \item{cumulative}{integer, running total}
#' }
#' @source \url{https://reviews.freebsd.org}
"oss_contributors_daily"

#' Daily Commit Activity (from git repositories)
#'
#' Daily commit counts for FreeBSD, OpenBSD, NetBSD, and PostgreSQL,
#' extracted directly from cloned git repositories. Includes all
#' commits, not limited to top 100 authors.
#'
#' @format A data frame with 44,939 rows and 4 variables:
#' \describe{
#'   \item{project}{character, project name}
#'   \item{date}{Date, commit date}
#'   \item{commits}{integer, commits that day}
#'   \item{cumulative_commits}{integer, running total}
#' }
#' @source Cloned from
#'   \url{https://github.com/freebsd/freebsd-src},
#'   \url{https://github.com/openbsd/src},
#'   \url{https://github.com/NetBSD/src},
#'   \url{https://github.com/postgres/postgres}
"oss_daily_commits"

#' Daily New Committers (from git repositories)
#'
#' Daily counts of authors making their first commit to each project.
#' Extracted directly from cloned git repositories using anonymized
#' author IDs. Includes all authors, not limited to top 100.
#'
#' @format A data frame with 2,932 rows and 4 variables:
#' \describe{
#'   \item{project}{character, project name}
#'   \item{date}{Date, date of first commit}
#'   \item{new_authors}{integer, new committers that day}
#'   \item{cumulative_authors}{integer, running total of unique committers}
#' }
#' @source Cloned from
#'   \url{https://github.com/freebsd/freebsd-src},
#'   \url{https://github.com/openbsd/src},
#'   \url{https://github.com/NetBSD/src},
#'   \url{https://github.com/postgres/postgres}
"oss_daily_authors"

#' Weekly Commit Activity (from GitHub API)
#'
#' Weekly commit counts from GitHub stats API. Limited to top 100
#' contributors per project. Superseded by \code{oss_daily_commits}
#' which has complete data from cloned repositories.
#'
#' @format A data frame with 6,307 rows and 5 variables:
#' \describe{
#'   \item{project}{character, project name}
#'   \item{source}{character, always "github"}
#'   \item{date}{Date, start of week}
#'   \item{commits}{integer, commits that week}
#'   \item{cumulative_commits}{integer, running total}
#' }
#' @source GitHub stats API
"oss_weekly_commits"
