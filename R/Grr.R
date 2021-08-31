#' A Reference Class to represent a new data type for dataframe with grouped columns
#'
#' @author Yannick Pascaud
#'
#' @field groups A list of a nemed vector of string (eg: list(grp1 = c("Field1", "Field3")))
#' @field data A data.frame object containing the data
#'
#' @export Grr
Grr <-methods::setRefClass("Grr",
                   fields = list(groups = "list", data = "data.frame"),
                   methods = list(
                     read = function(x=NULL){
                       if(is.null(x)){
                         data
                       } else {
                         data[unique(unlist(groups[x]))]
                       }
                     },
                     addGroup = function(x){
                       if(isGroup(names(x))){
                         stop("Group is already existing")
                       }
                       if(mean(isField(unlist(x)))!=1){
                         stop("Field does not exist")
                       } else {
                         groups <<- c(groups, x)
                       }
                     },
                     listGroup = function(){
                       names(groups)
                     },
                     listField = function(){
                       names(data)
                     },
                     isGroup = function(x){
                       x %in% listGroup()
                     },
                     isField = function(x){
                       x %in% listField()
                     },
                     listGroupComposition = function(x=NULL){
                       if(is.null(x)){
                         groups
                       } else {
                         groups[x]
                       }
                     },
                     removeGroup = function(x){
                       groups <<- groups[names(groups) %in% x == FALSE]
                     }
                   ))
