# Aggregation script for FreeBSD Phabricator contributor data
# Source: https://reviews.freebsd.org (exported active users CSV)
# This script produces anonymous monthly signup counts only.

df <- read.csv("active.csv")
df$Created <- as.POSIXct(df$Created, format = "%Y-%m-%dT%H:%M:%S", tz = "UTC")
df$month <- format(df$Created, "%Y-%m-01")

monthly <- aggregate(list(signups = df$ID), by = list(month = df$month), FUN = length)
monthly <- monthly[order(monthly$month), ]
monthly$cumulative <- cumsum(monthly$signups)
monthly$month <- as.Date(monthly$month)
monthly$project <- "freebsd"
rownames(monthly) <- NULL

freebsd <- monthly[, c("project", "month", "signups", "cumulative")]
write.csv(freebsd, "freebsd.csv", row.names = FALSE)
