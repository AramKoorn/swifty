# swifty

todo:
- Make sure that we can initialize an empty dataframe
- df["newcol"] = 2
- Conditional queries --> df.loc["col1" == "foo" && "col2 == "bar"]
- Check how unittests work for other packages
- Make unittesting work!!!!!!!!!!
- DataFrame slicing 
- make something that eay identified if string of float



WHat to do when the skeleton of of dataframe is there (Order based on priority)
- read and write csv
- merge 
- groupby
- update documentation
- dropna

Ideas
- Create own type (like np.array)


--------
I should be able to do something like
var df = DataFrame(data: [[1, 2, 3], ["1", "2", "3"]])

Train of thought:
1. for every array in Data it maps it to a Series. The series already casts the array
  to the correct type e.g. [1, 2, 3] --> Series([1, 2, 3], Int)
2. Create a DataFrame. A dataframe is a multi dimensional Serie
df.col1 --> Series. So this means that col1 is hashey to retrieve the values with label col1






# Generate documentation
swift doc generate /home/aram/projects/swift/swifty/Sources/ --module-name swifty --output Documentation --format html
