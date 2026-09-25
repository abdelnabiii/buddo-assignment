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
Al_Mamun_Hasan_2017.pdf|https://pdfs.semanticscholar.org/00e3/8221ea5f3dcd3307c00e2e227693ed50de6d.pdf https://www.academia.edu/download/54105428/PPM_2017_01_Mamun.pdf http://digitalrepository.cipmlk.org/bitstream/handle/1/998/21.34%20Factors%20affecting%20employee%20turnover%20and%20sound%20retention%20strategies%20in%20business.pdf
Al-Suraihi_et_al_2021.pdf|https://www.academia.edu/download/110523087/488.pdf https://www.researchgate.net/profile/Ishaq-Ibrahim-13/publication/352390912_Employee_Turnover_Causes_Importance_and_Retention_Strategies/links/60c82eda458515dcee8f2854/Employee-Turnover-Causes-Importance-and-Retention-Strategies.pdf http://digitalrepository.cipmlk.org/bitstream/handle/1/979/21.12%20Employee%20Turnover%20Causes%2C%20Importance%20and.pdf
Boamah_et_al_2022.pdf|https://open.library.ubc.ca/media/download/pdf/52383/1.0406617/3 https://europepmc.org/articles/PMC8775585?pdf=render https://otl.uoguelph.ca/system/files/Work%20Life%20Balance%20and%20Burnout%20in%20Faculty%20.pdf
Chen_et_al_2024.pdf|https://link.springer.com/content/pdf/10.1186/s12960-024-00915-y.pdf
Chenevert_et_al_2021.pdf|https://link.springer.com/content/pdf/10.1186/s12913-021-06981-5.pdf
Demerouti_2024.pdf|https://link.springer.com/content/pdf/10.1007/s41449-024-00452-3.pdf
Demerouti_Adaloudis_2024.pdf|https://www.econstor.eu/bitstream/10419/302237/1/1899207201.pdf https://research.tue.nl/files/352430610/ssrn-4718143.pdf
Dominguez_et_al_2018.pdf|https://journals.plos.org/plosone/article/file?id=10.1371/journal.pone.0197276&type=printable
Green_Miller_Aarons_2013.pdf|https://europepmc.org/articles/PMC4209723?pdf=render https://www.academia.edu/download/112258187/pmc4209723.pdf
Le_Blanc_Schaufeli_2008.pdf|https://www.wilmarschaufeli.nl/publications/Schaufeli/319.pdf
Maricutoiu_Sava_Butta_2016.pdf|https://www.academia.edu/download/104551190/joop.1209920230727-1-ynnwxp.pdf
Ozkan_et_al_2020.pdf|https://avesis.anadolu.edu.tr/yayin/223c1083-3b52-472f-94c8-845c2c130d0d/antecedents-of-turnover-intention-a-meta-analysis-study-in-the-united-states/document.pdf
Samuel_Chipunza_2009.pdf|https://academicjournals.org/article/article1380550130_Samuel%20and%20Chipunza%20pdf.pdf
Shin_et_al_2020.pdf|https://repository.hanyang.ac.kr/bitstream/20.500.11754/168831/1/How%20Managers%27%20Job%20Crafting%20Reduces%20Turnover%20Intention%20The%20Mediating%20Roles%20of%20Role%20Ambiguity%20and%20Emotional%20Exhaustion.pdf https://pdfs.semanticscholar.org/37ee/5b86e4f3ef2dfe6c035486ba880ce9f94841.pdf https://europepmc.org/articles/PMC7312916?pdf=render
Tett_Meyer_1993.pdf|https://www.academia.edu/download/46180545/JOB_SATISFACTION_ORGANIZATIONAL_COMMITME20160602-21435-1ec9q9q.pdf
Timms_et_al_2015.pdf|https://openresearch-repository.anu.edu.au/bitstreams/e29e0426-fb05-4a14-87df-835c9ae14d82/download
Wang_Wang_2020.pdf|https://link.springer.com/content/pdf/10.1186/s11782-020-00074-6.pdf
West_et_al_2016.pdf|https://www.abmgg.org/wp-content/uploads/2026/04/Interventions-to-prevent-and-reduce-physician-burnout.pdf
Zambrano-Chumo_Guevara_2024.pdf|https://europepmc.org/articles/PMC10888532?pdf=render https://www.mdpi.com/1660-4601/21/2/185/pdf
EOF
