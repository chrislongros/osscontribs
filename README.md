# osscontribs

Aggregated monthly contributor growth statistics for major open source projects.
No personal data is included — only monthly counts and cumulative totals.

## Installation

```r
# Install from GitHub
devtools::install_github("chrislongros/osscontribs")
```

## Usage

```r
library(osscontribs)
data(oss_contributors)

head(oss_contributors)
#>   project      source      month new_contributors cumulative
#> 1 freebsd phabricator 2013-11-01                2          2
#> 2 freebsd phabricator 2014-01-01                1          3
#> 3 freebsd phabricator 2014-03-01                4          7
#> 4 freebsd phabricator 2014-04-01                1          8
#> 5 freebsd phabricator 2014-05-01               97        105
#> 6 freebsd phabricator 2014-06-01               31        136

# Plot contributor growth across projects
projects <- split(oss_contributors, oss_contributors$project)
plot(NULL, xlim = range(oss_contributors$month),
     ylim = c(0, max(oss_contributors$cumulative)),
     xlab = "Date", ylab = "Total Contributors",
     main = "Open Source Contributor Growth")
cols <- c(freebsd = "red", openbsd = "orange",
          netbsd = "blue", postgresql = "purple")
for (p in names(projects)) {
  d <- projects[[p]]
  lines(d$month, d$cumulative, col = cols[p], lwd = 2)
}
legend("topleft", names(cols), col = cols, lwd = 2)
```

## Dataset

| Column | Type | Description |
|--------|------|-------------|
| `project` | character | Project name |
| `source` | character | Data source (phabricator or github) |
| `month` | Date | First day of each month |
| `new_contributors` | integer | New contributors that month |
| `cumulative` | integer | Running total for that project |

**447 rows** across 4 projects:

| Project | Source | Months | Total Contributors |
|---------|--------|--------|--------------------|
| FreeBSD | Phabricator | 147 | 7,602 |
| FreeBSD | GitHub | 89 | 100 |
| OpenBSD | GitHub | 85 | 99 |
| NetBSD | GitHub | 68 | 84 |
| PostgreSQL | GitHub | 58 | 100 |

Note: GitHub data is limited to the top 100 contributors by commit count.
FreeBSD Phabricator data includes all registered users.

## Sources

- FreeBSD: [reviews.freebsd.org](https://reviews.freebsd.org)
- OpenBSD: [github.com/openbsd/src](https://github.com/openbsd/src)
- NetBSD: [github.com/NetBSD/src](https://github.com/NetBSD/src)
- PostgreSQL: [github.com/postgres/postgres](https://github.com/postgres/postgres)

## License

CC0
