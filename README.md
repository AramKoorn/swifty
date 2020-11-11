# swifty  ![Platforms](https://img.shields.io/badge/platforms-Linux-lightgrey)

With this library you can easily transform and manipulate data in in the strongly typed Swift language.
The goal is to build a data science ecosystem in Swift without de use of third party libraries.

# Requirements
- Swift V>=5.2
- Path.swift
- Linux (Not tested on IOS yet)


# Usage

```swift
import swifty


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