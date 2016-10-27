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
# 3. Import EBS Data, scrub
# 4. Join Data Sets
# 5. Apply Key File
# 6. Save Data Set

# --- Declarations ------------------------------------------------------------

working_dir <- getwd()     # Working Directory
data_dir <- paste(working_dir, "data", sep = "/") # Directory for input data
##CURSOR

# === FOOTNOTES ===============================================================
# === END OF CODE =============================================================