cleaned_file_paths <- c(
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_1.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_2.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_3.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_4.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_5.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_6.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_7.csv"
)
# Read each file and store them in a list
cleaned_data_list <- lapply(cleaned_file_paths, read.csv)
# Combine all data frames in the list into a single data frame
combined_cleaned_data <- bind_rows(cleaned_data_list)
write.csv(combined_cleaned_data, "~/Desktop/courseWorkCS8631/data/finalData/combined_cleaned_cyber_security.csv", row.names = FALSE)

cleaned_file_paths_leaving_survey_responses <- c(
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_1_leaving_survey_responses.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_2_leaving_survey_responses.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_3_leaving_survey_responses.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_4_leaving_survey_responses.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_5_leaving_survey_responses.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_6_leaving_survey_responses.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_7_leaving_survey_responses.csv"
)
cleaned_file_paths_leaving_survey_responses <- lapply(cleaned_file_paths_leaving_survey_responses, function(file_path) {
    read.csv(file_path) %>%
        mutate(
            learner_id = as.character(learner_id),   # Ensure learner_id is character
            left_at = as.character(left_at),          # Ensure left_at is character
            leaving_reason = as.character(leaving_reason)  # Ensure leaving_reason is character
        )
})
combined_cleaned_file_paths_leaving_survey_responses <- bind_rows(cleaned_file_paths_leaving_survey_responses)
write.csv(combined_cleaned_file_paths_leaving_survey_responses, "~/Desktop/courseWorkCS8631/data/finalData/combined_cleaned_cyber_security_leaving_survey_responses.csv", row.names = FALSE)




