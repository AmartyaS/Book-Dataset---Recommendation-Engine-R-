# Installing all the required packages
install.packages("recommenderlab",dependencies = TRUE)
install.packages("caTools")
library("recommenderlab")
library("caTools")

# Reading the data-file
file <- read.csv(file.choose())
View(file)
file <- file[,c(2:4)]

# Exploring the data-file
str(file)
View(file)
hist(file$Book.Rating)

# Creating the Real Rating Matrix
book_matrix <- as(file,'realRatingMatrix')

# Making a Popularity Based Recommendation Engine
book_rec_model1 <- Recommender(book_matrix,method="POPULAR")
book_predict1 <- predict(book_rec_model1,book_matrix[600],n=5)
# Printing the Recommended books
as(book_predict1,"list")

# Making User Based Collaborative Filtering Recommendation Engine
book_rec_model2 <- Recommender(book_matrix,method="UBCF",param=list(normalize="Z-score",method="Cosine"))
book_predict2 <- predict(book_rec_model2,book_matrix[600],n=5)
# Printing the Recommended Books
as(book_predict2,"list")
