library(dplyr)
library(tidyr)

# =========================================================================
# 1. CORE DATA PIPELINE INGESTION (004 & 005)
# =========================================================================
# Full Bloom Data Ingestion
bloom_raw <- read.csv("005.csv", header = FALSE, fileEncoding = "CP932", stringsAsFactors = FALSE, na.strings = c("", "NA"))
b_years   <- as.numeric(as.character(bloom_raw[2, grep("^19|^20", as.character(bloom_raw[2, ]))]))
b_idx     <- grep("^19|^20", as.character(bloom_raw[2, ]))

b_list <- list()
for (i in 3:nrow(bloom_raw)) {
  s_id <- as.character(bloom_raw[i, 1])
  if (!is.na(s_id) && grepl("^[0-9]+", s_id)) {
    for (y in 1:length(b_years)) {
      val <- trimws(as.character(bloom_raw[i, b_idx[y]]))
      if (!is.na(val) && val != "" && val != "0" && grepl("^[0-9]+", val)) {
        v <- as.numeric(val); m <- floor(v/100); d <- v%%100
        if (m >= 1 && m <= 12 && d >= 1 && d <= 31) {
          doy <- as.numeric(format(as.Date(paste(b_years[y], m, d, sep="-")), "%j"))
          b_list[[length(b_list)+1]] <- data.frame(Station_ID=s_id, Year=b_years[y], Bloom_DOY=doy, stringsAsFactors = FALSE)
        }
      }
    }
  }
}
df_bloom <- do.call(rbind, b_list)

# Initial Flowering Data Ingestion
flow_raw <- read.csv("004.csv", header = FALSE, fileEncoding = "CP932", stringsAsFactors = FALSE, na.strings = c("", "NA"))
f_years  <- as.numeric(as.character(flow_raw[2, grep("^19|^20", as.character(flow_raw[2, ]))]))
f_idx    <- grep("^19|^20", as.character(flow_raw[2, ]))

f_list <- list()
for (i in 3:nrow(flow_raw)) {
  s_id <- as.character(flow_raw[i, 1])
  if (!is.na(s_id) && grepl("^[0-9]+", s_id)) {
    for (y in 1:length(f_years)) {
      val <- trimws(as.character(flow_raw[i, f_idx[y]]))
      if (!is.na(val) && val != "" && val != "0" && grepl("^[0-9]+", val)) {
        v <- as.numeric(val); m <- floor(v/100); d <- v%%100
        if (m >= 1 && m <= 12 && d >= 1 && d <= 31) {
          doy <- as.numeric(format(as.Date(paste(f_years[y], m, d, sep="-")), "%j"))
          f_list[[length(f_list)+1]] <- data.frame(Station_ID=s_id, Year=f_years[y], Flow_DOY=doy, stringsAsFactors = FALSE)
        }
      }
    }
  }
}
df_flow <- do.call(rbind, f_list)

# Verify compilation size
cat("Full Bloom rows ingested:", nrow(df_bloom), "\n")
cat("Initial Flowering rows ingested:", nrow(df_flow), "\n")
