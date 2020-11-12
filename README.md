# swifty  ![Platforms](https://img.shields.io/badge/platforms-Linux-lightgrey)

With this library you can easily transform and manipulate data in in the strongly typed Swift language.
The goal is to build a data science ecosystem in Swift without de use of third party libraries. At this point Swifty is in an alpha version with minimum functionalities to do data wrangling (see usage for examples). In future releases more checks and functionalities will be added. 
# Requirements
- Swift V>=5.2
- Path.swift
- Linux (Not tested on IOS yet)


# Usage

```swift
import swifty

// Create a Dataframe (columns are automatically generated)
let df = DataFrame(data: [[1, 2, 3], ["foo", "bar", "vis"]])

// Create Dataframe and specify column names and index 
let df = DataFrame(data: [[1, 2, 3], ["foo", "bar", "vis"]], columns: ["col1", "col2"], index: [0, 1, 2])

// Use subscripting
var df = DataFrame(data: [[1, 2, 3], [4, 5, 6]], columns: ["col1", "col2"])
df[["newCol"]] = df[["col2"]]

// Output
| col1 | col2 | newCol |
|------|------|--------|
| 1    | 4    | 4      |
| 2    | 5    | 5      |
| 3    | 6    | 6      |

// Read/write CSV files
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
- groupby
- Merge
- Documentation
- Slicing
- Print representation of the dataframe

# Minimum viable features to release
- Be able to create a dataframe from random data ✓
- Subsripting ✓
- Make a concat function ✓
- create an update data based on index function ✓
- read and write CSV files ✓
  1. Should be read in relative to your root directory ✓
  2. Writing to csv should also be relarive from cwd ✓
- Rename columns ✓
- drop columns ✓
- filter DataFrame based of pattern ✓
- Be able to do operations on columns
- Get DataFrame dimensions ✓ 
- Query data ✓
- Replace values condtional ✓

# Always ongoing
- Write Unit tests
- Documentation

# Nice to haves
- Slicing
- Be able to work with dates
- Convert column to different type

# Installation

# Install and get Swifty!

![Alt Text](https://media.giphy.com/media/ZGIb81A2Z4dcGc43ku/giphy.gif)

# Generate documentation
swift doc generate /home/aram/projects/swift/swifty/Sources/ --module-name swifty --output Documentation --format html