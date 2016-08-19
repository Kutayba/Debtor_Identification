####### RR stands for Retrieve Relevant (DL, LCS, Q-Grams, Cosine, Jaccard, JW)
ASM_RR_5 <- function(Dist_Vector, Dictionary) {
  Dist_Vector_Order <- order(Dist_Vector)[1:5]
  Dist_Vector_Sort <- sort(Dist_Vector)[1:5]
  return(list(Dictionary[Dist_Vector_Order], Dist_Vector_Sort))
}

ASM_RR_Soundex <- function(Dist_Vector, Dictionary) {
  Relevant_Values <- character();
  for(i in 1:length(Dist_Vector)) {
    if (Dist_Vector[[i]] == 0) {Relevant_Values <- c(Relevant_Values, Dictionary[[i]]) }} 
  ;if(length(Relevant_Values) == 0) { return("Not Found") } 
  else {return(Relevant_Values)}
}


###### List view edit
List_single_edit <- function(N_name, Results_List){
  Results_List <- list(rep(N_name, length(Results_List[[1]])), Results_List[[1]], Results_List[[2]])
  Results_List <- as.list(data.frame(t(t(do.call(rbind, Results_List))), stringsAsFactors = FALSE))
  return(Results_List)
}

#############
List_view_edit <- function(Parsed_Name, Results_List){
  Results_List_2 <- list();
  
  for (i in 1:length(Parsed_Name)) {
    Results_List_2 <- append(Results_List_2, List_single_edit(Parsed_Name[i], Results_List[(2*i -1):(2*i)]))
  }

  return(Results_List_2)}


###### List view edit
List_single_edit_soundex <- function(N_name, Results_vector){
  Results_List <- list();
  for (i in 1:length(Results_vector)) {
    Results_List[[i]] <- c(N_name, Results_vector[i]) 
  }
  return(Results_List)
}


###########
List_view_edit_soundex <- function(Parsed_Name, Results_List){
  Results_List_2 <- list();
  #results_list_lengths
  rll <- sapply(Results_List, length);
  
  if(length(Parsed_Name)==1){
    Results_List_2 <- List_single_edit_soundex(Parsed_Name, Results_List);
  }
  else{
    if(length(Parsed_Name)==2){
      Results_List_2[1:rll[1]] <- List_single_edit_soundex(Parsed_Name[1], Results_List[[1]]);
      Results_List_2[(rll[1]+1):(rll[1]+rll[2])] <- List_single_edit_soundex(Parsed_Name[2], Results_List[[2]]);
    }
    else{
      if(length(Parsed_Name)==3){
        Results_List_2[1:rll[1]] <- List_single_edit_soundex(Parsed_Name[1], Results_List[[1]]);
        Results_List_2[(rll[1]+1):(rll[1]+rll[2])] <- List_single_edit_soundex(Parsed_Name[2], Results_List[[2]]);
        Results_List_2[(rll[1]+rll[2]+1):(rll[1]+rll[2]+rll[3])] <- List_single_edit_soundex(Parsed_Name[3],
                                                                                    Results_List[[3]]);
      }
      else{
        if(length(Parsed_Name)==4){
          Results_List_2[1:rll[1]] <- List_single_edit_soundex(Parsed_Name[1], Results_List[[1]]);
          Results_List_2[(rll[1]+1):(rll[1]+rll[2])] <- List_single_edit_soundex(Parsed_Name[2], Results_List[[2]]);
          Results_List_2[(rll[1]+rll[2]+1):(rll[1]+rll[2]+rll[3])] <- List_single_edit_soundex(Parsed_Name[3],Results_List[[3]]);
          Results_List_2[(rll[1]+rll[2]+rll[3]+1):(rll[1]+rll[2]+rll[3]+rll[4])] <- List_single_edit_soundex(Parsed_Name[4],Results_List[[4]]);
        }
        else{
          if(length(Parsed_Name)==5){
            Results_List_2[1:rll[1]] <- List_single_edit_soundex(Parsed_Name[1], Results_List[[1]]);
            Results_List_2[(rll[1]+1):(rll[1]+rll[2])] <- List_single_edit_soundex(Parsed_Name[2], Results_List[[2]]);
            Results_List_2[(rll[1]+rll[2]+1):(rll[1]+rll[2]+rll[3])] <- List_single_edit_soundex(Parsed_Name[3],Results_List[[3]]);
            Results_List_2[(rll[1]+rll[2]+rll[3]+1):(rll[1]+rll[2]+rll[3]+rll[4])] <- List_single_edit_soundex(Parsed_Name[4],Results_List[[4]]);
            Results_List_2[(rll[1]+rll[2]+rll[3]+rll[4]+1):(rll[1]+rll[2]+rll[3]+rll[4]+rll[5])] <- List_single_edit_soundex(Parsed_Name[5],Results_List[[5]]);
          }}}}}
  return(Results_List_2)}


