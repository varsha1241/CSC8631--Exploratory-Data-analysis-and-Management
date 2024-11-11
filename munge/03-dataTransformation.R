# Assuming combined_enrolment_data is already loaded and contains the relevant data
combined_enrolment_data <- combined_enrolment_data %>%
    mutate(
        employment_area = ifelse(employment_area == "Unknown", NA, employment_area)
    )

# Recode employment_area categories
combined_enrolment_data <- combined_enrolment_data %>%
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

# Now, combined_enrolment_data contains the modified data with the updated columns


combined_data_video_stats$cyber_security <- rep(c("cyber security 3", "cyber security 4", "cyber security 5", "cyber security 6", "cyber security 7"), each = 13)
# Summarize the video_duration by the 'cyber_security' group
video_duration_summary <- combined_data_video_stats %>%
    group_by(cyber_security) %>%
    summarise(total_duration_hours = sum(video_duration))

ProjectTemplate::cache("video_duration_summary", video_duration_summary)
ProjectTemplate::cache("combined_enrolment_data", combined_enrolment_data)
