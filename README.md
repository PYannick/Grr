## Data Frame with columns grouping information

`Grr` can be used to create an object containing data in a data.frame and information about columns being grouped together (thematically for example)  

The packages includes a Reference Class definition for the `Grr` object with associated methods to handle it.  
   
## Usage

``` r
### Example of a dataset (3x3)
GrrData <- data.frame(Field1 = 1:3, Field2 = 4:6, Field3 = c('a', 'b', 'c'))
### Definition of a group of columns
GrrGroups <- list(grp1 = c("Field1", "Field3"))

### Create the Grr Object containing the data and the groups defined
g <- Grr(groups=GrrGroups, data=GrrData)

### Read the data contained in the Grr object
g$read()        # with no parameter, the full dataset is return
g$read("grp1")  # with a parmeter corresponding to a group defined, only the columns from the group are returned

### Add a new group of column
g$addGroup(list(grp2 = c("Field2", "Field3")))
g$read("grp2")

### Some usefull functions
g$listGroup()   # list the groups defined in the Grr object
g$listField()   # list the fields defined in the dataframe from the Grr object

### Test if groups/ fields exist in the Grr object
g$isField(c("Field1","Field"))    # for fields
g$isGroup("grp3")                 # for groups

### Return the groups and their fields
g$listGroupComposition()
```

