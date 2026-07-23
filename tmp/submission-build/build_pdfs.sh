#!/bin/zsh
set -euo pipefail

repo_root="/Users/kunda/Documents/SoftwareTesting-GUI-Usability-Testing"
build_root="$repo_root/tmp/submission-build"
html_root="$build_root/html"
chrome_bin="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

mkdir -p "$html_root"

render_markdown() {
  local md_path="$1"
  local html_path="$2"
  local css_path="$3"
  local toc_mode="$4"
  local md_dir="${md_path:h}"
  local md_name="${md_path:t}"

  if [[ "$toc_mode" == "toc" ]]; then
    (
      cd "$md_dir"
      pandoc "$md_name" \
        --from=markdown+raw_html+pipe_tables+task_lists+markdown_in_html_blocks \
        --to=html5 \
        --standalone \
        --section-divs \
        --toc \
        --toc-depth=2 \
        --embed-resources \
        --css "$css_path" \
        --output "$html_path"
    )
  else
    (
      cd "$md_dir"
      pandoc "$md_name" \
        --from=markdown+raw_html+pipe_tables+task_lists+markdown_in_html_blocks \
        --to=html5 \
        --standalone \
        --section-divs \
        --embed-resources \
        --css "$css_path" \
        --output "$html_path"
    )
  fi
}

print_pdf() {
  local html_path="$1"
  local pdf_path="$2"
  local profile_name="$3"
  if [[ -s "$pdf_path" ]]; then
    return 0
  fi
  rm -f "$pdf_path"
  set +e
  "$chrome_bin" \
    --headless \
    --disable-gpu \
    --disable-background-networking \
    --disable-component-update \
    --disable-sync \
    --no-first-run \
    --no-pdf-header-footer \
    --allow-file-access-from-files \
    --user-data-dir="$build_root/$profile_name-$$" \
    --print-to-pdf="$pdf_path" \
    "file://$html_path" &
  local chrome_pid=$!
  local wait_index
  for wait_index in {1..120}; do
    if [[ -s "$pdf_path" ]]; then
      break
    fi
    sleep 0.25
  done
  kill -TERM "$chrome_pid" 2>/dev/null
  wait "$chrome_pid" 2>/dev/null
  local chrome_status=$?
  set -e
  if [[ ! -s "$pdf_path" ]]; then
    echo "Chrome failed to create $pdf_path (exit $chrome_status)" >&2
    return 1
  fi
  return 0
}

render_markdown "$repo_root/submission/01_Seminar_Slides/Seminar_Slides.md" "$html_root/slides.html" "$build_root/slides.css" "no-toc"
print_pdf "$html_root/slides.html" "$repo_root/submission/01_Seminar_Slides/Seminar_Slides.pdf" "chrome-slides"

render_markdown "$repo_root/submission/02_Final_Report/Final_Report.md" "$html_root/report.html" "$build_root/report.css" "no-toc"
print_pdf "$html_root/report.html" "$repo_root/submission/02_Final_Report/Final_Report.pdf" "chrome-report"

render_markdown "$repo_root/submission/03_Project_Contribution/Project_Contribution_Statement.md" "$html_root/contribution.html" "$build_root/contribution.css" "no-toc"
print_pdf "$html_root/contribution.html" "$repo_root/submission/03_Project_Contribution/Project_Contribution_Statement.pdf" "chrome-contribution"

render_markdown "$repo_root/submission/04_AI_Audit/AI_02_AI_Audit_Report.md" "$html_root/ai02.html" "$build_root/report.css" "no-toc"
print_pdf "$html_root/ai02.html" "$repo_root/submission/04_AI_Audit/AI_02_AI_Audit_Report.pdf" "chrome-ai02"

for stem in \
  AI_03_Disclosure_Nguyen_Binh_An \
  AI_03_Disclosure_Pham_Ngoc_Gia_Bao \
  AI_03_Disclosure_Lee_Kun_Da \
  AI_03_Disclosure_Luu_Ngo_Quoc_Bao \
  AI_04_Reflective_Statement
do
  render_markdown "$repo_root/submission/04_AI_Audit/$stem.md" "$html_root/$stem.html" "$build_root/report.css" "no-toc"
  print_pdf "$html_root/$stem.html" "$repo_root/submission/04_AI_Audit/$stem.pdf" "chrome-$stem"
done

render_markdown "$repo_root/submission/05_Supplementary/Activity_Worksheet.md" "$html_root/activity.html" "$build_root/report.css" "no-toc"
print_pdf "$html_root/activity.html" "$repo_root/submission/05_Supplementary/Activity_Worksheet.pdf" "chrome-activity"
