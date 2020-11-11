# swifty https://img.shields.io/badge/<Platforms>-<Linus>-<lightgrey>

todo:
- Make sure that we can initialize an empty dataframe
- df["newcol"] = 2
- Conditional queries --> df.loc["col1" == "foo" && "col2 == "bar"]
- Check how unittests work for other packages
- DataFrame slicing 
- make something that eay identified if string of float



WHat to do when the skeleton of of dataframe is there (Order based on priority)
- drop columns ✓
- rename columns ✓
- add filter method ✓
- read and write csv ✓ 
- Deal with nil values
- merge 
- groupby
- update documentation
- dropnil
- Clean up code

--------
Train of thought:
1. for every array in Data it maps it to a Series. The series already casts the array
  to the correct type e.g. [1, 2, 3] --> Series([1, 2, 3], Int)
2. Create a DataFrame. A dataframe is a multi dimensional Serie
df.col1 --> Series. So this means that col1 is hashey to retrieve the values with label col1

# Generate documentation
swift doc generate /home/aram/projects/swift/swifty/Sources/ --module-name swifty --output Documentation --format html

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
- Print representation of the dataframe
- Convert column to different type

