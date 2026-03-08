# osscontribs

Aggregated contributor and commit statistics for major open source projects.
No personal data is included.

## Installation

```r
devtools::install_github("chrislongros/osscontribs")
```

## Datasets

### Signups

Account registrations / first-commit dates. **Not the same as commit activity** —
many users sign up but never commit.

#### `oss_contributors` (monthly, all projects)

| Column | Type | Description |
|--------|------|-------------|
| `project` | character | Project name |
| `source` | character | phabricator or github |
| `month` | Date | First day of each month |
| `new_contributors` | integer | New contributors that month |
| `cumulative` | integer | Running total |

- **447 rows** across 4 projects

#### `oss_contributors_daily` (daily, FreeBSD only)

| Column | Type | Description |
|--------|------|-------------|
| `project` | character | Always "freebsd" |
| `source` | character | Always "phabricator" |
| `date` | Date | Signup date |
| `new_contributors` | integer | New signups that day |
| `cumulative` | integer | Running total |

- **2,531 rows** (November 2013 – March 2026)

### Commit Activity

#### `oss_weekly_commits` (weekly, all projects)

| Column | Type | Description |
|--------|------|-------------|
| `project` | character | Project name |
| `source` | character | Always "github" |
| `date` | Date | Start of week (Sunday) |
| `commits` | integer | Commits that week |
| `cumulative_commits` | integer | Running total |

- **6,307 rows** across 4 projects
- Top 100 contributors per project (GitHub API limitation)

| Project | Weeks | Total Commits |
|---------|-------|---------------|
| FreeBSD | 1,704 | 156,984 |
| NetBSD | 1,627 | 111,044 |
| OpenBSD | 1,432 | 77,472 |
| PostgreSQL | 1,544 | 45,258 |

## Usage

```r
library(osscontribs)

# Compare signup growth
data(oss_contributors)
projects <- split(oss_contributors, oss_contributors$project)
plot(NULL, xlim = range(oss_contributors$month),
     ylim = c(0, max(oss_contributors$cumulative)),
     xlab = "Date", ylab = "Total Contributors",
     main = "Contributor Signups Over Time")
cols <- c(freebsd = "red", openbsd = "orange",
          netbsd = "blue", postgresql = "purple")
for (p in names(projects)) {
  lines(projects[[p]]$month, projects[[p]]$cumulative, col = cols[p], lwd = 2)
}
legend("topleft", names(cols), col = cols, lwd = 2)

# Compare commit activity
data(oss_weekly_commits)
projects <- split(oss_weekly_commits, oss_weekly_commits$project)
plot(NULL, xlim = range(oss_weekly_commits$date),
     ylim = c(0, max(oss_weekly_commits$commits)),
     xlab = "Date", ylab = "Commits per Week",
     main = "Weekly Commit Activity")
for (p in names(projects)) {
  lines(projects[[p]]$date, projects[[p]]$commits, col = cols[p])
}
legend("topright", names(cols), col = cols, lwd = 1)
```

## Sources

- FreeBSD signups: [reviews.freebsd.org](https://reviews.freebsd.org)
- Commit data: GitHub stats API for
  [freebsd/freebsd-src](https://github.com/freebsd/freebsd-src),
  [openbsd/src](https://github.com/openbsd/src),
  [NetBSD/src](https://github.com/NetBSD/src),
  [postgres/postgres](https://github.com/postgres/postgres)

## License

CC0
