# swifty  ![Platforms](https://img.shields.io/badge/platforms-Linux%20%7C%20MacOS-lightgrey) [![Build Status](https://travis-ci.com/AramKoorn/swifty.svg?token=JpKygpYAeEtSWFyNQ2fB&branch=main)](https://travis-ci.com/AramKoorn/swifty) ![Versions](https://img.shields.io/badge/Swift-5.2-orange)

With this library you can easily transform and manipulate data in in the strongly typed Swift language.
The goal is to build a data science ecosystem in Swift without de use of third party libraries. At this point Swifty is in an alpha version with minimum functionalities to do data wrangling (see usage for examples). In future releases more checks and functionalities will be added. 

# Requirements
-  [Path.swift](https://github.com/mxcl/Path.swift)

# Usage

```swift
import swifty

// Create a Dataframe (columns are automatically generated)
let df = DataFrame(data: [[1, 2, 3], ["foo", "bar", "vis"]])

// Create Dataframe and specify column names and index 
let df = DataFrame(data: [[1, 2, 3], ["foo", "bar", "vis"]], 
          columns: ["col1", "col2"], index: [0, 1, 2])

// Use subscripting
var df = DataFrame(data: [[1, 2, 3], [4, 5, 6]], columns: ["col1", "col2"])
df[["newCol"]] = df[["col2"]]

// Output
| col1 | col2 | newCol |
|------|------|--------|
| 1    | 4    | 4      |
| 2    | 5    | 5      |
| 3    | 6    | 6      |

// Read/write CSV files (relative path of your cwd)
 let df = readCSV(loc: "pathOfCSVFile.csv")
df.writeCSV(loc: "SomePath.csv")

// Filter DataFrame based on pattern
var df = DataFrame(data: [[1], [2], [3], [1]],
                columns: ["col1", "col2", "el1", "el2"] )
df.filter(pattern: "el")

//output
| el1 | el2 |
|-----|-----|
| 3   | 1   |

// Subselect data
var df = DataFrame(data: [[1, 2, 3], [2, 2, 5], ["foo", "bar","baz"]],
                            columns: ["col1", "col2", "col3"])
df.query(column: "col3", values: ["bar", "baz"])

//output
| col1 | col2 | col3 |
|------|------|------|
| 2    | 2    | bar  |
| 3    | 5    | baz  |

// Drop and rename columns
var df = DataFrame(data: [[1, 2, 3], [2, 3, 4]], columns: ["col1", "col2"])
df.rename(mapper: ["col2": "renamedCol"])
df.drop(columns: ["col1"])

// replace values
var df = DataFrame(data: [[1, 2, 3], [2, 2, 5], ["foo", "bar","baz"]],
                    columns: ["col1", "col2", "col3"])
df.replace(column: "col3", mapper: ["bar": "vis", "baz": "hello"])

// output
| col1 | col2 | col3  |
|------|------|-------|
| 1    | 2    | foo   |
| 2    | 2    | vis   |
| 3    | 5    | hello |

```

# What is on the roadmap
- Groupby
- Merge
- Melt
- Pivot
- Casting columns to different types
- Documentation
- Slicing
- Print representation of the dataframe
- Be able to work with dates

# Installation SPM

You can install swifty by using the Swift Package Mangager. Below you can find an example to import swifty for a project called my Project
```
// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "myProject",
    dependencies: [(.package(url: "https://github.com/AramKoorn/swifty", from: "0.0.1"))
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(name: "myProject", dependencies: [.product(name: "swifty", package: "swifty")]),
        .testTarget(
            name: "myProjectTests",
            dependencies: ["myProject"]),
    ]
)

```

# Install and get Swifty!

![Alt Text](https://media.giphy.com/media/ZGIb81A2Z4dcGc43ku/giphy.gif)

# Documentation
Documentation will be released soon!