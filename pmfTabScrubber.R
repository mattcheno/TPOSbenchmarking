# === BOILERPLATE =============================================================
#
#  Data Scrubber for Raw PMF Input
#  Matthew Chenoweth
#  2016/10/26
#
#  TPOS benchmarking depends on data from PMF, which will eventually be static.
# Eventually the entirety of PMF data will be scrubbed and stored (at least) in
# an R data file. This script is for the mean-time, in which data from PMF will
# need to be scrubbed


# --- Outline -----------------------------------------------------------------
# 1. Declarations
# 2. Import PMF Tab data into data frame

# --- Declarations ------------------------------------------------------------

working_dir <- getwd()     # Working Directory
data_dir <- paste(working_dir, "data", sep = "/") # Directory for input data
pmf_data_file <- paste(data_dir,"pmfTabData.txt", sep = "/") # PMF Data File
  # Column Labels in case Header = False
pmf_Col_Names <- c(
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
  "factor",     #UnitID
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

# --- Import Data -------------------------------------------------------------
pmf_data01 <- read.delim(     # See Note 001
  file = pmf_data_file,
  header = FALSE,     # first row is NOT header names
  sep = "\t",     # tab-delineated
  col.names = pmf_Col_Names,     # Column Names since header = False
  colClasses = pmf_Col_Class,     # column class overrides
  fileEncoding = "UTF-8-BOM"     # See Note 002
)


##CURSOR

# === FOOTNOTES ===============================================================
#     Note 001
# This is read.delim instead of read.table because I kept getting a crazy error
# when sourcing this code. See the reference for better description and 
# solution
# Reference - http://stackoverflow.com/q/26086389
#     Note 002
# Using the UTF-8-BOM file encoding gets rid of a funky "ï»¿" I was getting 
# prepended to the first observation. 
# Reference - http://stackoverflow.com/q/24568056
# 
# === END OF CODE =============================================================