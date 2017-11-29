por = read.table("student-por.csv", sep = ";", header = TRUE)
math = read.table("student-mat.csv", sep = ";", header = TRUE)

write.csv(por, "../modified_data/student-por.csv", row.names = FALSE)
write.csv(math, "../modified_data/student-mat.csv", row.names = FALSE)