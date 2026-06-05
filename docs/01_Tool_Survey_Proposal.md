# [S1] Tool Survey & Proposal — T01 GUI & Usability Testing

> **Stage**: S1 (Topic claim & tool survey)
> **Length target**: ≤ 1 page (Seminar Guide §2.1)
> **Submission**: Markdown file + GitHub Release `v0.1.0-draft`
> **Deadline for the full course track**: Week 6 Saturday 23:59 (this is a pre-deadline draft)

---

## 1. Topic

- **Code & name**: **T01 — GUI & Usability Testing**
- **System Under Test (SUT)**: EShop frontend, the checkout journey:
  *Search → Add to Cart → Apply Coupon → Address → Payment.*
- **Why this scope**: We picked checkout because it is where users actually drop off (lost revenue), it has 5 distinct UI states to evaluate, and we can still walk through all of it inside a 10-minute live demo.

---

## 2. Candidate Tools (≥ 3 required)

| # | Tool | Category | Licence / Cost (verified 2026-06-05) |
|---|---|---|---|
| C1 | **Maze** | Traditional — remote unmoderated usability testing | **Free**: 1 study/month, 5 seats, essential prototype testing + surveys. **Starter**: US$99/mo (same 1 study/mo limit but unlocks unmoderated toolkit, screen recording). **Enterprise**: custom. |
| C2 | **Claude (vision)** | AI-augmented — multimodal heuristic reviewer | **Free**: full web/desktop chat with vision, search, MCP. **Pro**: US$17/mo billed annually (US$20 monthly). **Max**: from US$100/mo (5×–20× usage of Pro). |
| C3 | **Hotjar** | Backup — session recording, heatmaps, surveys | **Free forever**: 200 000 monthly sessions, 1 project, replays + heatmaps + funnels + basic surveys. **Growth**: from US$39/mo. |
| C4 (alt) | BrowserStack Live | Alt traditional — cross-browser exploratory | **No permanent free tier.** Live Team: US$30/user/mo × 5-user minimum = **US$150/mo billed annually**. Team Ultimate (incl. AI agents): US$375/mo. |
| C5 (alt) | UXTweak AI | Alt AI-augmented — heatmap interpretation, report drafting | **Free**: 1 user, 15 responses/mo, 1 concurrent study, **14-day result access**. **Business**: €92/mo annual. |

---

## 3. Comparison Matrix (5 criteria per Seminar Guide §2.1)

Scale: ★☆☆☆☆ (poor) → ★★★★★ (excellent).

| Criterion | Maze | Claude (vision) | Hotjar | BrowserStack | UXTweak AI |
|---|---|---|---|---|---|
| **Licence cost** | ★★★☆☆ free tier 1 study/mo + 5 seats — just enough if we bundle 5 tasks into 1 study | ★★★★☆ free tier covers our planned ~10 vision reviews; Pro $17/mo is cheap insurance | ★★★★★ free forever, 200k sessions/mo — but only valuable if SUT is publicly deployed | ★☆☆☆☆ no permanent free tier; $150/mo minimum kills student budgets | ★★☆☆☆ free 15 responses/mo but only 14-day result retention |
| **Learning curve** | ★★★★☆ drag-and-drop study builder | ★★★★★ chat interface, no install | ★★★☆☆ requires JS tag install on SUT | ★★★☆☆ live VM session — needs scenario planning | ★★★☆☆ less documentation outside vendor docs |
| **EShop fit** | ★★★★★ task-based study matches Cart→Coupon→Pay perfectly | ★★★★★ checkout screens are static — ideal for screenshot review | ★★★☆☆ requires live deploy to capture real sessions (not available for our course SUT) | ★★★☆☆ great for cross-device but not for usability heuristics | ★★★☆☆ overlap with Maze without unique edge |
| **AI capability** | ★★☆☆☆ basic AI summary, full features locked behind Enterprise | ★★★★★ full multimodal vision, Nielsen-10 reasoning | ★★★☆☆ AI-clustered themes from feedback | ★★★☆☆ AI agents (test-case gen, proofreader) but in Team Ultimate only | ★★★★☆ AI heatmap interpretation in free tier |
| **Community** | ★★★★☆ active Discord, ~700 GH stars in unofficial plugins | ★★★★★ broad developer ecosystem, MCP integrations | ★★★★★ industry-standard analytics | ★★★★☆ enterprise-heavy community | ★★☆☆☆ small Eastern-EU community |

> Sources cross-checked: vendor pricing pages screenshotted on 2026-06-05 (saved under `ai-disclosure/screenshots/pricing/`):
> [maze.co/pricing](https://maze.co/pricing) · [claude.ai/pricing](https://claude.ai/pricing) · [hotjar.com/pricing](https://www.hotjar.com/pricing) · [browserstack.com/pricing](https://www.browserstack.com/pricing) · [uxtweak.com/pricing](https://www.uxtweak.com/pricing). Heuristic content cross-checked against NN/g 2024 article "Can AI replace usability testers?" (cited in T01 brief §5).

---

## 4. Recommended Pick + 3-Bullet Rationale

> **Pick**: **Maze (traditional) + Claude vision (AI-augmented)**.
> Backup retained: **Hotjar**.

1. **Matches what the T01 brief already asks for.** Milestone M1 in T01 §6 says *"Install Maze trial; build 3 EShop task flows"* and §4 lists *"ChatGPT / Claude vision"* as an example AI tool. The in-class activity in §7, *Heuristic Showdown — Human vs AI*, is also written for this exact pair. Picking it lowers our risk of a RECLAIM verdict at S2.
2. **Fits the EShop SUT and the time-box.** Maze runs task flows without needing a live production site, and Claude reviews static screenshots in seconds. Both have free tiers that cover our 4-week window. Each produces something we can put on a slide: a heatmap PNG from Maze, a heuristic report MD from Claude.
3. **Clean story for the Rule of Pairing.** Maze gives us numbers (task success, time-on-task). Claude gives us heuristic findings in words. The two outputs do not overlap, so a 10-minute demo can show both. They also meet at the human-vs-AI severity comparison that T01 §7 asks for.

---

## 5. Risks & Mitigations

| Risk | Likelihood | Mitigation |
|---|---|---|
| **Maze free-tier 1-study-per-month constraint** — we cannot launch a second study if the first goes wrong mid-month | Medium | Treat the EShop checkout as **one Maze study with 5 tasks** (one per screen S-01 → S-05) rather than 5 separate studies. Build & QA the study privately before sending the share link. |
| Claude vision rate-limited mid-demo | Medium | Pre-generate the AI heuristic report off-stage, replay it on slides; show one *live* fresh-screenshot review for authenticity. |
| EShop staging environment unavailable on demo day | Low | Maintain a local mock build + recorded screencast as backup (per Workflow_Briefing slide 7 *"have a backup recording ready"*). |
| Audience cannot finish activity in 25 min | Medium | Worksheet timeboxes printed; facilitator hard-stops at 0:18. See [Activity Worksheet](04_Activity_Worksheet.md). |
| Hotjar fallback unusable (needs live deploy we don't control) | Medium | If Maze study slot is burnt, fall back to **UXTweak AI free** for 15 responses — accepting the 14-day result-retention window. Avoid recommending BrowserStack/Hotjar as fallback for usability heuristics (poor fit). |

---

## 6. AI Disclosure (Stage S1 requirement)

| AI tool used | Purpose | What we cross-checked |
|---|---|---|
| Claude Opus 4.7 (web + IDE) | Drafted the comparison matrix and risk table; suggested the 3-bullet rationale structure. | All initial pricing claims were **screenshotted** on 2026-06-05 from each vendor's live pricing page and **corrected** by member A — the AI's initial pricing estimates were partially out of date (training cutoff Jan 2026). |
| Manual web verification | Replaced AI-provided figures with screenshot-verified figures for all 5 candidate tools. | Screenshots archived under `ai-disclosure/screenshots/pricing/` for audit. |

> No private student IDs, course-secret content, or EShop credentials were submitted to any AI tool. Every AI suggestion was reviewed and edited by a human team member before commit. The pricing corrections above are the most material edits made before publication.

---

## 7. Next Steps (post-instructor approval)

1. Lock the scope per [Scope Note](02_Scope_Note.md).
2. Move to Stage S3 — install Maze, run hello-world study, render first Claude vision review.
3. Begin populating Section 3 (First Test) of the [User Guide](03_User_Guide.md).

---

*Last updated: 2026-06-05 · Draft v0.1.0 · awaiting Stage S2 verdict*
