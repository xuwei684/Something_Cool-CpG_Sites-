###Get Wildtype amino acid###

getWTAA<-function(df){
  check.integer <- function(N){
    !grepl("[^[:digit:]]", format(N,  digits = 20, scientific = FALSE))
  }
  if (check.integer(nrow(df)/3) == FALSE){
    df <- df[-nrow(df),]
    if (check.integer(nrow(df)/3) == FALSE){
      df <- df[-nrow(df),]
    }
    
  }
  #Assign consensus to a variable
  cons =  df$wtnt
  
  #Create empty vector for wildtype amino acid
  WTAA <- c()
  
  #Loop for translating consensus
  for(x in seq(1, length(cons) - 2, 3)){
    codon <- c(cons[x], cons[x+1], cons[x+2])
    new_AA <- seqinr::translate(codon)
    WTAA[x] <- new_AA
    WTAA[x+1] <- new_AA
    WTAA[x+2] <- new_AA
  }
  
  #Create "WTAA" column if not already
  if (length(which(names(df)=="WTAA"))==0){
    df$WTAA=0}
  
  #Insert value into column
  df$WTAA<-WTAA
  
  #Return the data frame
  return(df)
}