set.seed(123)

# generating 400 workers dynamically
id <- 1:400
name <- paste("Worker", id, sep = "_")
gender <- sample(c("Male", "Female"), 400, replace = TRUE)
salary <- sample(5000:35000, 400, replace = TRUE)

workers <- data.frame(id, name, gender, salary, stringsAsFactors = FALSE)

# generating payment slips
for (i in 1:nrow(workers)) {
  level <- "N/A"
  tryCatch({
    if (workers$salary[i] > 10000 & workers$salary[i] < 20000) {
      level <- "A1"
    }
    if (workers$salary[i] > 7500 & workers$salary[i] < 30000 & workers$gender[i] == "Female") {
      level <- "A5-F"
    }
    
    cat(sprintf("Payment Slip: ID %d | Name: %s | Gender: %s | Salary: $%d | Level: %s\n",
                workers$id[i], workers$name[i], workers$gender[i],
                workers$salary[i], level))
  }, error = function(e) {
    cat("Error:", e$message, "\n")
  })
}
