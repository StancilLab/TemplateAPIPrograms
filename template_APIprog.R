#!/usr/bin/env Rscript

#install these libraries
#feel free to add more
library("xlsx")
library("lubridate")
library("openxlsx2")
library(readxl)


#this is accessing the redcap API token
#CHANGEME: if you do not have access to the file, comment out the source line and replace "give_token()" with YOUR api token (in quotes)
token <- "redcap token goes here"


#gets today's date and time
pull_datetime <- today()

#this creates a small data frame with the time that this program was run
date_time <- now(tzone = "")
date_df <- data.frame(
    status = c("API Pulled"),
    date_time_pulled = c(date_time)
)



#CHANGEME: the file path should be changed to where you would like them saved
#You can create as many data files as you would like, or you can create one with dataframes on each sheet
fresh_data_file <- "C:\\Path\\To\\Where\\You\\Want\\Data\\Saved.xlsx"

#USING the redcap API R code, paste the URL here
url <- "URLHERE.edu"

api_pull <- function(report_num) {
        #if you have changed any settings on your report pull, update the lines here so they match the redcap playground
    formData <- list("token"=token,
        content='report',
        format='csv',
        #DONOTCHANGE the report num. Copy the number and paste into the code labeled * 
        report_id=report_num,
        csvDelimiter='',
        rawOrLabel='raw',
        rawOrLabelHeaders='raw',
        exportCheckboxLabel='false',
        returnFormat='json'
    )
    #These lines probably look different than the one in REDCap. This is okay, its saving it as a dataframe for future use. Do not change.
    response <- httr::POST(url, body = formData, encode = "form", show_col_types = FALSE)
    result <- httr::content(response, show_col_types = FALSE)
    result_df <- as.data.frame(result)
    result_df$Column1 <- seq.int(nrow(result_df))
    return(result_df)
}


# UPDATE: SAVE REPORT ID IN QUOTES BELOW*
#you can repeat this line to pull as many reports as you would like, make sure to change the "dataframe_name" for each report you pull
dataframe_name <- api_pull("*INSERT REPORT ID*")


#this writes and saves the NEW data to the file that power BI  pulls from
#Can be repeated with new dataframes for new files to be saved
#feel free to change "SheetName"
workbook_demos <- wb_workbook()
workbook_demos <- wb_add_worksheet(workbook_demos, sheet = "SheetName")
workbook_demos <- wb_add_worksheet(workbook_demos, sheet = "Data Refresh Time")
#UPDATE dataframe name with respective name
workbook_demos <- wb_add_data_table(workbook_demos, sheet = "RAW RedCap Screening Demographi", dataframe_name)
workbook_demos <- wb_add_data_table(workbook_demos, sheet = "Pull Info", date_df)
#UPDATE "fresh_data_file" with name of file you want data saved in
wb_save(workbook_demos, file = fresh_data_file, overwrite = TRUE)
