# List of data frame names
data_frame_names <- c(
    "cyber.security.1_enrolments",
    "cyber.security.2_enrolments",
    "cyber.security.3_enrolments",
    "cyber.security.4_enrolments",
    "cyber.security.5_enrolments",
    "cyber.security.6_enrolments",
    "cyber.security.7_enrolments"
)

# Use lapply to access each data frame by its name and combine them into one
combined_enrolment_data <- bind_rows(lapply(data_frame_names, function(name) {
    get(name)  # Access the data frame by name
}))

# List of data frame names
data_frame_names_leaving_survey_responses <- c(
    "cyber.security.4_leaving.survey.responses",
    "cyber.security.5_leaving.survey.responses",
    "cyber.security.6_leaving.survey.responses",
    "cyber.security.7_leaving.survey.responses"
)

# Use lapply to access each data frame by its name and combine them into one
combined_leaving_survey_data <- bind_rows(lapply(data_frame_names_leaving_survey_responses, function(name) {
    get(name)  # Access the data frame by name
}))

# List of data frame names
data_frame_names_video_stats <- c(
    "cyber.security.3_video.stats",
    "cyber.security.4_video.stats",
    "cyber.security.5_video.stats",
    "cyber.security.6_video.stats",
    "cyber.security.7_video.stats"
)

# Use lapply to access each data frame by its name and combine them into one
combined_data_video_stats <- bind_rows(lapply(data_frame_names_video_stats, function(name) {
    get(name)  # Access the data frame by name
}))


