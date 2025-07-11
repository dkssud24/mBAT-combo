# 경로 정의
REF=/BiO/hae/000006_ref_1000G/ref  # 1000G reference prefix
#GENEFILE=all_protein_coding_genes.bed

# 결과 저장 디렉토리 준비
mkdir -p LD_matrix

cat all_protein_coding_genes.noprefix.bed | while read chr start end strand geneid genename
do
    region_out="LD_matrix/${genename}_${chr}_${start}_${end}"
    plink --bfile $REF \
          --chr $chr \
          --from-bp $start --to-bp $end \
          --make-bed --out ${region_out}
    plink --bfile ${region_out} --r square --out ${region_out}
    rm ${region_out}.bed ${region_out}.fam
done
