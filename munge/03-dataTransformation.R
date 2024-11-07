combined_data <- read.csv("~/Desktop/courseWorkCS8631/cache/finalData/combined_cleaned_cyber_security.csv")
combined_data <- combined_data %>%
    mutate(
        highest_education_level = ifelse(highest_education_level == "Unknown", NA, highest_education_level),
        employment_area = ifelse(employment_area == "Unknown", NA, employment_area)
    )
combined_data <- combined_data %>%
    mutate(employment_area = recode(employment_area,
                                    "accountancy_banking_and_finance" = "Finance",
                                    "armed_forces_and_emergency_services" = "Defense",
                                    "business_consulting_and_management" = "Consulting",
                                    "charities_and_voluntary_work" = "Charity",
                                    "creative_arts_and_culture" = "Arts",
                                    "energy_and_utilities" = "Energy",
                                    "engineering_and_manufacturing" = "Engineering",
                                    "environment_and_agriculture" = "Environment",
                                    "health_and_social_care" = "Healthcare",
                                    "hospitality_tourism_and_sport" = "Hospitality",
                                    "it_and_information_services" = "IT",
                                    "law" = "Law",
                                    "marketing_advertising_and_pr" = "Marketing",
                                    "media_and_publishing" = "Media",
                                    "property_and_construction" = "Construction",
                                    "public_sector" = "Public",
                                    "recruitment_and_pr" = "Recruitment",
                                    "retail_and_sales" = "Retail",
                                    "science_and_pharmaceuticals" = "Science",
                                    "teaching_and_education" = "Education",
                                    "transport_and_logistics" = "Logistics"
    ))
write.csv(combined_data, "~/Desktop/courseWorkCS8631/cache/finalData/combined_cleaned_cyber_security.csv", row.names = FALSE)

duplicates_data <- read.csv("~/Desktop/courseWorkCS8631/cache/preData/duplicate_counts.csv")
duplicates_data <- duplicates_data %>%
    separate(unique_enrolled_at, into = paste0("enrolled_at_", 1:7), sep = ", ", fill = "right") %>%
    mutate(across(starts_with("enrolled_at_"), ~ as.Date(sub(" UTC", "", .), format="%Y-%m-%d")))
duplicates_data <- duplicates_data %>%
    separate(unique_unenrolled_at, into = paste0("unenrolled_at_", 1:7), sep = ", ", fill = "right") %>%
    mutate(across(starts_with("unenrolled_at_"), ~ as.Date(sub(" UTC", "", .), format="%Y-%m-%d")))
write.csv(duplicates_data, "~/Desktop/courseWorkCS8631/cache/finalData/duplicate_counts_separated_dates.csv", row.names = FALSE)

duplicates_data_leaving_survey_responses <- read.csv("~/Desktop/courseWorkCS8631/cache/finalData/combined_cleaned_cyber_security_leaving_survey_responses.csv",fileEncoding = "UTF-8")
duplicates_data_leaving_survey_responses <- duplicates_data_leaving_survey_responses %>%
    mutate(left_at = format(as.Date(sub(" .*", "", left_at), format="%Y-%m-%d"), "%d-%m-%Y"))
write.csv(duplicates_data_leaving_survey_responses, "~/Desktop/courseWorkCS8631/cache/finalData/combined_cleaned_cyber_security_leaving_survey_responses.csv", row.names = FALSE)



# Add a new column 'cyber_security' with the specified values for each 13-row group
combined_cleaned_video_data$cyber_security <- rep(c("cyber security 3", "cyber security 4", "cyber security 5", "cyber security 6", "cyber security 7"), each = 13)
video_duration_summary <- combined_cleaned_video_data %>%
    group_by(cyber_security) %>%
    summarise(total_duration_hours = sum(video_duration))
# Save the updated data with the new column
write.csv(video_duration_summary, "~/Desktop/courseWorkCS8631/cache/finalData/combined_cleaned_video_cyber_security.csv", row.names = FALSE)


# Define paths for saving the data frames in the cache folder as .RData files
save_path_leaving_survey_responses <- "~/Desktop/courseWorkCS8631/cache/combined_cleaned_cyber_security_leaving_survey_responses.RData"
save_path_combined_data <- "~/Desktop/courseWorkCS8631/cache/combined_cleaned_cyber_security.RData"
save_path_duplicates <- "~/Desktop/courseWorkCS8631/cache/duplicate_counts.RData"
save_path_video_cyber_security <- "~/Desktop/courseWorkCS8631/cache/combined_cleaned_video_cyber_security.RData"

# Save each data frame as an .RData file in the specified cache directory
save(duplicates_data_leaving_survey_responses, file = save_path_leaving_survey_responses)
save(combined_data, file = save_path_combined_data)
save(duplicate_counts, file = save_path_duplicates)
save(video_duration_summary, file = save_path_video_cyber_security)

