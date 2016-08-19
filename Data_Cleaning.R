####### Data Cleaning
Remove_Punc <- function(x) {x <- str_replace_all(x, pattern = "[[:punct:]]", "")}
Remove_Digit <- function(x) {x <- str_replace_all(x, pattern = "[[:digit:]]", "")}
Remove_Extra_spaces <- function(x) {x <- str_replace_all(x, pattern = "\\s+", " ")}
Trim_both <- function(x) {x <- str_trim (x, side = "both")}

Clean_Char_Vector <- function(x) {x <- Remove_Punc(x)
x <- Remove_Digit(x)
x <- Remove_Extra_spaces(x) 
x <- Trim_both(x)
x <- tolower(x)
return(x)}


Transliterate <- function(character_vector) {
  character_vector <- iconv(character_vector, to= "ASCII//TRANSLIT")
  return(character_vector)
}

Transliterate_List <- function(character_List) {
  for (i in 1:length(character_List)) {
    character_List[[i]] <- Transliterate(character_List[[i]])
  }
  return(character_List)
}


Parse_to_Vector <- function(Complete_Name){
  Parsed_Vector <- str_split(Complete_Name, pattern = " ") [[1]]
  
  return(Parsed_Vector)
}

Parse_to_List <- function(Char_Vector){
  Parsed_List <- Clean_Char_Vector(Char_Vector)
  Parsed_List <- sapply(as.list(Parsed_List), Parse_to_Vector)
  Parsed_List
}

