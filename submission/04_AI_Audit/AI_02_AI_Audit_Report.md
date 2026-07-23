# [AI-02] AI Audit Report

## Section 1 - Group information

**Course:** CSC13003 - Software Testing  
**Class:** 23KTPM4  
**Group:** Group 03  
**Topic:** T01 - GUI & Usability Testing  
**Audit scope:** AI-assisted artifacts recorded in the repository up to 2026-07-23

| Student ID | Full name |
|---|---|
| 23127149 | Nguyễn Bình An |
| 23127027 | Phạm Ngọc Gia Bảo |
| 23127035 | Lee Kun Da |
| 23127327 | Lưu Ngô Quốc Bảo |

This report follows the five-section clarification in the course Q&A: group information, audit table, AI-accuracy summary, conclusion, and disclosure. The audit evaluates whether AI output was used as a reviewed aid rather than as an unquestioned source. Verdicts describe fitness for the seminar artifact; they are not benchmark measurements of the underlying AI model.

## Section 2 - Audit table

### A-01 - UI tool survey

**Owner:** 23127149 - Nguyễn Bình An  
**Prompt and tool:** Gemini; research and compare Manual UI Testing, BrowserStack, and Claude Vision.  
**Output examined:** Candidate descriptions and a five-criterion comparison.  
**Verdict:** **Accepted with edits.**

The structure matched the seminar brief and helped make unlike options comparable. However, pricing, device counts, and plan limits are volatile and should not be repeated as timeless facts. AI is also not an authoritative source.

**Human/student fix:** Retain the qualitative comparison, remove unnecessary exact pricing claims from the final report, and reference official documentation for current capabilities. Evidence: three Gemini screenshots under `submission/assets/ai-evidence/an_ui_survey_*.png`.

### A-02 - Usability tool survey

**Owner:** 23127035 - Lee Kun Da  
**Prompt and tool:** Gemini and Claude; summarize the session and support the Maze/Useberry comparison.  
**Output examined:** Summary text and candidate trade-offs.  
**Verdict:** **Accepted with edits.**

The summaries helped organize the team's research but do not prove that every product claim was cross-checked. The original proposal also makes free-plan claims that can change.

**Human/student fix:** Treat the output as research notes, preserve only claims needed for the decision, and verify current plan behavior in the actual account or official help center. Evidence: four screenshots under `submission/assets/ai-evidence/lee_*.png`.

### A-03 - UI deep study

**Owner:** 23127327 - Lưu Ngô Quốc Bảo  
**Prompt and tool:** Claude Opus 4 and Gemini in Antigravity; draft Manual UI Testing content and summarize work.  
**Output examined:** BrowserStack/Claude workflow, checklist, prompt examples, and troubleshooting.  
**Verdict:** **Partially accepted.**

The workflow and human-audit rule are useful. Some draft text assumes address and payment forms that the later EShop inspection says are not present in the current checkout page. This shows a typical AI failure: completing a generic e-commerce pattern instead of staying inside the observed SUT.

**Human/student fix:** The final report describes only the verified cart, coupon, amount, and confirmation states. It asks participants to notice whether an address-confirmation step exists instead of instructing them to fill a non-existent form.

### A-04 - Maze study skeleton

**Owner:** 23127027 - Phạm Ngọc Gia Bảo  
**Prompt and tool:** Codex (GPT-5); prepare a study draft without fabricating results when no public URL was available.  
**Output examined:** Task skeleton, evidence checklist, result placeholders, and warning against invented metrics.  
**Verdict:** **Accepted with edits.**

The output explicitly separated setup from results and recommended placeholders rather than fake numbers. That aligns with the course AI policy. The early draft used multiple open-question blocks and still required a real public/staging URL and pilot.

**Human/student fix:** The student created a Maze draft and captured it. A later guide simplified the study to one Free Explore scenario with follow-up questions. No response metric is claimed in the final report.

### A-05 - Maze User Guide

**Owner:** 23127027 - Phạm Ngọc Gia Bảo  
**Prompt and tool:** Codex (GPT-5); inspect course documents and the EShop SUT, then draft a reproducible Maze guide.  
**Output examined:** Setup commands, task scenarios, limitations, and AI-use appendix.  
**Verdict:** **Accepted with edits.**

The guide improved reproducibility and clearly warned against fake data. It still contained fields that required a real study run, and a temporary tunnel URL cannot be assumed to remain valid.

**Human/student fix:** The submission removes the temporary URL, keeps the reproducible method, labels the study screenshot as draft evidence, and lists exactly which participant claims are unsupported.

### A-06 - Manual UI User Guide

**Owner:** 23127327 - Lưu Ngô Quốc Bảo  
**Prompt and tool:** Gemini in Antigravity; combine deep-study notes with SUT configuration.  
**Output examined:** Seven-section guide with commands, matrix, prompts, checklists, and suggested screenshots.  
**Verdict:** **Partially accepted.**

The structure covers the required sections and emphasizes human verification. However, "suggested screenshot" placeholders are not evidence, and example defect rows could be mistaken for real findings. The document also describes UI elements that may not exist in the checked SUT.

**Human/student fix:** The final report deletes example defects as outcomes, uses only four real repository screenshots, and separates procedure, example schema, actual evidence, and evidence limitations.

### A-07 - Final submission assembly

**Owner:** Group 03  
**Prompt and tool:** Codex (GPT-5), 2026-07-23; read requirements and related repository materials, consolidate required Markdown/PDF documents, and avoid inventing missing academic evidence.  
**Output examined:** Submission structure, rewritten report, slides, audit documents, activity worksheet, PDF layout, and pre-submission checklist.  
**Verdict:** **Requires team review.**

AI can consolidate and format, but the named students remain responsible for correctness and authorship. The source repository lacks the YouTube URL, signatures, actual contribution hours, agreed percentages, and final Maze results. Those fields cannot be completed by AI.

**Human/student fix:** Every member must review the text, confirm section ownership, fill the video link and contribution data, sign their own disclosure, add any newer real evidence, and regenerate PDFs before Moodle upload.

## Section 3 - Summary of AI output accuracy

The audit contains seven representative entries:

- Four were **accepted with edits** because the structure or reasoning was useful but volatile facts, scope, or wording required human correction.
- Two were **partially accepted** because generic AI assumptions introduced content that exceeded the observed EShop interface or could be mistaken for evidence.
- One **requires team review** because it assembled the final submission but cannot supply personal signatures, truthful work hours, a real video link, or experimental results.

This distribution should not be interpreted as a statistical model-accuracy score. The artifacts differ in purpose, input quality, and review depth. A more meaningful observation is that AI performed best on structure, checklists, alternate wording, and risk identification. It was least reliable when a prompt left room to assume a conventional e-commerce flow, when product-plan facts could change, or when a polished example resembled a completed result.

The most important detected error pattern was **unsupported completion**: AI filled the conceptual gaps of a typical checkout by mentioning address and payment controls that were not established in the source evidence. A second pattern was **evidence ambiguity**: suggested screenshots, example defect rows, and result placeholders could be misread as completed work unless clearly labeled. A third pattern was **temporal fragility**: pricing, free-tier limits, available metrics, and temporary public URLs can become outdated.

Human review improved the artifacts by narrowing scope to observed states, replacing result-like examples with schemas, labeling the Maze screenshot as a draft, removing volatile exact claims from the final narrative, and adding an explicit list of unsupported conclusions.

## Section 4 - Conclusion

AI materially accelerated the seminar documentation, especially by organizing research notes, proposing repeatable procedures, and making risk controls visible. It did not remove the need for testing. The audit found that the strongest artifacts treated AI output as a hypothesis or draft and required evidence before acceptance. The weakest passages were those that sounded authoritative while relying on a generic mental model of checkout rather than the actual SUT.

The team's final standard is therefore:

1. Preserve the prompt, tool, date, input, output, reviewer, and evidence.
2. Verify current product facts using official documentation or the active account.
3. Reproduce UI claims on the named environment.
4. Use participant data only after an actual study.
5. Keep severity and final defect decisions human-owned.
6. State what the evidence cannot support.

## Section 5 - Disclosure

AI tools recorded in the project include Gemini, Claude/Claude Vision, Claude Opus 4 through Antigravity, and Codex (GPT-5). They were used for research assistance, session summaries, document structure, wording, checklists, study planning, SUT-document inspection, and final Markdown/PDF assembly.

AI was **not** accepted as the final authority for:

- Product pricing or free-plan limits.
- Browser/device behavior that was not reproduced.
- Contrast ratios that were not measured.
- Participant responses or usability metrics.
- Audience feedback or attendance.
- Personal signatures, contribution hours, or contribution percentages.

The submitted AI-03 forms require each named member to verify and sign their own declaration. The `AI_Usage_Log_Submission.md` file consolidates known historical entries and adds the 2026-07-23 submission-assembly session. Any omitted AI interaction discovered during team review must be added before submission.
