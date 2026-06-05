# T01 — GUI & Usability Testing Seminar

> CS423 / CSC15003 — Software Testing · 2026 AI-First Edition
> FIT @ HCMUS · Department of Software Engineering
> Lecturer: **Dr. Lâm Quang Vũ** (lqvu@fit.hcmus.edu.vn)

This repo holds all team deliverables for the **T01 — GUI & Usability Testing** seminar.
Our SUT is the **EShop checkout journey**: cart, coupon, address, payment.

---

## 1. Tool Pair Under Study

The Seminar Track requires one traditional tool + one AI tool in every live demo. After comparing the candidates in our [Tool Survey Proposal](docs/01_Tool_Survey_Proposal.md), we picked:

| Role | Tool | Why we picked it |
|---|---|---|
| **Traditional** | **Maze** | Builds task-based studies (cart, coupon, payment) and shows click-paths + heatmaps. Free tier fits a 5-tester study. |
| **AI-augmented** | **Claude (vision)** | We upload EShop screenshots and ask for a Nielsen-10 review. Then we audit each finding — that audit is the point, not the AI output. |
| Backup | Hotjar | Session recordings + heatmaps. Held in reserve in case Maze's monthly study slot is burnt. |

> The picks above are draft. Final selection needs Stage S2 approval from the instructor — see [Scope Note](docs/02_Scope_Note.md).

---

## 2. Repository Map

```
.
├── README.md                          ← you are here
├── docs/
│   ├── 01_Tool_Survey_Proposal.md     ← Stage S1 deliverable (≤ 1 page)
│   ├── 02_Scope_Note.md               ← input for Stage S2 instructor review
│   ├── 03_User_Guide.md               ← Stage S4 deliverable skeleton (7 sections)
│   ├── 04_Activity_Worksheet.md       ← Stage S5 deliverable (Heuristic Showdown)
│   └── 05_Seminar_Slides_Outline.md   ← Stage S6 deliverable outline (≤ 15 slides)
├── assets/
│   └── diagrams/
│       ├── workflow_s1_s8.mmd         ← Mermaid: full seminar workflow
│       └── checkout_flow.mmd          ← Mermaid: EShop checkout SUT
├── ai-disclosure/
│   └── AI_Usage_Log.md                ← running AI assistance log
└── releases/
    └── v0.1.0-draft.md                ← release notes for the draft review session
```

---

## 3. Stage Status

| Stage | Status | Deliverable |
|---|---|---|
| S1 — Tool survey & proposal | **DRAFT** | [`docs/01_Tool_Survey_Proposal.md`](docs/01_Tool_Survey_Proposal.md) |
| S2 — Instructor review | PENDING (draft feedback session: 2026-06-06) | [`docs/02_Scope_Note.md`](docs/02_Scope_Note.md) |
| S3 — Deep study + EShop hands-on | NOT STARTED | — |
| S4 — User guide + screencast | **SKELETON** | [`docs/03_User_Guide.md`](docs/03_User_Guide.md) |
| S5 — Pre-share | NOT STARTED | [`docs/04_Activity_Worksheet.md`](docs/04_Activity_Worksheet.md) |
| S6 — Live seminar (45 min) | NOT STARTED | [`docs/05_Seminar_Slides_Outline.md`](docs/05_Seminar_Slides_Outline.md) |
| S7 — Audience feedback | NOT STARTED | — |
| S8 — AI Audit + Reflection | NOT STARTED | — |

---

## 4. Submission Format (per Lecturer's Technical Requirements)

- **Format**: Written in Markdown.
- **Diagrams**: Created using Mermaid (where applicable) — see [`assets/diagrams/`](assets/diagrams/).
- **Videos**: Uploaded to YouTube; links recorded inside each deliverable.
- **Project Management**: Managed and tracked through GitHub commit logs.
- **Submissions**: Each deadline's work documented and submitted via **GitHub Releases**.

---

## 5. Team

| Role | Member | GitHub |
|---|---|---|
| **C** — **Team leader** · Claude-vision demoer (AI tool) · audience activity facilitator | **Nguyễn Bình An** | _add username_ |
| **A** — Presenter · Tool Survey Proposal owner · AI disclosure custodian | Phạm Ngọc Gia Bảo | _add username_ |
| **B** — Maze demoer (traditional tool) · Installation & First-Test docs | Lee Kun Da | _add username_ |
| **D** — Timekeeper · Failure-Modes researcher · Slides outline owner | Lưu Ngô Quốc Bảo | _add username_ |

> GitHub usernames to be added once the repo is initialized and all members are added as collaborators.
> Decisions are made jointly; the team leader has the casting vote when consensus is not reached.

---

## 6. AI Disclosure

All AI assistance used to produce this repository is logged in [`ai-disclosure/AI_Usage_Log.md`](ai-disclosure/AI_Usage_Log.md).
Per AI Policy §7 of the Seminar Guide, every AI-generated artefact has been reviewed and edited by a human before commit.

---

## 7. References

- [`materials/Seminar_Guide.docx.pdf`](materials/Seminar_Guide.docx.pdf) — 8-stage workflow + rubric
- [`materials/Seminar_Workflow_Briefing.pptx.pdf`](materials/Seminar_Workflow_Briefing.pptx.pdf) — slide briefing + prompt templates
- [`materials/T01_GUI_and_Usability_Testing.docx`](materials/T01_GUI_and_Usability_Testing.docx) — topic brief
