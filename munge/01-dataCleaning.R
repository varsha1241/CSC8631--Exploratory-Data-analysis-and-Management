data_frame_names <- c(
    "cyber.security.1_enrolments",
    "cyber.security.2_enrolments",
    "cyber.security.3_enrolments",
    "cyber.security.4_enrolments",
    "cyber.security.5_enrolments",
    "cyber.security.6_enrolments",
    "cyber.security.7_enrolments"
)

# Loop through each data frame name, clean, and overwrite it
for (name in data_frame_names) {
    # Access each data frame by name, clean, and assign it back to the same name
    assign(name, get(name) %>%
               select(learner_id, employment_area) %>%
               filter(!is.na(learner_id)))
}

data_frame_names_leaving_survey_responses <- c(
    "cyber.security.4_leaving.survey.responses",
    "cyber.security.5_leaving.survey.responses",
    "cyber.security.6_leaving.survey.responses",
    "cyber.security.7_leaving.survey.responses"
)

ensure_columns <- function(df, required_cols) {
    missing_cols <- setdiff(required_cols, names(df))
    df[missing_cols] <- NA  # Add missing columns with NA values
    return(df)
}

# Define required columns
required_columns <- c("learner_id", "enrolled_at", "unenrolled_at", "highest_education_level", "employment_area")

# Loop through each data frame, ensure columns, and combine into a list
cleaned_data_list <- lapply(data_frame_names_leaving_survey_responses, function(name) {
    df <- get(name)  # Access each data frame by name
    ensure_columns(df, required_columns)
})

ensure_columns <- function(df, required_cols) {
    missing_cols <- setdiff(required_cols, names(df))
    df[missing_cols] <- NA  # Add missing columns with NA values if missing
    return(df)
}
# Combine all data frames in the list into one data frame
combined_cleaned_data <- bind_rows(cleaned_data_list)

# Summarize the combined data to identify duplicate counts
duplicate_counts <- combined_cleaned_data %>%
    group_by(learner_id) %>%
    summarise(
        count = n(),  # Count all records per learner_id
    ) %>%
    filter(count > 1) %>%  # Keep only learner_ids with more than one record
    ungroup()

ProjectTemplate::cache("duplicate_counts", duplicate_counts)

data_frame_names <- c(
    "cyber.security.3_video.stats",
    "cyber.security.4_video.stats",
    "cyber.security.5_video.stats",
    "cyber.security.6_video.stats",
    "cyber.security.7_video.stats"
)

# Loop through each data frame, select the 'video_duration' column, and update the original data frame
for (name in data_frame_names) {
    # Access each data frame by name, select the 'video_duration' column, and reassign it
    df <- get(name) %>% select(video_duration)
    assign(name, df)  # Overwrite the original data frame with the modified version
}
