# [S4] User Guide — Maze + Claude Vision on EShop Checkout

> **Stage**: S4 (User-guide + demo recording)
> **Required sections**: 7 (per Workflow_Briefing slide 6, including the new **Failure Modes** section)
> **Length**: aim for 1500–2500 words once filled in
> **Format constraint**: Markdown only; screenshots stored under `assets/screenshots/`
>
> **Ownership** (skeleton phase; each member finalizes their portion before Stage S5):
> - §1 Introduction → **A** (Phạm Ngọc Gia Bảo)
> - §2 Installation → **B** (Lee Kun Da)
> - §3 First Test → **B** (Lee Kun Da)
> - §4 Advanced Usage → **C** (Nguyễn Bình An)
> - §5 Troubleshooting → **C** (Nguyễn Bình An)
> - §6 Failure Modes → **D** (Lưu Ngô Quốc Bảo)
> - §7 References → **D** (Lưu Ngô Quốc Bảo)

---

## 1. Introduction

### 1.1 Problem space
A functional test tells you the "Place Order" button works. It does not tell you if a user can find it, trust it, or recover after a mis-click. GUI & Usability testing fills that gap. The questions are simple: *was that easy? was that obvious? did the system speak the user's language?* Nielsen wrote them down in 1994 and they still work in 2026.

### 1.2 Who this guide is for
This guide is for fellow CS423 students who want to score the EShop checkout against Nielsen's 10 heuristics. We use Maze as the traditional tool and Claude vision as the AI tool. You do not need any prior usability-testing experience. You only need a browser and the ability to take a screenshot.

### 1.3 What you will be able to do after this guide
<!-- TODO @member-A: write 3 bullet outcomes that mirror T01 §2 Learning Objectives. Keep verbs concrete (run, score, audit). -->

### 1.4 When this approach FAILS
<!-- TODO @member-A: 2-3 sentences on when NOT to use this pair (e.g., highly dynamic SPAs that Maze cannot record cleanly; screenshots that contain PII that should not be uploaded to a third-party AI). -->

---

## 2. Installation

### 2.1 Prerequisites
| Requirement | Min version | Why |
|---|---|---|
| Modern browser | Chrome 120+ / Edge 120+ | Maze study editor requires it |
| Maze account | Free tier | Signup at maze.co |
| Claude account | Free tier (anthropic.com) OR `claude.ai` | For vision uploads |
| Screenshot tool | OS built-in (Snipping Tool / ⌘+Shift+4) | Capture EShop screens |
| EShop staging URL | Provided by course | See [`02_Scope_Note.md`](02_Scope_Note.md) §Q5 |

### 2.2 Step-by-step install — Maze
1. Open https://maze.co and click **Sign up free**.
2. Choose **Continue with email** (do NOT use the Google SSO option — see §5.2 Troubleshooting).
3. Verify email; you will land on the Maze dashboard.
4. Click **Create new maze** → **Start from scratch**.

<!-- TODO @member-B: insert screenshot at this point — assets/screenshots/maze_dashboard.png. Annotate the "Create new maze" button with a red box. -->

5. <!-- TODO @member-B: continue with 3-5 more steps until "first empty study is ready". Include exact command/click descriptions, not "navigate to the settings". -->

### 2.3 Step-by-step install — Claude vision
1. <!-- TODO @member-B: 5-7 steps from "open claude.ai" to "first image-prompt sent". Note rate-limit considerations on free tier. -->

### 2.4 OS-specific notes
<!-- TODO @member-B: 1 paragraph for each of Windows / macOS / Linux. Note: HCMUS lab machines run Windows 11. -->

---

## 3. First Test — End-to-end on EShop in ≤ 15 steps

> Per Workflow_Briefing slide 6: "End-to-end on EShop in ≤ 15 steps".

### 3.1 Scenario
A first-time EShop visitor wants to: **Search for "wireless headphones" → add the cheapest one to cart → apply coupon code `SAVE10` → check out as guest using cash-on-delivery.**

### 3.2 Maze study build (steps 1–8)
1. <!-- TODO @member-B: step-by-step for "Add task" → "Add screen" → ... → "Get share link". Number each step. -->
2. ...

### 3.3 Claude vision review (steps 9–12)
9. <!-- TODO @member-B: step-by-step for "screenshot the page" → "open Claude" → "paste prompt template" → "save report". -->
10. ...

### 3.4 Comparing the two outputs (steps 13–15)
13. <!-- TODO @member-B: how to align Maze's quantitative findings (e.g., 60% task success) with Claude's qualitative findings (e.g., "Match between system and real world: ✗"). -->

### 3.5 Expected output artefacts
After completing §3 you should have all four files saved under `assets/first-test-run/`:

- `maze_study_report.pdf`
- `maze_heatmap_screen-S03.png`
- `claude_heuristic_report.md`
- `comparison_table.md`

---

## 4. Advanced Usage

### 4.1 Maze — branching studys
<!-- TODO @member-C: explain conditional branching: how to send testers who FAIL S-02 down a different path than those who succeed. 1 short example. -->

### 4.2 Maze — parallel test sessions
<!-- TODO @member-C: how to send the same study to 5 testers in parallel and aggregate the results. -->

### 4.3 Claude vision — multi-image batch prompting
<!-- TODO @member-C: explain how to upload up to 5 screenshots in one prompt and request a single consolidated heuristic report. Include the exact prompt we will use — anchor on Workflow_Briefing slide 9 TEMPLATE 1. -->

### 4.4 Claude vision — auditing AI's own output with TEMPLATE 4
<!-- TODO @member-C: demonstrate using AI Prompt TEMPLATE 4 from Workflow_Briefing slide 9 to critique Claude's first-pass review. This is a key differentiator for the depth-of-study rubric criterion. -->

### 4.5 Custom severity rubric
Apply the T01 §2 four-point scale: cosmetic / minor / major / catastrophic.

<!-- TODO @member-C: provide a 1-paragraph anchor description per level, with 1 EShop-specific example each. -->

---

## 5. Troubleshooting (≥ 3 real errors + the fix)

> Per Workflow_Briefing slide 6: at least 3 real errors we have actually encountered, with the fix. Do not invent errors.

### 5.1 Error: Maze study link returns 404 after publish
**Symptom**: <!-- TODO @member-C: real symptom string -->
**Cause**: <!-- TODO @member-C -->
**Fix**: <!-- TODO @member-C -->

### 5.2 Error: Maze Google-SSO loop
**Symptom**: <!-- TODO @member-C: write what you actually observed -->
**Cause**: <!-- TODO @member-C -->
**Fix**: <!-- TODO @member-C -->

### 5.3 Error: Claude vision rejects screenshot with "image too large"
**Symptom**: claude.ai responds *"This image is too large to process"* and the screenshot is not analysed.
**Cause** (verified against [docs.anthropic.com/.../vision](https://docs.anthropic.com/en/docs/build-with-claude/vision) on 2026-06-05):
- **claude.ai and direct Claude API**: max **10 MB** per image (base64-encoded).
- **Amazon Bedrock / Vertex AI**: stricter — max **5 MB** per image.
- All endpoints: max **8000×8000 px**. If you send more than 20 images per API request, the dimension cap drops to **2000×2000 px**.
- Regardless of upload size, Claude internally resizes images to a "native resolution" before processing (1568 px on the long edge for most models; 2576 px for Opus 4.7 / 4.8). Uploading larger than that gains no fidelity — only adds latency and token cost.

**Fix**:
1. Compress the screenshot: `pngquant input.png --output out.png` (Linux/macOS) or paint.NET's *"Save As JPEG quality 85"* (Windows).
2. Or pre-resize to ~1600 px on the long edge — matches Claude's native resolution and minimises latency.
3. Verify final file size < 10 MB before upload.

### 5.4 (Optional bonus error) <!-- TODO @member-C: add a 4th if encountered during S3 -->

---

## 6. Failure Modes (≥ 3 ways the tool can mislead you)

> **DO NOT SKIP** — this is one of the top-6 auto-penalty pitfalls (Workflow_Briefing slide 10).
> Use AI Prompt TEMPLATE 2 (Workflow_Briefing slide 9) to brainstorm, then **verify each entry against official docs / GitHub issues / published papers**. Do not invent.

### 6.1 Failure mode: Maze success-rate over-confidence
- **Trigger**: 5 testers all complete a task in < 30s.
- **Symptom**: dashboard shows "100% success" → team concludes the screen is usable.
- **Why misleading**: <!-- TODO @member-D: explain selection bias — Maze testers are often UX-literate; real EShop customers are not. Cite the NN/g 2024 article. -->
- **Detection**: <!-- TODO @member-D -->
- **Mitigation**: <!-- TODO @member-D -->

### 6.2 Failure mode: Claude vision hallucinated UI elements
- **Trigger**: ask Claude to evaluate a screenshot where the *coupon field* is **absent**.
- **Symptom**: Claude returns a heuristic violation about "coupon field placement" that does not exist on the screen.
- **Why misleading**: <!-- TODO @member-D: explain that LLMs can pattern-match expected e-commerce layouts onto an actual screenshot. Cite a primary source (Anthropic blog or model card). -->
- **Detection**: <!-- TODO @member-D -->
- **Mitigation**: <!-- TODO @member-D -->

### 6.3 Failure mode: Severity miscalibration by AI
- **Trigger**: Claude rates "low text contrast" as **major** but rates "no error message on invalid coupon" as **minor**.
- **Symptom**: severity ordering does not match human expert ordering.
- **Why misleading**: T01 §7 explicitly warns *"Severity rating must be human-final; AI severity is often miscalibrated."*
- **Detection**: cross-reference each AI severity against the team's manual scoring; flag deltas > 1 level.
- **Mitigation**: <!-- TODO @member-D: write the team protocol — e.g., "AI severities are advisory only; the team lead casts the final vote in the weekly review." -->

### 6.4 (Bonus 4th mode) <!-- TODO @member-D: add a 4th if encountered. Maze recording stops at iframe boundary is a common one. -->

---

## 7. References

### 7.1 Primary sources
- Nielsen, J. (1994; rev. 2020). **10 Usability Heuristics for User Interface Design**. Nielsen Norman Group. https://www.nngroup.com/articles/ten-usability-heuristics/
- Krug, S. (2010). **Rocket Surgery Made Easy**. New Riders. (Chs. 1–3 on lightweight remote tests.)
- BS EN ISO 9241-11:2018 — *Ergonomics of human-system interaction — Part 11: Usability: Definitions and concepts.*
- NN/g (2024). *Can AI replace usability testers?* — cited per T01 brief §5.

### 7.2 Vendor documentation
- Maze docs: https://help.maze.co
- Claude API & vision: https://docs.anthropic.com
- <!-- TODO @member-D: add Hotjar docs (backup) + any community plugins you reference -->

### 7.3 Course materials
- [`materials/Seminar_Guide.docx.pdf`](../materials/Seminar_Guide.docx.pdf)
- [`materials/Seminar_Workflow_Briefing.pptx.pdf`](../materials/Seminar_Workflow_Briefing.pptx.pdf)
- [`materials/T01_GUI_and_Usability_Testing.docx`](../materials/T01_GUI_and_Usability_Testing.docx)

### 7.4 AI Disclosure
The skeleton of this guide was drafted with Claude Opus 4.7 on 2026-06-05. All factual claims in §6 (Failure Modes) **must be re-verified against the cited primary sources** before substudy — see [`ai-disclosure/AI_Usage_Log.md`](../ai-disclosure/AI_Usage_Log.md).

---

*Last updated: 2026-06-05 · Skeleton v0.1.0 · Distributed across members A/B/C/D — see ownership block above.*
