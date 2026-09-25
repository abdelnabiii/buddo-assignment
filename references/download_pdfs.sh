#!/usr/bin/env bash
# Downloads the free full-text PDFs for the outline references into this folder.
# Each line lists one or more links; the script tries them in order until one works.
# PDFs that are already here are skipped, so it is safe to run again.
set -u
cd "$(dirname "$0")"
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/124 Safari/537.36"
while IFS="|" read -r name urls; do
  [ -z "$name" ] && continue
  if [ -s "$name" ] && head -c 4 "$name" | grep -q "%PDF"; then echo "HAVE  $name"; continue; fi
  ok=0
  for url in $urls; do
    if curl -fsSL -A "$UA" --max-time 120 -o "$name" "$url" && head -c 4 "$name" | grep -q "%PDF"; then ok=1; break; fi
    rm -f "$name"
  done
  if [ $ok = 1 ]; then echo "OK    $name"; else echo "FAIL  $name  (open in a browser: ${urls%% *})"; fi
done <<'EOF'
Chen_et_al_2024.pdf|https://link.springer.com/content/pdf/10.1186/s12960-024-00915-y.pdf
Chenevert_et_al_2021.pdf|https://link.springer.com/content/pdf/10.1186/s12913-021-06981-5.pdf
Demerouti_2024.pdf|https://link.springer.com/content/pdf/10.1007/s41449-024-00452-3.pdf
Dominguez_et_al_2018.pdf|https://journals.plos.org/plosone/article/file?id=10.1371/journal.pone.0197276&type=printable
Le_Blanc_Schaufeli_2008.pdf|https://www.wilmarschaufeli.nl/publications/Schaufeli/319.pdf
Ozkan_et_al_2020.pdf|https://avesis.anadolu.edu.tr/yayin/223c1083-3b52-472f-94c8-845c2c130d0d/antecedents-of-turnover-intention-a-meta-analysis-study-in-the-united-states/document.pdf
Samuel_Chipunza_2009.pdf|https://academicjournals.org/article/article1380550130_Samuel%20and%20Chipunza%20pdf.pdf
Timms_et_al_2015.pdf|https://openresearch-repository.anu.edu.au/bitstreams/e29e0426-fb05-4a14-87df-835c9ae14d82/download
Wang_Wang_2020.pdf|https://link.springer.com/content/pdf/10.1186/s11782-020-00074-6.pdf
West_et_al_2016.pdf|https://www.abmgg.org/wp-content/uploads/2026/04/Interventions-to-prevent-and-reduce-physician-burnout.pdf
EOF
