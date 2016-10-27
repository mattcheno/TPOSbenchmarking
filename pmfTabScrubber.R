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
pmf_Col_Labels <- c(
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
  NA,     #UnitID
  NA,     #UnitType
  NA,     #Make
  NA,     #ModelCode
  NA,     #Year
  "character",     #ServiceDate
  NA,     #UnitAgeAtTimeOfExpense
  NA,     #serviceCategory
  "character",     #InvoiceDate
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
pmf_data01 <- read.table(
  file = pmf_data_file,
  header = TRUE,     # first row is header names
  sep = "\t",     # tab-delineated
  colClasses = pmf_Col_Class     # column class overrides
)

##CURSOR

# === FOOTNOTES ===============================================================
# === END OF CODE =============================================================