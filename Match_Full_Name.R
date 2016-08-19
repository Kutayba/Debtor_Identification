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
  #if (length(Relevant_Values) == 0){
   # return(NA)}
 # else{}
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
  #for (i in 1:length(Relevant_Values_list)) {
    #for (j in 1:length(Relevant_Values_list[[i]])) {
     # if(is.na(Relevant_Values_list[[i]][j])){
       # Relevant_Values_list[[i]] <- Relevant_Values_list[[i]][-j]}}}

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
  #for (i in 1:length(Relevant_Values_list)) {
    #for (j in 1:length(Relevant_Values_list[[i]])) {
      #if(is.na(Relevant_Values_list[[i]][j])){
       # Relevant_Values_list[[i]] <- Relevant_Values_list[[i]][-j]
      #}}}
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
  #for (i in 1:length(Relevant_Values_list)) {
    #for (j in 1:length(Relevant_Values_list[[i]])) {
     # if(is.na(Relevant_Values_list[[i]][j])){
       # Relevant_Values_list[[i]] <- Relevant_Values_list[[i]][-j]
     # }}}
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


###############
#Combine_Output <- function(List_of_Lists){
 # List_of_Lists[[1]] <- c(List_of_Lists[[1]], List_of_Lists[[3]])
 # List_of_Lists[[2]] <- c(List_of_Lists[[2]], List_of_Lists[[4]])
#  List_of_Lists[[4]] <- NULL
 # List_of_Lists[[3]] <- NULL
 # List_of_Lists[[1]] <- List_of_Lists[[1]] [order(List_of_Lists[[2]])] [1:5]
 # List_of_Lists[[2]] <- List_of_Lists[[2]] [order(List_of_Lists[[2]])] [1:5]
#  return(List_of_Lists)
#}
