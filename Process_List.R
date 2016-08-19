
Process_List_lv <- function(Char_Vector, Dictionary){
  Match_List <- lapply(Char_Vector, Match_Full_Name_Comb_top_25, Dictionary)
  
  Match_List <- setNames(Match_List, Char_Vector)
  Tmp_df <- t(do.call(rbind, Match_List[[1]]))
  for (i in 2:length(Match_List)) {
    Tmp_df <- cbind(Tmp_df, t(do.call(rbind, Match_List[[i]])))
  }
  colnames(Tmp_df) <- as.character(rbind(Char_Vector, rep("Confidence", length(Char_Vector))))
  rownames(Tmp_df) <- 1:nrow(Tmp_df)
  return(Tmp_df)
}


Process_List <- function(Char_Vector, Dictionary){
  Match_List <- unlist(lapply(Char_Vector, Match_Full_Name_comb_top_25, Dictionary))
  Match_List <- split(Match_List, ceiling(seq_along(Match_List)/25))
  Odd_index <- seq(1, length(Match_List), 2)
  Match_List <- list(unlist(Match_List[Odd_index]), unlist(Match_List[- Odd_index]))
  return(Match_List)
}

Process_List_Method_lv <- function(Char_Vector, Dictionary, Method){
  Match_List <- lapply(Char_Vector, Match_Full_Name_top_25, Dictionary, Method)
  
  Tmp_df <- t(do.call(rbind, Match_List[[1]]))
  for (i in 2:length(Match_List)) {
    Tmp_df <- cbind(Tmp_df, t(do.call(rbind, Match_List[[i]])))
  }
  colnames(Tmp_df) <- as.character(rbind(Char_Vector, rep("Confidence", length(Char_Vector))))
  rownames(Tmp_df) <- 1:nrow(Tmp_df)
  return(Tmp_df)
}

Process_List_Method <- function(Char_Vector, Dictionary, Method){
  Match_List <- unlist(lapply(Char_Vector, Match_Full_Name_top_25, Dictionary, Method))
  Match_List <- split(Match_List, ceiling(seq_along(Match_List)/25))
  Odd_index <- seq(1, length(Match_List), 2)
  Match_List <- list(unlist(Match_List[Odd_index]), unlist(Match_List[- Odd_index]))
  return(Match_List)
}