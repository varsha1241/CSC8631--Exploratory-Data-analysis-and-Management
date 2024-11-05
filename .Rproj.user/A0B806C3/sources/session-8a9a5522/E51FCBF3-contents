combined_data <- read.csv("~/Desktop/courseWorkCS8631/data/finalData/combined_cleaned_cyber_security.csv")
combined_data <- combined_data %>%
    mutate(
        enrolled_at = parse_date_time(enrolled_at, orders = c("Ymd_HMS", "Ymd")) %>% as.Date(),
        unenrolled_at = parse_date_time(unenrolled_at, orders = c("Ymd_HMS", "Ymd")) %>% as.Date()
    )
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
duplicates_data <- duplicates_data %>% select(-unique_unenrolled_at)
write.csv(duplicates_data, "~/Desktop/courseWorkCS8631/data/finalData/duplicate_counts_separated_dates.csv", row.names = FALSE)
print(duplicates_data)