# === BOILERPLATE =============================================================
#
#  Two Point Oh System Data Benchmarking R Script
#  Matthew Chenoweth
#  2016/10/26
#
#  Given expected input from EBS and PMFleet systems, compute the following: 1)
# Cost Per Unit, 2) Cost Per Hour, 3) Total Expense, and 4) Utilization
#  Incidentally, Utilize Git to track this project locally, and (hopefully) use
# Github to publish code. We'll see. The URL _should_ be as follows:
# https://github.com/mattcheno/TPOSbenchmarking.git


# --- Outline -----------------------------------------------------------------
# 1. Declarations
# 2. Import PMF R.Data (see pmfTabScrubber.r)
# 3. Import EBS Data, scrub (remember lubridate for date arithmatic)
# 4. Join Data Sets
# 5. Apply Key File
# 6. Save Data Set

# --- Declarations ------------------------------------------------------------

start_time <- Sys.time()
working_dir <- getwd()     # Working Directory
data_dir <- paste(working_dir, "data", sep = "/") # Directory for input data
pmf_r_file <- paste(data_dir,"pmfData.rds", sep = "/") # R data file for PMF
ebs_csv <- paste(data_dir,"ebsCSVData.csv", sep = "/") # EBS Output file
     # Column Labels in case Header = False
ebs_col_names <- c(
  "Branch", 
  "WorkOrder", 
  "Segment", 
  "OrderType", 
  "Mfg", 
  "Model", 
  "SerialNumber", 
  "WieseID", 
  "Meter", 
  "Labor", 
  "Parts", 
  "Misc", 
  "Total", 
  "OrderDate", 
  "EquipYear", 
  "Class", 
  "Subclass"
)
     # Column Class Overrides
ebs_col_class <- c(
  NA,     #Branch 
  NA,     #WorkOrder 
  NA,     #Segment
  NA,     #OrderType
  NA,     #Mfg
  NA,     #Model
  NA,     #SerialNumber
  NA,     #WieseID
  NA,     #Meter
  NA,     #Labor
  NA,     #Parts
  NA,     #Misc
  NA,     #Total
  "character",     #OrderDate
  NA,     #EquipYear
  NA,     #Class
  NA     #Subclass
)
     # List of strings to convert to NAs
ebs_NAs <- c("", "NA", "UNK")

# --- Import Data -------------------------------------------------------------
# Temporarily Commented out-> pmf_data01 <- readRDS(file = pmf_r_file)

ebs_data01 <- read.delim(
  file = ebs_csv,
  header = TRUE,
  sep = ",", quote = "\"", dec = ".",
  #col.names = pmf_Col_Names,     # Column Names if header = TRUE
  colClasses = ebs_col_class,
  na.strings = ebs_NAs
)

##CURSOR
finish_time <- Sys.time()
print(finish_time - start_time)

# === FOOTNOTES ===============================================================
# === END OF CODE =============================================================