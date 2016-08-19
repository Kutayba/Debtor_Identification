
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
Match_Full_Name_Comb_top_25_lv <- function(Noisy_Data, Dictionary){
  Results_list <- Match_Full_Name_Comb(Noisy_Data, Dictionary)
  Results_list <- Result_Combinations_All(Results_list)
  Results_list <- as.list(data.frame(t(t(do.call(rbind, Results_list))), stringsAsFactors = FALSE))
  return(Results_list)
}

Match_Full_Name_Comb_top_25 <- function(Noisy_Data, Dictionary){
  Results_list <- Match_Full_Name_Comb(Noisy_Data, Dictionary)
  Results_list <- Result_Combinations_All(Results_list)
  return(Results_list)
}