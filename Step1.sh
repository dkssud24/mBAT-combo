# 모든 protein-coding gene만 뽑아서 chr, start, end, strand, gene_id, gene_name 정리
grep -w "gene" gencode.v19.annotation.gtf \
  | grep 'gene_type "protein_coding"' \
  | awk '{for(i=1;i<=NF;i++){if($i ~ /gene_id/) {gid=$(i+1)}; if($i ~ /gene_name/) {gname=$(i+1)}}; print $1, $4, $5, $7, gid, gname}' \
  | sed 's/"//g;s/;//g' > all_protein_coding_genes.bed
