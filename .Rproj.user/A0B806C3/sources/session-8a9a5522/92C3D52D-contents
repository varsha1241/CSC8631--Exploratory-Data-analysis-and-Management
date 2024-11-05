file_paths <- c(
    "~/Desktop/courseWorkCS8631/data/rawData/cyber-security-1_enrolments.csv",
    "~/Desktop/courseWorkCS8631/data/rawData/cyber-security-2_enrolments.csv",
    "~/Desktop/courseWorkCS8631/data/rawData/cyber-security-3_enrolments.csv",
    "~/Desktop/courseWorkCS8631/data/rawData/cyber-security-4_enrolments.csv",
    "~/Desktop/courseWorkCS8631/data/rawData/cyber-security-5_enrolments.csv",
    "~/Desktop/courseWorkCS8631/data/rawData/cyber-security-6_enrolments.csv",
    "~/Desktop/courseWorkCS8631/data/rawData/cyber-security-7_enrolments.csv"
)

cleaned_file_paths <- c(
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_1.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_2.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_3.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_4.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_5.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_6.csv",
    "~/Desktop/courseWorkCS8631/data/preProcessedData/cleaned_cyber_security_7.csv"
)

output_dir <- "~/Desktop/courseWorkCS8631/data/preProcessedData"
if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
}

for (i in seq_along(file_paths)) {
    cleaned_data <- read.csv(file_paths[i]) %>%
        select(learner_id, enrolled_at, unenrolled_at, highest_education_level, employment_area) %>%
        filter(!is.na(learner_id)) %>%
        mutate(unenrolled_at = ifelse(unenrolled_at == "", "unknown", unenrolled_at))
    write.csv(cleaned_data, cleaned_file_paths[i], row.names = FALSE)
}

cleaned_data_list <- lapply(cleaned_file_paths, read.csv)
combined_cleaned_data <- bind_rows(cleaned_data_list)
duplicate_counts <- combined_cleaned_data %>%
    group_by(learner_id) %>%        # Group by learner_id
    summarise(
        count = n_distinct(enrolled_at, unenrolled_at, highest_education_level, employment_area),  # Use n_distinct to count unique files
        unique_enrolled_at = unique(enrolled_at) %>% paste(collapse = ", "),
        unique_unenrolled_at = unique(unenrolled_at) %>% paste(collapse = ", "),
    ) %>%  # Count unique occurrences
    filter(count > 1) %>%            # Keep only duplicates
    ungroup()
write.csv(duplicate_counts, "~/Desktop/courseWorkCS8631/data/preProcessedData/duplicate_counts.csv", row.names = FALSE)


