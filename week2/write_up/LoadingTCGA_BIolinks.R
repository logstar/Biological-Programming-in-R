## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_knit$set(progress = FALSE)

## ----message=FALSE, warning=FALSE, include=FALSE-------------------------
library(TCGAbiolinks)
library(SummarizedExperiment)
library(dplyr)
library(DT)

#get clinical data
clinicalov <- GDCquery_clinic(project = "TCGA-OV", type = "clinical")
write.csv(clinicalov, file="TCGA_OV_Clinical.csv")

clinicalcoad <- GDCquery_clinic(project = "TCGA-COAD", type = "clinical")
write.csv(clinicalcoad, file="TCGA_COAD_clinical.csv")

clinicalkirc <- GDCquery_clinic(project = "TCGA-KIRC", type = "clinical")
write.csv(clinicalcoad, file="TCGA_KIRC_clinical.csv")

clinicalhnsc <- GDCquery_clinic(project = "TCGA-HNSC", type = "clinical")
write.csv(clinicalhnsc, file="TCGA_HNSC_clinical.csv")


## ----results = 'hide', message=FALSE, warning=FALSE, eval = F------------
#  query <- GDCquery(project = "TCGA-GBM",
#                             data.category = "Gene expression",
#                             data.type = "Gene expression quantification",
#                             platform = "Illumina HiSeq",
#                             file.type  = "normalized_results",
#                             experimental.strategy = "RNA-Seq",
#                             barcode = c("TCGA-14-0736-02A-01R-2005-01", "TCGA-06-0211-02A-02R-2005-01"),
#                             legacy = TRUE)
#  GDCdownload(query, method = "api", files.per.chunk = 10)
#  data <- GDCprepare(query)

## ----message=FALSE, warning=FALSE, include=FALSE-------------------------
data <- gbm.exp.legacy

## ----message=FALSE, warning=FALSE----------------------------------------
# Gene expression aligned against hg19.
datatable(as.data.frame(colData(data)), 
          options = list(scrollX = TRUE, keys = TRUE, pageLength = 5), 
          rownames = FALSE)
# Only first 100 to make render faster
datatable(assay(data)[1:100,], 
          options = list(scrollX = TRUE, keys = TRUE, pageLength = 5), 
          rownames = TRUE)

rowRanges(data)

## ----results = 'hide', message=FALSE, warning=FALSE, eval=FALSE----------
#  # Gene expression aligned against hg38
query <- GDCquery(project = "TCGA-OV",
                    data.category = "Transcriptome Profiling",
                    data.type = "Gene Expression Quantification",
                    workflow.type = "HTSeq - FPKM-UQ",
                    barcode = c("TCGA-14-0736-02A-01R-2005-01", "TCGA-06-0211-02A-02R-2005-01"))
 GDCdownload(query)
  data <- GDCprepare(query)

## ----message=FALSE, warning=FALSE, include=FALSE-------------------------
data <- gbm.exp.harmonized

## ----message=FALSE, warning=FALSE----------------------------------------
datatable(as.data.frame(colData(data)), 
          options = list(scrollX = TRUE, keys = TRUE, pageLength = 5), 
          rownames = FALSE)

datatable(assay(data)[1:100,], 
          options = list(scrollX = TRUE, keys = TRUE, pageLength = 5), 
          rownames = TRUE)

rowRanges(data)

