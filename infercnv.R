setwd("/home/nfs1/bsvega/TFM/")
library(infercnv)

# Create infercnv object
## Remember thar the first element of the matrix has to be blank
infercnv_obj = CreateInfercnvObject(raw_counts_matrix="00.rawdata/GSE131907_Lung_Cancer_raw_UMI_matrix.txt",
                                    annotations_file="00.rawdata/cell_annotation_infercnv.txt",
                                    delim="\t",
                                    gene_order_file="00.rawdata/hg38_gencode_v27.txt",
                                    ref_group_names=c("AT1","AT2","Ciliated")) 

# Run de analysis
infercnv_obj = infercnv::run(infercnv_obj,
                             cutoff=0.1, # cutoff=1 works well for Smart-seq2, and cutoff=0.1 works well for 10x Genomics
                             out_dir="infer_cnv_jose/", 
                             cluster_by_groups=TRUE, 
                             denoise=TRUE,
                             HMM=TRUE)
