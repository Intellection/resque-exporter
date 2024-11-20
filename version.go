package main

import (
	"runtime/debug"
	"time"
)

var (
	tagVersion string
)

// Version represents version information.
type Version struct {
	Development    bool
	SourceModified bool
	SourceRevision string
	SourceTime     time.Time
	Tag            string
}

// GetInfo returns version information.
func GetInfo() Version {
	buildInfo, _ := debug.ReadBuildInfo()
	versionInfo := Version{Tag: tagVersion}

	for _, setting := range buildInfo.Settings {
		if setting.Key == "vcs.modified" && setting.Value == "true" {
			versionInfo.SourceModified = true
		}

		if setting.Key == "vcs.revision" {
			versionInfo.SourceRevision = setting.Value
		}

		if setting.Key == "vcs.time" {
			versionInfo.SourceTime, _ = time.Parse(time.RFC3339, setting.Value)
		}
	}

	if versionInfo.Tag == "" {
		versionInfo.Development = true
		versionInfo.Tag = "N/A"
	}

	return versionInfo
}
