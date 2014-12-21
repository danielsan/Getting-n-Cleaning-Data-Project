library(reshape)
library(plyr)

get_activity_labels <- function() {
  activity_labels <-read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("id", "name"))
  get_activity_labels <<- function() activity_labels
  activity_labels
}

get_features <- function() {
  features <-read.table("./UCI HAR Dataset/features.txt", header = F,col.names = c("id", "name"))
  get_features <<- function() features
  features
}

read_dataset <- function(type = 'test', folder="./UCI HAR Dataset/") {
  subjectPath <- paste(folder, type, '/subject_', type, '.txt', sep='')
  xFilePath   <- paste(folder, type, '/X_'      , type, '.txt', sep='')
  yFilePath   <- paste(folder, type, '/y_'      , type, '.txt', sep='')
  
  get_x_table <- function() {
    x_table <-read.table(xFilePath, header = FALSE)
    names(x_table)   <- get_features()$name
    x_table$Activity <- factor(get_y_table()$V1, get_activity_labels()$id, ordered=T, labels=get_activity_labels()$name)
    x_table$Subject  <- read.table(subjectPath)[,1]
    get_x_table <<- function() x_table
    print('first time x')
    x_table
  }

  get_y_table <- function() {
    y_table <- read.table(yFilePath, header = FALSE)
    get_y_table <- function() y_table
    y_table
  }

  list(get_data = get_x_table)
}

train <- read_dataset('train')
test  <- read_dataset('test')

step4 <- rbind(train$get_data(), test$get_data())[ grep("Activity|Subject|mean|std", names(train$get_data())) ]

# convert to narrow tidy data
melted_step4 <- melt(step4, id=c("Subject", "Activity"))

# group by "Activity", "Subject", "variable" and then take the mean
output <- ddply(melted_step4, c("Activity", "Subject", "variable"), function(data){ mean(data$value) })
names(output) <- c("Activity", "Subject", "Variable", "VarValue")

## It writes the datasets into a file
write.table( output, "output.txt", row.name = FALSE)
