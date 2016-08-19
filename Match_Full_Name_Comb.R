
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



##### Conclusion Match full name
Match_Full_Name_Comb_lv <- function(Noisy_Data, Dictionary){
  Parsed_Name_Vector <- Parse_to_Vector(Clean_Char_Vector(Noisy_Data));
  Relevant_Values_list <- list()
  for (i in 1:length(Parsed_Name_Vector)){
    Relevant_Values_list <- append(Relevant_Values_list,
                                   Match_Single_Name_Comb(Parsed_Name_Vector[i], Dictionary))
  }

  Relevant_Values_list <- List_view_edit(Parsed_Name_Vector, Relevant_Values_list)
  return(Relevant_Values_list)
}


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



