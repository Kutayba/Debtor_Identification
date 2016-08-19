##### 1
##### Libraries

library(stringdist)
library(stringi)
library(stringr)

##### 
####### Data Cleaning

Remove_Punc <- function(x) {x <- str_replace_all(x, pattern = "[[:punct:]]", "")}
Remove_Digit <- function(x) {x <- str_replace_all(x, pattern = "[[:digit:]]", "")}
Remove_Extra_spaces <- function(x) {x <- str_replace_all(x, pattern = "\\s+", " ")}
Trim_both <- function(x) {x <- str_trim (x, side = "both")}

#

Clean_Char_Vector <- function(x) {x <- Remove_Punc(x)
x <- Remove_Digit(x)
x <- Remove_Extra_spaces(x) 
x <- Trim_both(x)
x <- tolower(x)
return(x)}

#

Parse_to_Vector <- function(Complete_Name){
  Parsed_Vector <- str_split(Complete_Name, pattern = " ") [[1]]
  
  return(Parsed_Vector)
}

##### 
###### Approximate String Matching:

##### Damerau-Levenshtein distance:
ASM_DL <- function(Noisy_Data, Dictionary, ...) { Noisy_Data <- Clean_Char_Vector(Noisy_Data);
DL_dist <-  stringdist(Noisy_Data ,Dictionary , method = "dl", ...); return (DL_dist)}

##### Longest common Substring distance:
ASM_LCS <- function(Noisy_Data, Dictionary, ...) { Noisy_Data <- Clean_Char_Vector(Noisy_Data);
LCS_dist <-  stringdist(Noisy_Data ,Dictionary, method = "lcs", ...); return (LCS_dist)}
##### Q-Gram Distance:
ASM_1_Gram <- function(Noisy_Data, Dictionary, ...) { Noisy_Data <- Clean_Char_Vector(Noisy_Data);
dist_1_gram <-  stringdist(Noisy_Data ,Dictionary, method = "qgram", q = 1, ...); return (dist_1_gram)}

ASM_2_Gram <- function(Noisy_Data, Dictionary, ...) { Noisy_Data <- Clean_Char_Vector(Noisy_Data);
dist_2_gram <-  stringdist(Noisy_Data ,Dictionary, method = "qgram", q = 2, ...); return (dist_2_gram)}

ASM_3_Gram <- function(Noisy_Data, Dictionary, ...) { Noisy_Data <- Clean_Char_Vector(Noisy_Data);
dist_3_gram <-  stringdist(Noisy_Data ,Dictionary, method = "qgram", q = 3, ...); return (dist_3_gram)}

#### Cosine Distance with q = 1 prforms better than with q = 2, q = 3 preforms worst even on names of medium length.
ASM_Cosine <- function(Noisy_Data, Dictionary, ...) { Noisy_Data <- Clean_Char_Vector(Noisy_Data);
Cosine_dist <-  stringdist(Noisy_Data ,Dictionary , method = "cosine", ...); return (Cosine_dist)}

#### Jaccard Distance with q = 1 prforms better than with q = 2
ASM_Jaccard <- function(Noisy_Data, Dictionary, ...) { Noisy_Data <- Clean_Char_Vector(Noisy_Data);
Jaccard_dist <-  stringdist(Noisy_Data ,Dictionary , method = "jaccard", ...); return (Jaccard_dist)}

##### Jaro and Jaro-Winkler Distances:
ASM_Jaro <- function(Noisy_Data, Dictionary, ...) { Noisy_Data <- Clean_Char_Vector(Noisy_Data);
Jaro_dist <-  stringdist(Noisy_Data , Dictionary , method = "jw", ...); return (Jaro_dist)}

ASM_JW <- function(Noisy_Data, Dictionary, ...) { Noisy_Data <- Clean_Char_Vector(Noisy_Data);
JW_dist <-  stringdist(Noisy_Data ,Dictionary , method = "jw" , p = 0.25, ...); return (JW_dist)}

##### Soundex Distance:
ASM_Soundex <- function (Noisy_Data , Trans_Dictionary, ...) { Noisy_Data <- Clean_Char_Vector(Noisy_Data);
SNDX_dist <- stringdist(Transliterate(Noisy_Data) , Trans_Dictionary , method = "soundex", ...);
return(SNDX_dist)}

##### 
####### RR stands for Retrieve Relevant (DL, LCS, Q-Grams, Cosine, Jaccard, JW)

ASM_RR_5 <- function(Dist_Vector, Dictionary) {
  Dist_Vector_Order <- order(Dist_Vector)[1:5]
  Dist_Vector_Sort <- sort(Dist_Vector)[1:5]
  return(list(Dictionary[Dist_Vector_Order], Dist_Vector_Sort))
}

#

ASM_RR_Soundex <- function(Dist_Vector, Dictionary) {
  Relevant_Values <- character();
  for(i in 1:length(Dist_Vector)) {
    if (Dist_Vector[[i]] == 0) {Relevant_Values <- c(Relevant_Values, Dictionary[[i]]) }} 
  ;if(length(Relevant_Values) == 0) { return("Not Found") } 
  else {return(Relevant_Values)}
}

##### 
########### Match_Single_Name
Match_Single_Name <- function(Noisy_Data, Dictionary, Method, ...){
  Name_Vector <- Parse_to_Vector(Clean_Char_Vector(Noisy_Data));
  Relevant_Values_list <- list();
  if (Method == "dl"){
    Relevant_Values_list <- ASM_RR_5(ASM_DL(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 4)], ...),
                                     Dictionary[[1]][which(Dictionary[[3]] > 4)]);
    if(Relevant_Values_list[[2]][1] > 1){
      Relevant_Values_list <- ASM_RR_5(ASM_DL(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 1)], ...),
                                       Dictionary[[1]]);}
    if(Relevant_Values_list[[2]][1] > 1){
      Relevant_Values_list <- ASM_RR_5(ASM_DL(Name_Vector, Dictionary[[1]], ...),
                                       Dictionary[[1]]);
    }}
  else {
    if (Method == "lcs"){
      Relevant_Values_list <- ASM_RR_5(ASM_LCS(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 4)], ...),
                                       Dictionary[[1]][which(Dictionary[[3]] > 4)]);
      if(Relevant_Values_list[[2]][1] > 1){
        Relevant_Values_list <- ASM_RR_5(ASM_LCS(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 1)], ...),
                                         Dictionary[[1]][which(Dictionary[[3]] > 1)]);}
      if(Relevant_Values_list[[2]][1] > 1){
        Relevant_Values_list <- ASM_RR_5(ASM_LCS(Name_Vector, Dictionary[[1]], ...),
                                         Dictionary[[1]]);
      }}
    else{
      if (Method == "1gram"){
        Relevant_Values_list <- ASM_RR_5(ASM_1_Gram(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 4)], ...),
                                         Dictionary[[1]][which(Dictionary[[3]] > 4)]);
        if(Relevant_Values_list[[2]][1] > 1){
          Relevant_Values_list <- ASM_RR_5(ASM_1_Gram(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 1)], ...),
                                           Dictionary[[1]][which(Dictionary[[3]] > 1)]);}
        if(Relevant_Values_list[[2]][1] > 1){
          Relevant_Values_list <- ASM_RR_5(ASM_1_Gram(Name_Vector, Dictionary[[1]], ...),
                                           Dictionary[[1]]);
        }}
      else{
        if (Method == "2gram"){
          Relevant_Values_list <- ASM_RR_5(ASM_2_Gram(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 4)], ...),
                                           Dictionary[[1]][which(Dictionary[[3]] > 4)]);
          if(Relevant_Values_list[[2]][1] > 1){
            Relevant_Values_list <- ASM_RR_5(ASM_2_Gram(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 1)], ...),
                                             Dictionary[[1]][which(Dictionary[[3]] > 1)]);}
          if(Relevant_Values_list[[2]][1] > 1){
            Relevant_Values_list <- ASM_RR_5(ASM_2_Gram(Name_Vector, Dictionary[[1]], ...),
                                             Dictionary[[1]]);
          }}
        else{
          if (Method == "3gram"){
            Relevant_Values_list <- ASM_RR_5(ASM_3_Gram(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 4)], 
                                                        ...), Dictionary[[1]][which(Dictionary[[3]] > 4)]);
            if(Relevant_Values_list[[2]][1] > 1){
              Relevant_Values_list <- ASM_RR_5(ASM_3_Gram(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 1)], ...),
                                               Dictionary[[1]][which(Dictionary[[3]] > 1)]);}
            if(Relevant_Values_list[[2]][1] > 1){
              Relevant_Values_list <- ASM_RR_5(ASM_3_Gram(Name_Vector, Dictionary[[1]], ...),
                                               Dictionary[[1]]);
            }}
          else{
            if (Method == "cosine"){
              Relevant_Values_list <- ASM_RR_5(ASM_Cosine(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 4)],
                                                          ...), Dictionary[[1]][which(Dictionary[[3]] > 4)]);
              if(Relevant_Values_list[[2]][1] > 0.05){
                Relevant_Values_list <- ASM_RR_5(ASM_Cosine(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 1)], ...),
                                                 Dictionary[[1]][which(Dictionary[[3]] > 1)]);}
              if(Relevant_Values_list[[2]][1] > 0.05){
                Relevant_Values_list <- ASM_RR_5(ASM_Cosine(Name_Vector, Dictionary[[1]], ...),
                                                 Dictionary[[1]]);
              }}
            else{
              if (Method == "jaccard"){
                Relevant_Values_list <- ASM_RR_5(ASM_Jaccard(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 4)],
                                                             ...), Dictionary[[1]][which(Dictionary[[3]] > 4)]);
                if(Relevant_Values_list[[2]][1] > 0.05){
                  Relevant_Values_list <- ASM_RR_5(ASM_Jaccard(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 1)], ...),
                                                   Dictionary[[1]][which(Dictionary[[3]] > 1)]);}
                if(Relevant_Values_list[[2]][1] > 0.05){
                  Relevant_Values_list <- ASM_RR_5(ASM_Jaccard(Name_Vector, Dictionary[[1]], ...),
                                                   Dictionary[[1]]);
                }}
              else{
                if (Method == "jw"){
                  Relevant_Values_list <- ASM_RR_5(ASM_JW(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 4)],
                                                          ...), Dictionary[[1]][which(Dictionary[[3]] > 4)]);
                  if(Relevant_Values_list[[2]][1] > 0.05){
                    Relevant_Values_list <- ASM_RR_5(ASM_JW(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 1)], ...),
                                                     Dictionary[[1]][which(Dictionary[[3]] > 1)]);}
                  if(Relevant_Values_list[[2]][1] > 0.05){
                    Relevant_Values_list <- ASM_RR_5(ASM_JW(Name_Vector, Dictionary[[1]], ...),
                                                     Dictionary[[1]]);
                  }
                }
                else{
                  if (Method == "jaro"){
                    Relevant_Values_list <- ASM_RR_5(ASM_Jaro(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 4)],
                                                              ...), Dictionary[[1]][which(Dictionary[[3]] > 4)]);
                    if(Relevant_Values_list[[2]][1] > 0.05){
                      Relevant_Values_list <- ASM_RR_5(ASM_Jaro(Name_Vector, Dictionary[[1]][which(Dictionary[[3]] > 1)], ...),
                                                       Dictionary[[1]][which(Dictionary[[3]] > 1)]);}
                    if(Relevant_Values_list[[2]][1] > 0.05){
                      Relevant_Values_list <- ASM_RR_5(ASM_Jaro(Name_Vector, Dictionary[[1]], ...),
                                                       Dictionary[[1]]);
                    }}}}}}}}}}
  return(Relevant_Values_list)
}

##### handle zero length exception
Match_Single_Name_Soundex <- function(Noisy_Data, Dictionary){
  Name_Vector <- Clean_Char_Vector(Noisy_Data);
  Relevant_Values <- ASM_RR_Soundex(ASM_Soundex(Name_Vector, Dictionary[[2]]),Dictionary[[1]])
  
  return(Relevant_Values)
}

##### Matching First and Surnames:


##### Stored transliterated dictionary to avoid repeating the process every time the fuction is called
Match_First_Last_Soundex <- function (Noisy_Data,  Dictionary) {
  Parsed_Name_Vector <- Parse_to_Vector(Clean_Char_Vector(Noisy_Data));
  Relevant_Values_list <- list(Match_Single_Name_Soundex(Parsed_Name_Vector[1],Dictionary),
                               Match_Single_Name_Soundex(Parsed_Name_Vector[2], Dictionary))
  return(Relevant_Values_list)
}


####### Match first, middle, last

#Missing values
Match_First_Middle_Last_Soundex <- function(Noisy_Data, Dictionary){
  Parsed_Name_Vector <- Parse_to_Vector(Clean_Char_Vector(Noisy_Data));
  Relevant_Values_list <- list (Match_Single_Name_Soundex(Parsed_Name_Vector[1], Dictionary),
                                Match_Single_Name_Soundex(Parsed_Name_Vector[2], Dictionary),
                                Match_Single_Name_Soundex(Parsed_Name_Vector[3], Dictionary))

  return(Relevant_Values_list)
}


###### Match_First_2_Middle_Last

# Soundex produces an error when one of the values has zero length

Match_First_2_Middle_Last_Soundex <- function(Noisy_Data, Dictionary){
  Parsed_Name_Vector <- Parse_to_Vector(Clean_Char_Vector(Noisy_Data));
  Relevant_Values_list <- list (Match_Single_Name_Soundex(Parsed_Name_Vector[1], Dictionary),
                                Match_Single_Name_Soundex(Parsed_Name_Vector[2], Dictionary),
                                Match_Single_Name_Soundex(Parsed_Name_Vector[3], Dictionary),
                                Match_Single_Name_Soundex(Parsed_Name_Vector[4], Dictionary))

  return(Relevant_Values_list)
}


####### Match_First_3_Middle_Last


# Soundex produces an error when one of the values has zero length

Match_First_3_Middle_Last_Soundex <- function(Noisy_Data, Dictionary){
  Parsed_Name_Vector <- Parse_to_Vector(Clean_Char_Vector(Noisy_Data));
  Relevant_Values_list <- list (Match_Single_Name_Soundex(Parsed_Name_Vector[1], Dictionary),
                                Match_Single_Name_Soundex(Parsed_Name_Vector[2], Dictionary),
                                Match_Single_Name_Soundex(Parsed_Name_Vector[3], Dictionary),
                                Match_Single_Name_Soundex(Parsed_Name_Vector[4], Dictionary),
                                Match_Single_Name_Soundex(Parsed_Name_Vector[5], Dictionary))

  return(Relevant_Values_list)
}



###### Conclusion Match full name

Match_Full_Name_lv <- function(Noisy_Data, Dictionary, Method){
  Parsed_Name_Vector <- Parse_to_Vector(Clean_Char_Vector(Noisy_Data));
  Relevant_Values_list <- list();
  
  for (i in 1:length(Parsed_Name_Vector)){
    Relevant_Values_list <- append(Relevant_Values_list,
                                   Match_Single_Name(Parsed_Name_Vector[i], Dictionary, Method))
  }
  Relevant_Values_list <- List_view_edit(Parsed_Name_Vector, Relevant_Values_list)
  return(Relevant_Values_list)
}

#

Match_Full_Name <- function(Noisy_Data, Dictionary, Method){
  Parsed_Name_Vector <- Parse_to_Vector(Clean_Char_Vector(Noisy_Data));
  Relevant_Values_list <- list();
  
  for (i in 1:length(Parsed_Name_Vector)){
    Relevant_Values_list <- append(Relevant_Values_list,
                                   Match_Single_Name(Parsed_Name_Vector[i], Dictionary, Method))
  }
  odd_index <- seq(1, length(Relevant_Values_list), 2)
  even_index <- seq(2, length(Relevant_Values_list), 2)
  Relevant_Values_list <- list(unlist(Relevant_Values_list[odd_index]), unlist(Relevant_Values_list[even_index]))
  return(Relevant_Values_list)
}


#####

Match_Full_Name_Soundex_lv <- function(Noisy_Data,Dictionary){
  Parsed_Name_Vector <- Parse_to_Vector(Clean_Char_Vector(Noisy_Data));
  Relevant_Values_list <- list();
  
  if(length(Parsed_Name_Vector ) == 1){
    Relevant_Values_list <- Match_Single_Name_Soundex(Noisy_Data, Dictionary)
  }
  else{
    if(length(Parsed_Name_Vector ) == 2){
      Relevant_Values_list <- Match_First_Last_Soundex(Noisy_Data, Dictionary)
    }
    else{
      if(length(Parsed_Name_Vector) == 3){
        Relevant_Values_list <- Match_First_Middle_Last_Soundex(Noisy_Data, Dictionary)
      }
      else{
        if(length(Parsed_Name_Vector) == 4){
          Relevant_Values_list <- Match_First_2_Middle_Last_Soundex(Noisy_Data, Dictionary)
        }
        else{
          if(length(Parsed_Name_Vector) == 5){
            Relevant_Values_list <- Match_First_3_Middle_Last_Soundex(Noisy_Data, Dictionary)
          }}}}}
  Relevant_Values_list <- List_view_edit_soundex(Parsed_Name_Vector, Relevant_Values_list)
  return(Relevant_Values_list)
}

#

Match_Full_Name_Soundex <- function(Noisy_Data, Dictionary){
  Parsed_Name_Vector <- Parse_to_Vector(Clean_Char_Vector(Noisy_Data));
  Relevant_Values_list <- list();
  if(length(Parsed_Name_Vector ) == 1){
    Relevant_Values_list <- Match_Single_Name_Soundex(Noisy_Data, Trans_Dictionary, Dictionary)
  }
  else{
    if(length(Parsed_Name_Vector ) == 2){
      Relevant_Values_list <- Match_First_Last_Soundex(Noisy_Data, Dictionary)
    }
    else{
      if(length(Parsed_Name_Vector) == 3){
        Relevant_Values_list <- Match_First_Middle_Last_Soundex(Noisy_Data, Dictionary)
      }
      else{
        if(length(Parsed_Name_Vector) == 4){
          Relevant_Values_list <- Match_First_2_Middle_Last_Soundex(Noisy_Data, Dictionary)
        }
        else{
          if(length(Parsed_Name_Vector) == 5){
            Relevant_Values_list <- Match_First_3_Middle_Last_Soundex(Noisy_Data, Dictionary)
          }}}}}
  
  return(Relevant_Values_list)
}



##### 
##### voting functions:

range01 <- function(x){(x-min(x))/(max(x)-min(x))}
complement <- function(x) {(1-x)}
Bias <- function(x){
  for (i in 1:length(x)) {
    if(x[i] == 0){x[i] <- (x[i] + 0.1) }}
  return(x)}

conf_process <- function(Num_vector){
  if(length(unique(Num_vector)) == 1){
    Num_vector <- rep(1,5)
  }
  else{
    Num_vector <- Bias( complement( range01(Num_vector)))
  }}

##### 
####### Match single name using all algorithms

Match_Single_Name_Comb <- function(Noisy_Data, Dictionary){
  Name_Vector <- Parse_to_Vector(Clean_Char_Vector(Noisy_Data));
  Relevant_Values_list <- list();
  
  Relevant_Values_list[1:2] <- Match_Single_Name(Noisy_Data, Dictionary, Method = "dl")
  Relevant_Values_list[[2]] <- 0.6 *conf_process(Relevant_Values_list[[2]])
  Relevant_Values_list[3:4] <- Match_Single_Name(Noisy_Data, Dictionary, Method = "lcs")
  Relevant_Values_list[[4]] <- 0.5 *conf_process(Relevant_Values_list[[4]])
  Relevant_Values_list[5:6] <- Match_Single_Name(Noisy_Data, Dictionary, Method = "1gram")
  Relevant_Values_list[[6]] <- 0.5 *conf_process(Relevant_Values_list[[6]])
  #Relevant_Values_list[7:8] <- Match_Single_Name(Noisy_Data, Dictionary, Method = "2gram")
  #Relevant_Values_list[[8]] <- 0.4* conf_process(Relevant_Values_list[[8]])
  Relevant_Values_list[7:8] <- Match_Single_Name(Noisy_Data, Dictionary, Method = "cosine")
  Relevant_Values_list[[8]] <- 0.8 *complement(Relevant_Values_list[[8]])
  Relevant_Values_list[9:10] <- Match_Single_Name(Noisy_Data, Dictionary, Method = "jaccard")
  Relevant_Values_list[[10]] <- 0.6 *complement(Relevant_Values_list[[10]])
  Relevant_Values_list[11:12] <- Match_Single_Name(Noisy_Data, Dictionary, Method = "jaro")
  Relevant_Values_list[[12]] <- 0.8 *complement(Relevant_Values_list[[12]])
  Relevant_Values_list[13:14] <- Match_Single_Name(Noisy_Data, Dictionary, Method = "jw")
  Relevant_Values_list[[14]] <- complement(Relevant_Values_list[[14]])
  
  Relevant_Values_list <- Combine_Method_Output(Relevant_Values_list)
  return(Relevant_Values_list)
}


######## Combine output 
Combine_Method_Output <- function(Relevant_Values_list){
  
  Odd_index <- seq(1, length(Relevant_Values_list), 2)
  Even_index <- seq(2, length(Relevant_Values_list), 2)
  results_list <- list(unlist(Relevant_Values_list[Odd_index]), unlist(Relevant_Values_list[Even_index]))
  
  Conf_comb <- c()
  
  for (j in 1:length(results_list[[2]])) {
    Conf_comb[j] <- sum(results_list[[2]] [results_list[[1]] == results_list[[1]][j]]) / 4.8
  }
  Conf_comb <- unique(Conf_comb)
  results_list <- lapply(results_list, unique)
  results_list[[1]] <- results_list[[1]][order(Conf_comb, decreasing = TRUE)] [1:5]
  results_list[[2]] <- Conf_comb[order(Conf_comb, decreasing = TRUE)] [1:5]
  
  return(results_list)}


##### 
##### Conclusion Match full name using all algorithms

Match_Full_Name_Comb <- function(Noisy_Data, Dictionary){
  Parsed_Name_Vector <- Parse_to_Vector(Clean_Char_Vector(Noisy_Data));
  Relevant_Values_list <- list();
  for (i in 1:length(Parsed_Name_Vector)){
    Relevant_Values_list <- append(Relevant_Values_list,
                                   Match_Single_Name_Comb(Parsed_Name_Vector[i], Dictionary))
  }
  odd_index <- seq(1, length(Relevant_Values_list), 2)
  even_index <- seq(2, length(Relevant_Values_list), 2)
  Relevant_Values_list <- list(unlist(Relevant_Values_list[odd_index]), unlist(Relevant_Values_list[even_index]))
  
  return(Relevant_Values_list)
}


#####
###### Process List of names using all algorithms

Process_List <- function(Char_Vector, Dictionary){
  Match_List <- unlist(lapply(Char_Vector, Match_Full_Name_comb_top_25, Dictionary))
  Match_List <- split(Match_List, ceiling(seq_along(Match_List)/25))
  Odd_index <- seq(1, length(Match_List), 2)
  Match_List <- list(unlist(Match_List[Odd_index]), unlist(Match_List[- Odd_index]))
  return(Match_List)
}


# Process List of names using one algorithms

Process_List_Method <- function(Char_Vector, Dictionary, Method){
  Match_List <- unlist(lapply(Char_Vector, Match_Full_Name_top_25, Dictionary, Method))
  Match_List <- split(Match_List, ceiling(seq_along(Match_List)/25))
  Odd_index <- seq(1, length(Match_List), 2)
  Match_List <- list(unlist(Match_List[Odd_index]), unlist(Match_List[- Odd_index]))
  return(Match_List)
}

##### 
##### Combine Results using all algorithms


Result_Combinations_All <- function(Relevant_Values_list){
  Relevant_Values_list <- c(split(Relevant_Values_list[[1]], ceiling(seq_along(Relevant_Values_list[[1]])/5)),
                            split(Relevant_Values_list[[2]], ceiling(seq_along(Relevant_Values_list[[2]])/5)))
  
  Name_index <- 1:(length(Relevant_Values_list)/2)
  
  tmp_df <- data.frame(expand.grid(Relevant_Values_list[Name_index]), expand.grid(Relevant_Values_list[- Name_index]),
                       stringsAsFactors = FALSE)
  tmp_df <- setNames(tmp_df, letters[1:ncol(tmp_df)])
  Results_list <- list(apply(tmp_df[, letters[1:(ncol(tmp_df)/2)]], 1, paste, collapse = " "),
                       apply(tmp_df[, letters[(ncol(tmp_df)/2 + 1):(ncol(tmp_df))]], 1, prod))
  Results_list[[1]] <- Results_list[[1]][order(Results_list[[2]], decreasing = TRUE)][1:25]
  Results_list[[2]] <- sort(Results_list[[2]], decreasing = TRUE) [1:25]
  return(Results_list)}

############


Match_Full_Name_Comb_top_25 <- function(Noisy_Data, Dictionary){
  Results_list <- Match_Full_Name_Comb(Noisy_Data, Dictionary)
  Results_list <- Result_Combinations_All(Results_list)
  return(Results_list)
}

##### 
##### Combine Results using one algorithms


Result_Combinations <- function(Relevant_Values_list, Method){
  Relevant_Values_list <- process_confidence(Relevant_Values_list, Method)
  Relevant_Values_list <- c(split(Relevant_Values_list[[1]], ceiling(seq_along(Relevant_Values_list[[1]])/5)),
                            split(Relevant_Values_list[[2]], ceiling(seq_along(Relevant_Values_list[[2]])/5)))
  
  Name_index <- 1:(length(Relevant_Values_list)/2)
  tmp_df <- data.frame(expand.grid(Relevant_Values_list[Name_index]), expand.grid(Relevant_Values_list[-Name_index]),
                       stringsAsFactors = FALSE)
  tmp_df <- setNames(tmp_df, letters[1:ncol(tmp_df)])
  Results_list <- list(apply(tmp_df[, letters[1:(ncol(tmp_df)/2)]], 1, paste, collapse = " "),
                       apply(tmp_df[, letters[(ncol(tmp_df)/2 + 1):(ncol(tmp_df))]], 1, prod))
  Results_list[[1]] <- Results_list[[1]][order(Results_list[[2]], decreasing = TRUE)][1:25]
  Results_list[[2]] <- sort(Results_list[[2]], decreasing = TRUE) [1:25]
  
  return(Results_list)}

########

process_confidence <- function(Relevant_Values_list, Method){
  
  if(is.element(Method, c("dl", "lcs", "1gram", "2gram", "3gram"))){
    Relevant_Values_list[[2]] <- conf_process(Relevant_Values_list[[2]])
  }
  else{
    Relevant_Values_list[[2]] <- complement(Relevant_Values_list[[2]])
  }
  return(Relevant_Values_list)}


########

#

Match_Full_Name_top_25 <- function(Noisy_Data, Dictionary, Method){
  Results_list <- Match_Full_Name(Noisy_Data, Dictionary, Method)
  Results_list <- Result_Combinations(Results_list, Method)
  
  return(Results_list)
}

##### 
######## Update Dictionary

Update_Dictionary <- function(Char_Vector, Dictionary){
  Char_Vector <- unlist(lapply(Clean_Char_Vector(Char_Vector), Parse_to_Vector))
  Char_Vector <- Char_Vector[nchar(Char_Vector) > 2]
  for (i in 1:length(Char_Vector)) {
    if(is.element(Char_Vector[[i]], Dictionary[[1]])){
      tmp_int <- which(Dictionary[[1]] == Char_Vector[i])
      Dictionary[[3]][tmp_int] <- Dictionary[[3]][tmp_int] + 1
    }
    else{
      Dictionary[[1]] <- c(Dictionary[[1]], Char_Vector[[i]])
      Dictionary[[2]] <- c(Dictionary[[2]], stri_trans_general(Char_Vector[[i]], "latin-ascii"))
      Dictionary[[3]] <- c(Dictionary[[3]], 1)
    }
  }
  Int_Vec <- order(Dictionary[[3]])
  Dictionary[[1]] <- Dictionary[[1]][Int_Vec]
  Dictionary[[2]] <- Dictionary[[2]][Int_Vec]
  Dictionary[[3]] <- sort(Dictionary[[3]])
  return(Dictionary)
}

