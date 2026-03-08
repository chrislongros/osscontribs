#' Open Source Project Contributor Signups (Monthly)
#'
#' Monthly new contributor signup counts for open source projects.
#' Data is aggregated by month with no personal information included.
#'
#' FreeBSD data comes from the Phabricator code review platform
#' (reviews.freebsd.org) and represents account registrations.
#' Other projects use GitHub commit author data (top 100 contributors
#' by commit count), where the signup date is approximated as the
#' date of each author's first commit.
#'
#' Note: signups and commit activity are different metrics. A signup
#' does not necessarily mean the user committed code.
#'
#' @format A data frame with 447 rows and 5 variables:
#' \describe{
#'   \item{project}{character, project name (freebsd, openbsd, netbsd, postgresql)}
#'   \item{source}{character, data source (phabricator or github)}
#'   \item{month}{Date, first day of each month}
#'   \item{new_contributors}{integer, number of new contributors that month}
#'   \item{cumulative}{integer, running total of contributors for that project}
#' }
#' @source
#' FreeBSD: \url{https://reviews.freebsd.org}
#'
#' GitHub mirrors: \url{https://github.com/freebsd/freebsd-src},
#' \url{https://github.com/openbsd/src},
#' \url{https://github.com/NetBSD/src},
#' \url{https://github.com/postgres/postgres}
"oss_contributors"

#' Open Source Project Contributor Signups (Daily, FreeBSD only)
#'
#' Daily signup counts for the FreeBSD Phabricator code review platform.
#' Represents account registrations, not commit activity.
#' Suitable for time series analysis.
#'
#' @format A data frame with 2531 rows and 5 variables:
#' \describe{
#'   \item{project}{character, always "freebsd"}
#'   \item{source}{character, always "phabricator"}
#'   \item{date}{Date, the signup date}
#'   \item{new_contributors}{integer, number of new signups that day}
#'   \item{cumulative}{integer, running total of signups}
#' }
#' @source Aggregated from public Phabricator user data at
#'   \url{https://reviews.freebsd.org}
"oss_contributors_daily"

#' Open Source Project Commit Activity (Weekly)
#'
#' Weekly commit counts for major open source projects from GitHub.
#' This measures actual code activity, not signups. Counts are
#' aggregated across the top 100 contributors per project (GitHub
#' API limitation).
#'
#' @format A data frame with 6307 rows and 5 variables:
#' \describe{
#'   \item{project}{character, project name (freebsd, openbsd, netbsd, postgresql)}
#'   \item{source}{character, always "github"}
#'   \item{date}{Date, start of the week (Sunday)}
#'   \item{commits}{integer, number of commits that week}
#'   \item{cumulative_commits}{integer, running total of commits}
#' }
#' @source
#' GitHub mirrors: \url{https://github.com/freebsd/freebsd-src},
#' \url{https://github.com/openbsd/src},
#' \url{https://github.com/NetBSD/src},
#' \url{https://github.com/postgres/postgres}
"oss_weekly_commits"
