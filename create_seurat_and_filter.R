library(dplyr)
library(Seurat)
library(patchwork)
library(scSorter)
library(HGNChelper)
library(data.table)

lapply(c("dplyr","Seurat","HGNChelper","vroom"), library, character.only = T)

# Load raw count expression matrix
 matrix <-vroom("~/TFM/00.rawdata/GSE131907_Lung_Cancer_raw_UMI_matrix.txt")

# Load cell annotation
cell_annotation <- read.delim("~/TFM/00.rawdata/GSE131907_Lung_Cancer_cell_annotation.txt")

# Create seurat object
pbmc <- CreateSeuratObject(counts = matrix,meta.data =  cell_annotation, project = "pbmc3k", min.cells = 5, min.features = 200) # 

# Filter low quality cells and normalize data
pbmc <- subset(pbmc, subset = nFeature_RNA > 200 & nFeature_RNA < 2500 & percent.mt < 5)
pbmc <- NormalizeData(pbmc)

# Export R object
saveRDS(pbmc, file = "pbmc.rds")
