# [S6] Seminar Slides Outline — Live 45-min Session

> **Stage**: S6 (Live seminar)
> **Owner**: Member D — Lưu Ngô Quốc Bảo
> **Hard limit**: ≤ **15 slides** (Workflow_Briefing slide 7 — *"the activity is the centrepiece, not the slides"*).
> **Format**: this file defines what each slide must contain; the final `Seminar_Slides.pptx` will be built from this outline using the course template.

---

## 0. Time budget (45-minute live session)

| Block | Time | Slides covering it | Speaker |
|---|---|---|---|
| Pitch | 0:00 – 0:10 (10 min) | S1 – S5 | A — Phạm Ngọc Gia Bảo |
| Live demo | 0:10 – 0:20 (10 min) | S6 – S8 (mostly screen-share) | B + C |
| Audience activity | 0:20 – 0:40 (20 min) | S9 – S12 | C facilitates |
| Q&A | 0:40 – 0:45 (5 min) | S13 – S15 | All; lead = C |

> Slide count target: **14 slides** (= 15 cap − 1 safety buffer).

---

## Slide-by-slide outline

### S1 — Title
- **Owner**: A
- **Content**:
  - Title: *Heuristic Showdown — GUI & Usability Testing with Maze + Claude vision*
  - Course / team / date / instructor name (Dr. Lâm Quang Vũ).
- **Speaker note (30 s)**: name the team, name the SUT (EShop checkout), name the tool pair. That's it.

### S2 — Why this topic matters
- **Owner**: A
- **Content**: 1 statistic, 1 anecdote.
  - **Stat** (cite Baymard Institute on the slide): *"Baymard Institute reports an average cart-abandonment rate of ~70% across e-commerce, with checkout-flow friction (unexpected costs, forced account creation, long forms) among the most cited causes."*
  - Source URL to print on the slide: https://baymard.com/lists/cart-abandonment-rate
  - 1-sentence story of a checkout failure A personally experienced. <!-- TODO @member-A: write 1 real anecdote, ≤ 25 words -->
- **Speaker note (60 s)**: hook the audience. Do not start with definitions. If asked for the exact number, say *"around 70% — Baymard's 2024 study aggregates 49 sources"* — do not over-precision-cite.

### S3 — The 3 questions of usability testing
- **Owner**: A
- **Content**: a triangle diagram with three vertices:
  - *Can the user **find** it?*
  - *Can the user **trust** it?*
  - *Can the user **recover** when they mis-click?*
- **Speaker note (45 s)**: a normal functional test does not answer any of these. That is the gap our seminar fills.

### S4 — Tool pair · the rule of pairing
- **Owner**: A
- **Content**:
  - Maze logo + 1-line "what it does" + "free tier OK".
  - Claude vision logo + 1-line + "free tier OK".
  - One callout: *Workflow_Briefing slide 3 — every demo must show both columns*.
- **Speaker note (90 s)**: justify the picks in two sentences each. Reference [`01_Tool_Survey_Proposal.md`](01_Tool_Survey_Proposal.md) §4 — point at the QR code on slide S15.

### S5 — Method · 5 steps
- **Owner**: A
- **Content**: a 5-step pipeline diagram (Mermaid render exported):
  `EShop screen → Maze study (5 tasks) → tester data → Claude vision review → team audit`
- **Speaker note (60 s)**: 30 s on Maze leg, 30 s on Claude leg. We will SHOW this next.

### S6 — Live demo · Maze leg
- **Owner**: B demoes; A narrates
- **Content**: **minimal text** — just the agenda for the next 5 minutes.
  - Build a study · publish · invite 1 tester (pre-recorded) · show heatmap.
- **Speaker note**: switch to browser. Do NOT read the slide.

### S7 — Live demo · Claude vision leg
- **Owner**: C demoes; A narrates
- **Content**: same minimal style.
  - Paste prompt · upload screenshot · receive findings · audit one **on stage** (reject or accept).
- **Speaker note**: the audit is the moment that earns credibility — emphasise.

### S8 — Live demo · the comparison
- **Owner**: B + C jointly
- **Content**: side-by-side table on screen (live from the run we just did):
  - Maze finding | Claude finding | Overlap? | Which is right?
- **Speaker note (90 s)**: this is the punchline of the live demo. Show one clear human-only win and one clear AI-only win.

### S9 — Activity intro
- **Owner**: C
- **Content**:
  - Title: *Heuristic Showdown — Human vs AI*
  - Time-box: 25 minutes.
  - 4-phase timer at bottom of slide (0:00 / 0:03 / 0:13 / 0:18 / 0:23 / 0:25).
- **Speaker note (60 s)**: read out the rules from [`04_Activity_Worksheet.md`](04_Activity_Worksheet.md) §7.2.

### S10 — Activity · the screen under review
- **Owner**: C
- **Content**: full-screen image of EShop S-03 (coupon application). No other text.
- **Speaker note**: silent — projector stays on this while teams work for 10 min.

### S11 — Activity · AI reveal (t = 0:13)
- **Owner**: C
- **Content**: full-screen capture of the Claude vision report (printed beforehand so audience can mark it up).
- **Speaker note (60 s)**: read out finding 1, 2, 3. Audience reads the rest.

### S12 — Activity · whiteboard share (t = 0:23)
- **Owner**: C
- **Content**:
  - Empty 4-cell grid on slide; fill in live with one bullet per audience team.
  - Pre-printed prompts: *"only humans caught"*, *"only AI caught"*, *"both got wrong"*.
- **Speaker note**: keep teams to 30 s each. D enforces.

### S13 — Failure modes the audience should remember
- **Owner**: D
- **Content**: 3 bullets distilled from [`03_User_Guide.md`](03_User_Guide.md) §6:
  - <!-- TODO @member-D: one-liner for each of: Maze success-rate over-confidence; Claude hallucinated UI; AI severity miscalibration. -->
- **Speaker note (60 s)**: this is the takeaway slide. Pause for emphasis.

### S14 — When to use this approach (and when NOT to)
- **Owner**: D
- **Content**: 2-column slide.
  - ✅ Use when: static checkout-style flows, English UI, free tier acceptable.
  - ❌ Skip when: highly dynamic SPAs, screenshots with PII, sample > 50 testers needed.
- **Speaker note (45 s)**: honesty earns credit; do not oversell.

### S15 — Q&A · references · QR code
- **Owner**: All; lead = C
- **Content**:
  - Top half: 3 anticipated questions + 1-line answers (pre-prepared).
    - *"How does this differ from accessibility testing?"* — separate framework (WCAG); see Scope Note §2.
    - *"Why not Hotjar?"* — needs live deploy; see Proposal §3.
    - *"Did Claude ever lie to you?"* — yes; see User_Guide §6.2.
  - Bottom half: QR code → GitHub repo + course materials.
- **Speaker note**: open the floor; redirect off-topic Qs gracefully (Rubric §6 *Q&A + facilitation, 10%*).

---

## Slide design rules (enforced by D)

1. **Text density**: ≤ 30 words per slide except S15 (Q&A).
2. **Font**: course template default — do not override.
3. **Images**: every screenshot anonymised (no personal data, no real user names).
4. **Logos**: Maze + Claude logos at S4 only — do not splash vendor branding throughout.
5. **Transitions**: none. Click-only.
6. **Speaker notes**: every slide has a speaker note ≤ 90 s (≤ 200 words).

---

## Rehearsal checklist (the night before)

- [ ] Full run-through with timer — must end ≤ 44:00.
- [ ] Demo machine has Maze + Claude tabs **pre-logged-in**.
- [ ] Backup screencast video ready to play if network fails (Workflow_Briefing slide 7).
- [ ] Activity printouts × 5 teams (one spare).
- [ ] Whiteboard markers tested (2 colours minimum).
- [ ] Each team member has practised their slides at least 2×.

<!-- TODO @member-D: schedule rehearsal time once seminar date is set; add to README §3 Stage Status. -->

---

*Last updated: 2026-06-05 · Skeleton v0.1.0 · Owner: Member D (Lưu Ngô Quốc Bảo)*
