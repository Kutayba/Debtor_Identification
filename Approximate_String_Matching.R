
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
