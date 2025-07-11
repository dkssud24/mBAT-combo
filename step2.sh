awk '{gsub(/^chr/,"",$1); print}' all_protein_coding_genes.bed > all_protein_coding_genes.noprefix.bed
