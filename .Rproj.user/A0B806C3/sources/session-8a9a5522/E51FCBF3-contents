combined_data <- read.csv("~/Desktop/courseWorkCS8631/data/finalData/combined_cleaned_cyber_security.csv")
combined_data <- combined_data %>%
    mutate(
        highest_education_level = ifelse(highest_education_level == "Unknown", NA, highest_education_level),
        employment_area = ifelse(employment_area == "Unknown", NA, employment_area)
    )
write.csv(combined_data, "~/Desktop/courseWorkCS8631/data/finalData/combined_cleaned_cyber_security.csv", row.names = FALSE)

duplicates_data <- read.csv("~/Desktop/courseWorkCS8631/data/preProcessedData/duplicate_counts.csv")
duplicates_data <- duplicates_data %>%
    separate(unique_enrolled_at, into = paste0("enrolled_at_", 1:7), sep = ", ", fill = "right") %>%
    mutate(across(starts_with("enrolled_at_"), ~ as.Date(sub(" UTC", "", .), format="%Y-%m-%d")))
duplicates_data <- duplicates_data %>%
    separate(unique_unenrolled_at, into = paste0("unenrolled_at_", 1:7), sep = ", ", fill = "right") %>%
    mutate(across(starts_with("unenrolled_at_"), ~ as.Date(sub(" UTC", "", .), format="%Y-%m-%d")))
write.csv(duplicates_data, "~/Desktop/courseWorkCS8631/data/finalData/duplicate_counts_separated_dates.csv", row.names = FALSE)

duplicates_data_leaving_survey_responses <- read.csv("~/Desktop/courseWorkCS8631/data/finalData/combined_cleaned_cyber_security_leaving_survey_responses.csv",fileEncoding = "UTF-8")
duplicates_data_leaving_survey_responses <- duplicates_data_leaving_survey_responses %>%
    mutate(left_at = format(as.Date(sub(" .*", "", left_at), format="%Y-%m-%d"), "%d-%m-%Y"))
write.csv(duplicates_data_leaving_survey_responses, "~/Desktop/courseWorkCS8631/data/finalData/combined_cleaned_cyber_security_leaving_survey_responses.csv", row.names = FALSE)

