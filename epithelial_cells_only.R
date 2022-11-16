library(vroom)

# Load raw count expression matrix
matrix <-vroom("~/TFM/00.rawdata/GSE131907_Lung_Cancer_raw_UMI_matrix.txt")

# Load cell annotation
cell_annotation <- read.delim("~/TFM/00.rawdata/GSE131907_Lung_Cancer_cell_annotation.txt")

# Select normal epithelial cells
cell_keeps <- cell_annotation[cell_annotation$Cell_subtype %in% c("Malignant cells","AT1","AT2","Cilliated"),1]

# Filter normal epithelial cells expression
matrix_filtered <- matrix[,colnames(matrix) %in% c("Index",cell_keeps)]

# Export the matrix
write.table(matrix_filtered, file = "00.rawdata/matrix_filtered.txt",row.names = F,quote = F,sep = "\t")
