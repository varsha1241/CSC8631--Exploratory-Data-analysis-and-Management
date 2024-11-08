file_paths <- c(
    "~/Desktop/courseWorkCS8631/data/cyber-security-1_enrolments.csv",
    "~/Desktop/courseWorkCS8631/data/cyber-security-2_enrolments.csv",
    "~/Desktop/courseWorkCS8631/data/cyber-security-3_enrolments.csv",
    "~/Desktop/courseWorkCS8631/data/cyber-security-4_enrolments.csv",
    "~/Desktop/courseWorkCS8631/data/cyber-security-5_enrolments.csv",
    "~/Desktop/courseWorkCS8631/data/cyber-security-6_enrolments.csv",
    "~/Desktop/courseWorkCS8631/data/cyber-security-7_enrolments.csv"
)
cleaned_file_paths <- c(
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_cyber_security_1.csv",
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_cyber_security_2.csv",
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_cyber_security_3.csv",
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_cyber_security_4.csv",
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_cyber_security_5.csv",
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_cyber_security_6.csv",
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_cyber_security_7.csv"
)
output_dir <- "~/Desktop/courseWorkCS8631/cache/preData"
if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
}

for (i in seq_along(file_paths)) {
    cleaned_data <- read.csv(file_paths[i]) %>%
        select(learner_id, highest_education_level, employment_area) %>%
        filter(!is.na(learner_id))
    write.csv(cleaned_data, cleaned_file_paths[i], row.names = FALSE)
}


file_paths_leaving_survey_responses <- c(
    "~/Desktop/courseWorkCS8631/data/cyber-security-1_leaving-survey-responses.csv",
    "~/Desktop/courseWorkCS8631/data/cyber-security-2_leaving-survey-responses.csv",
    "~/Desktop/courseWorkCS8631/data/cyber-security-3_leaving-survey-responses.csv",
    "~/Desktop/courseWorkCS8631/data/cyber-security-4_leaving-survey-responses.csv",
    "~/Desktop/courseWorkCS8631/data/cyber-security-5_leaving-survey-responses.csv",
    "~/Desktop/courseWorkCS8631/data/cyber-security-6_leaving-survey-responses.csv",
    "~/Desktop/courseWorkCS8631/data/cyber-security-7_leaving-survey-responses.csv"
)

cleaned_file_paths_leaving_survey_responses <- c(
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_cyber_security_1_leaving_survey_responses.csv",
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_cyber_security_2_leaving_survey_responses.csv",
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_cyber_security_3_leaving_survey_responses.csv",
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_cyber_security_4_leaving_survey_responses.csv",
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_cyber_security_5_leaving_survey_responses.csv",
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_cyber_security_6_leaving_survey_responses.csv",
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_cyber_security_7_leaving_survey_responses.csv"
)
output_dir_leaving_survey_responses <- "~/Desktop/courseWorkCS8631/cache/preData"
if (!dir.exists(output_dir_leaving_survey_responses)) {
    dir.create(output_dir_leaving_survey_responses, recursive = TRUE)
}
for (i in seq_along(file_paths_leaving_survey_responses)) {
    cleaned_data <- suppressWarnings(read.csv(file_paths_leaving_survey_responses[i])) %>%
        select(learner_id, left_at, leaving_reason) %>%
        filter(!is.na(learner_id))
    write.csv(cleaned_data, cleaned_file_paths_leaving_survey_responses[i], row.names = FALSE)
}



required_columns <- c("learner_id", "enrolled_at", "unenrolled_at", "highest_education_level", "employment_area")
# Function to ensure each dataframe has all required columns
ensure_columns <- function(df, required_cols) {
    missing_cols <- setdiff(required_cols, names(df))
    df[missing_cols] <- NA  # Add missing columns with NA values
    return(df)
}

# Apply this function to each dataframe in the list
cleaned_data_list <- lapply(file_paths, read.csv)
cleaned_data_list <- lapply(cleaned_data_list, ensure_columns, required_cols = required_columns)
combined_cleaned_data <- bind_rows(cleaned_data_list)
# Now proceed with your summarization
duplicate_counts <- combined_cleaned_data %>%
    group_by(learner_id) %>%
    summarise(
        count = n_distinct(enrolled_at, unenrolled_at, highest_education_level, employment_area),
        unique_enrolled_at = unique(enrolled_at) %>% paste(collapse = ", "),
        unique_unenrolled_at = unique(unenrolled_at) %>% paste(collapse = ", ")
    ) %>%
    filter(count > 1) %>%
    ungroup()
write.csv(duplicate_counts, "~/Desktop/courseWorkCS8631/cache/preData/duplicate_counts.csv", row.names = FALSE)



file_paths <- c(
    "~/Desktop/courseWorkCS8631/data/cyber-security-3_video-stats.csv",
    "~/Desktop/courseWorkCS8631/data/cyber-security-4_video-stats.csv",
    "~/Desktop/courseWorkCS8631/data/cyber-security-5_video-stats.csv",
    "~/Desktop/courseWorkCS8631/data/cyber-security-6_video-stats.csv",
    "~/Desktop/courseWorkCS8631/data/cyber-security-7_video-stats.csv"
)
cleaned_file_paths <- c(
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_video-stats_3.csv",
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_video-stats_4.csv",
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_video-stats_5.csv",
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_video-stats_6.csv",
    "~/Desktop/courseWorkCS8631/cache/preData/cleaned_video-stats_7.csv"
)
output_dir <- "~/Desktop/courseWorkCS8631/cache/preData"
if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
}

for (i in seq_along(file_paths)) {
    cleaned_data <- read.csv(file_paths[i]) %>%
        select(video_duration)
    write.csv(cleaned_data, cleaned_file_paths[i], row.names = FALSE)
}


