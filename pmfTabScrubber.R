# === BOILERPLATE =============================================================
#
#  Data Scrubber for Raw PMF Input
#  Matthew Chenoweth
#  2016/10/26
#
#  TPOS benchmarking depends on data from PMF, which will eventually be static.
# Eventually the entirety of PMF data will be scrubbed and stored (at least) in
# an R data file. This script is for the mean-time.
#  Converts Tab delineated PMF Data into R data file.


# --- Declarations ------------------------------------------------------------

working_dir <- getwd()     # Working Directory
data_dir <- paste(working_dir, "data", sep = "/") # Directory for input data
pmf_data_file <- paste(data_dir,"pmfTabData.txt", sep = "/") # PMF Data File
out_file <- paste(data_dir,"pmfData.rds", sep = "/") # output R Data File
  # Column Labels in case Header = False
pmf_Col_Names <- c(
  "ClientName",
  "UnitID",
  "UnitType",
  "Make",
  "ModelCode",
  "Year",
  "ServiceDate",
  "UnitAgeAtTimeOfExpense",
  "ServiceCategory",
  "InvoiceDate",
  "PartsAmount",
  "LaborAmount",
  "MiscAmount",
  "TaxAmount",
  "FreightAmount",
  "CartageAmount",
  "SegmentTotal",
  "MeterValue"
)
  # Column Class Overrides for PMF Data
pmf_Col_Class <- c(
  NA,     #ClientName
  NA,     #UnitID
  NA,     #UnitType
  NA,     #Make
  NA,     #ModelCode
  NA,     #Year
  "Date",     #ServiceDate
  NA,     #UnitAgeAtTimeOfExpense
  NA,     #serviceCategory
  "Date",     #InvoiceDate
  NA,     #PartsAmount
  NA,     #LaborAmount
  NA,     #MiscAmount
  NA,     #TaxAmount
  NA,     #FreightAmount
  NA,     #CartageAmount
  NA,     #SegmentTotal
  "character"     #MeterValue
)


# --- if_Null Function --------------------------------------------------------
if_Null <- function(x) {
  ifelse(tolower(x) == "null", NA, as.numeric(x))
}

# --- Import Data -------------------------------------------------------------
pmf_data01 <- read.delim(     # See Note 001
  file = pmf_data_file,
  header = TRUE,     # first row IS header names
  sep = "\t",     # tab-delineated
  #col.names = pmf_Col_Names,     # Column Names if header = TRUE
  colClasses = pmf_Col_Class     # column class overrides
)
print("PMF Tab Data Imported")

# --- Scrub Imported Data -----------------------------------------------------
require(dplyr)
require(lubridate)     # REQUIRED for date arithmatic

pmf_data02 <- pmf_data01 %>%
  mutate(
    HourMeter = if_Null(t.MeterValue),
    YearAgeAtService = year(pmf_data01$ServiceDate) - pmf_data01$Year
  ) %>%
  select(-t.MeterValue)

# --- Save as R Data File -----------------------------------------------------
saveRDS(pmf_data02, file = out_file)
rm(list = ls())

# === FOOTNOTES ===============================================================
#     Note 001
# This is read.delim instead of read.table because I kept getting a crazy error
# when sourcing this code. See the reference for better description and 
# solution
# Reference - http://stackoverflow.com/q/26086389
#     Note 002
# This is now old news, but I'll keep the note in. Older versions of the data
# set had a funky "ï»¿" prepended to the first observation. I used the line
# [fileEncoding = "UTF-8-BOM"] to fix that, but then when I got the new data 
# with client names the issue fixed itself. Perhaps the new data having column
# headers was the trick?
# Reference - http://stackoverflow.com/q/24568056
# 
# === END OF CODE =============================================================