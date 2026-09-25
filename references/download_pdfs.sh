#!/usr/bin/env bash
# Downloads the free full-text PDFs for the outline references into this folder.
# Run from this directory: bash download_pdfs.sh
set -u
cd "$(dirname "$0")"
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/124 Safari/537.36"
while IFS="|" read -r name url; do
  [ -z "$name" ] && continue
  if curl -fsSL -A "$UA" --max-time 120 -o "$name" "$url" && head -c 4 "$name" | grep -q "%PDF"; then echo "OK    $name"; else rm -f "$name"; echo "FAIL  $name  ($url)"; fi
done <<'EOF'
Al_Mamun_Hasan_2017.pdf|http://digitalrepository.cipmlk.org/bitstream/handle/1/998/21.34%20Factors%20affecting%20employee%20turnover%20and%20sound%20retention%20strategies%20in%20business.pdf?sequence=1&isAllowed=y
Al-Suraihi_et_al_2021.pdf|http://digitalrepository.cipmlk.org/bitstream/handle/1/979/21.12%20Employee%20Turnover%20Causes%2C%20Importance%20and.pdf?sequence=1&isAllowed=y
Boamah_et_al_2022.pdf|https://www.mdpi.com/1660-4601/19/2/809/pdf
Chen_et_al_2024.pdf|https://link.springer.com/content/pdf/10.1186/s12960-024-00915-y.pdf
Chenevert_et_al_2021.pdf|https://link.springer.com/content/pdf/10.1186/s12913-021-06981-5.pdf
Demerouti_2024.pdf|https://link.springer.com/content/pdf/10.1007/s41449-024-00452-3.pdf
Demerouti_Adaloudis_2024.pdf|https://research.tue.nl/files/352430610/ssrn-4718143.pdf
Dominguez_et_al_2018.pdf|https://journals.plos.org/plosone/article/file?id=10.1371/journal.pone.0197276&type=printable
Green_Miller_Aarons_2013.pdf|https://pmc.ncbi.nlm.nih.gov/articles/PMC4209723/pdf/nihms636338.pdf
Le_Blanc_Schaufeli_2008.pdf|https://www.wilmarschaufeli.nl/publications/Schaufeli/319.pdf
Maricutoiu_Sava_Butta_2016.pdf|https://www.academia.edu/download/104551190/joop.1209920230727-1-ynnwxp.pdf
Ozkan_et_al_2020.pdf|https://avesis.anadolu.edu.tr/yayin/223c1083-3b52-472f-94c8-845c2c130d0d/antecedents-of-turnover-intention-a-meta-analysis-study-in-the-united-states/document.pdf
Samuel_Chipunza_2009.pdf|https://academicjournals.org/article/article1380550130_Samuel%20and%20Chipunza%20pdf.pdf
Shin_et_al_2020.pdf|https://www.mdpi.com/1660-4601/17/11/3972/pdf
Tett_Meyer_1993.pdf|https://www.academia.edu/download/46180545/JOB_SATISFACTION_ORGANIZATIONAL_COMMITME20160602-21435-1ec9q9q.pdf
Timms_et_al_2015.pdf|https://openresearch-repository.anu.edu.au/bitstreams/e29e0426-fb05-4a14-87df-835c9ae14d82/download
Wang_Wang_2020.pdf|https://link.springer.com/content/pdf/10.1186/s11782-020-00074-6.pdf
West_et_al_2016.pdf|https://www.abmgg.org/wp-content/uploads/2026/04/Interventions-to-prevent-and-reduce-physician-burnout.pdf
Zambrano-Chumo_Guevara_2024.pdf|https://www.mdpi.com/1660-4601/21/2/185/pdf
EOF
