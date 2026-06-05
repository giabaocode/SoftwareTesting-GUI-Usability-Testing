# AI Usage Log — T01 GUI & Usability Testing Seminar

> **Custodian**: Phạm Ngọc Gia Bảo
> **Append-only**: every team member must add an entry **before** committing any AI-assisted artefact.
> **Why this file exists**: Seminar Guide §7 *AI Policy* + Workflow_Briefing slide 10 pitfall #1 — *"Copy-pasting AI output unedited"* triggers an auto-penalty. This log proves the human-review step happened.

---

## Entry template (copy this block for every new entry)

```
### YYYY-MM-DD · <member> · <artefact>
- **AI tool**: <name + version, e.g., Claude Opus 4.7, ChatGPT 5, GitHub Copilot>
- **Purpose**: <one sentence — what you wanted the AI to help with>
- **Prompt summary**: <≤ 3 sentences; do NOT paste secrets, PII, or course-secret content>
- **Output used**: <which file(s) + which section(s); e.g., "docs/03_User_Guide.md §6.2">
- **What I cross-checked**: <official docs / GH issue / paper URL + claim verified>
- **What I edited before commit**: <the diff between AI output and final commit — in words>
- **Confidence after review**: high / medium / low
- **Commit hash (fill in after commit)**: <git short-SHA>
```

---

## Running entries

### 2026-06-05 · A (Phạm Ngọc Gia Bảo) · scaffold + S1 Tool Survey Proposal
- **AI tool**: Claude Opus 4.7
- **Purpose**: Draft the repo scaffold, README, and the 1-page Tool Survey Proposal with comparison matrix.
- **Prompt summary**: Provided the three course PDFs/docx (Seminar_Guide, Workflow_Briefing, T01 brief) as context. Asked for a stage diagnosis, a recommended traditional + AI tool pair for the EShop checkout SUT with rationale, and a writing plan structured around the 8 GitHub commits we plan to make tonight.
- **Output used**:
  - `README.md`
  - `docs/01_Tool_Survey_Proposal.md` (sections 1–7)
  - `docs/02_Scope_Note.md` (skeleton)
  - `docs/03_User_Guide.md` (skeleton across 7 sections)
  - `docs/04_Activity_Worksheet.md` (skeleton)
  - `docs/05_Seminar_Slides_Outline.md` (skeleton)
  - `assets/diagrams/workflow_s1_s8.mmd`, `assets/diagrams/checkout_flow.mmd`
- **What I cross-checked**:
  - **Pricing for all 5 candidate tools** (Maze, Claude, Hotjar, BrowserStack, UXTweak) → **screenshotted directly** from each vendor's live pricing page on 2026-06-05. Screenshots archived under `ai-disclosure/screenshots/pricing/`. **Material corrections** were applied to the Proposal — see §2 and §3 of [`docs/01_Tool_Survey_Proposal.md`](../docs/01_Tool_Survey_Proposal.md). Specifically:
    - **Maze**: AI initially stated "≤ 3 missions, ≤ 5 testers per mission". **Corrected** to "1 study/month + 5 seats". This is now the dominant risk for the seminar (see Proposal §5).
    - **Hotjar**: AI initially stated "Free Basic ≤ 35 sessions/day". **Corrected** to "Free forever, 200 000 sessions/month, 1 project, replays + heatmaps + funnels included".
    - **BrowserStack**: AI initially stated "Live plan from US$29/mo". **Corrected** to "No permanent free tier; from US$150/mo (US$30/user × 5-user minimum)".
    - **UXTweak**: AI initially stated "Free ≤ 3 studies/mo". **Corrected** to "Free: 15 responses/mo, 1 concurrent study, 14-day result access; Business €92/mo".
    - **Claude**: AI initially stated "Pro US$20/mo". **Corrected** to "Pro US$17/mo annual (US$20 monthly); Max from US$100/mo".
  - Nielsen's 10 heuristic names → verified against `nngroup.com/articles/ten-usability-heuristics/`.
  - Topic T01 tool suggestions → verified against `materials/T01_GUI_and_Usability_Testing.docx` tables 1 and 3.
  - Workflow 8 stages + rubric weights → verified against `materials/Seminar_Guide.docx.pdf` §2 and §6.
- **What I edited before commit**:
  - Replaced **every pricing figure** in the Proposal with the screenshot-verified number (above). This is the largest single human edit in this draft.
  - Re-rated the Licence-cost row in the Comparison Matrix (§3) to reflect the corrected pricing — Maze dropped from ★★★★☆ to ★★★☆☆ (1 study/mo is restrictive); Hotjar went up to ★★★★★ (free forever); BrowserStack dropped to ★☆☆☆☆ (no permanent free tier).
  - Renamed "mission" → "study" throughout (Maze pricing page uses "study"; product UI uses "maze" but for cross-team readability we use "study" in docs).
  - Removed AI's suggestion to include BrowserStack as the AI-augmented tool (no AI feature aligned with usability heuristics).
  - Tightened the 3-bullet rationale in Proposal §4 to anchor explicitly on T01 §6 Milestone M1 and §7 in-class activity, to reduce RECLAIM risk.
  - Replaced AI's generic "expand later" placeholders with `<!-- TODO @member-X: ... -->` tags so individual members can claim and commit their portions.
- **Confidence after review**: high on pricing (screenshot-verified); medium on tool-feature claims (still requires hands-on verification during Stage S3 — particularly Maze's "1 study/month" limit applied to a study with 5 tasks).
- **Commit hash**: _fill in after commit_

---

### 2026-MM-DD · B (Lee Kun Da) · User_Guide §2 Installation
<!-- TEMPLATE — copy and fill in before Stage S3 milestone M1 -->

---

### 2026-MM-DD · C (Nguyễn Bình An) · User_Guide §4 Advanced Usage + Activity Worksheet pilot
<!-- TEMPLATE — copy and fill in before Stage S5 -->

---

### 2026-MM-DD · D (Lưu Ngô Quốc Bảo) · User_Guide §6 Failure Modes
<!-- TEMPLATE — copy and fill in before Stage S5. Cite a primary source for each failure mode — no inventions. -->

---

## Hard rules (re-stated from Seminar Guide §7)

1. **No copy-paste**. Every AI output must be edited by a human before commit. Direct paste = academic violation.
2. **Cite the original source, not the AI**. If Claude tells you Maze costs $99/mo, cite `maze.co/pricing`, not Claude.
3. **No secrets in prompts**. Never paste student IDs, EShop staging credentials, or course-secret content.
4. **No fabrication**. Do not use AI to generate audience feedback, attendance, or fake citations.
5. **One entry per artefact**. Each commit that contains AI-assisted content must reference an entry here.
