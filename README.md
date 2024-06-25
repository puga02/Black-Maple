# Black-Maple
Work flow for species delineation between black maple and sugar maple based on SNP dataset.

Leaves of sugar maples and black maples occuring in sympatry were sampled for DNA extraction with QIAGEN Plant Mini Kit. Genomic DNA was sequenced by Genotyping By Sequencing (GBS). Bioinformatic procedures led to a set a SNPs that served for characterising species delineation among these maples occuring in sympatry. 

# Description of files
ERN_script.txt sums up every command used to obtained the final SNP dataset (filtered, pruned and without replicates) from the raw data files (SRA BioProject : PRJNA1128145). One of this step corresponds to genotyping error rate calcultation (input: genotyping_error.txt). The last part of ERN_script.txt is additional informations for executing the structure_batch.sh script (STRUCTURE analysis). 
Black maple.Rmd is a Rmarkdown with all commands necessary to calculate genetic diversity statistics, excecute PCAs on SNPs and botanical data, summarizing STRUCTURE results and undertake Mantel test (see R_input folder for inputs for these commands). 
