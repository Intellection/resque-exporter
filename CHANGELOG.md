# Changelog

## 0.4.0

* Migrate from Dep to Go modules.
* Remove vendored packages.
* Upgrade `github.com/prometheus/client_golang` to `v1.20.4`.
* Upgrade `github.com/prometheus/common` to `v0.60.1`.
* Switch from `github.com/prometheus/common/log` to `github.com/sirupsen/logrus`.
* Improve setting and fetching of version information.
* Minor updates to account for package upgrades.

## 0.3.0

#### Changed

* Run as user `nobody` and group `nogroup` instead of `root`.

## 0.2.2

#### Fixed

* Stop missing `stat` keys from preventing other metrics from being scraped.

## 0.2.1

#### Changed

* Support scaling to zero workers when using `resque_processing_ratio`.

## 0.2.0

#### Added

* Add `resque_processing_ratio` metric.
* Add `resque_workers_per_queue` metric.

#### Changed

* Rename the repository to `resque-exporter`.

## 0.1.0

* Initial release.
