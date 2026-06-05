# [S5] Activity Worksheet — "Heuristic Showdown: Human vs AI"

> **Stage**: S5 (Pre-share) — material due ≥ 3 working days before live seminar.
> **Owner**: Member C — **Nguyễn Bình An** (team leader, audience facilitator).
> **Activity time-box**: 25 minutes hard stop (per Seminar Guide §6 *In-class hands-on activity*).
> **Audience**: 4 teams × 3-4 students each.
> **Required output**: this worksheet + answer key (Section 6) + facilitator script (Section 7).

---

## 1. Activity Overview

| Field | Value |
|---|---|
| Title | **Heuristic Showdown — Human vs AI** |
| Topic | T01 — GUI & Usability Testing |
| SUT | EShop checkout · screen **S-03 *Coupon application*** <!-- TODO @member-C: confirm screen after S3 pilot --> |
| Tools needed by audience | Printed screenshot (PDF handout) + pen — no laptop required |
| Tools facilitator brings | Laptop with pre-generated Claude vision report (printed on slide) |
| Duration | 25 minutes |
| Group size | 3–4 students per audience team |
| Goal | Show the trade-off in practice: humans catch context-heavy issues, AI catches surface issues fast, and both side miss things. |

---

## 2. Audience Pre-Read (sent ≥ 3 days before)

Each audience team should arrive having skimmed:

1. **Nielsen's 10 heuristics** — a one-page summary will be handed out at the door (see [§8 Cheat-sheet](#8-cheat-sheet--nielsens-10-on-1-page)).
2. The **EShop screenshot** of screen S-03 (PDF in the shared Moodle folder).
3. The **severity rubric** (cosmetic / minor / major / catastrophic) — see [§5](#5-severity-rubric).

> ⚠️ Audience teams that skip the pre-read lose 1 attendance credit (Workflow_Briefing slide 7).

---

## 3. Time-boxed Steps

> Adapted from T01 §7 reference table. Each timestamp is **absolute** from activity start (t = 0:00).

| Time | Step | Who | Material |
|---|---|---|---|
| 0:00–0:03 | Facilitator distributes the EShop S-03 screenshot (PDF) + the Nielsen cheat-sheet | C facilitator | handout PDF |
| 0:03–0:13 | **PHASE 1 — Human review.** Each audience team writes down **≥ 5 heuristic violations** on the worksheet, each with a severity (cosmetic / minor / major / catastrophic). | Audience teams | this worksheet §4 |
| 0:13–0:18 | **PHASE 2 — AI reveal.** Facilitator projects the pre-generated Claude vision report on the screen. Teams cross-check: which findings overlap, which did they miss, which did the AI miss? | C facilitator + audience | slides |
| 0:18–0:23 | **PHASE 3 — Pair discussion.** Each team identifies (a) one issue **only humans** caught, (b) one issue **only AI** caught, (c) one issue both **got wrong**. | Audience pairs | this worksheet §4 |
| 0:23–0:25 | **PHASE 4 — Whiteboard share.** Each team writes one insight on the whiteboard or class chat. | All | whiteboard |

---

## 4. Audience Worksheet (1 copy per team)

> Print this page once per team and hand out at t = 0:00.

### Team name & members
- Team: __________________________
- Members: ___________________________________________

### Phase 1 — Your 5+ heuristic violations (t = 0:03 → 0:13)

| # | Heuristic violated (Nielsen 1–10) | Where on the screen | Severity (cos/min/maj/cat) |
|---|---|---|---|
| 1 |  |  |  |
| 2 |  |  |  |
| 3 |  |  |  |
| 4 |  |  |  |
| 5 |  |  |  |
| 6 (bonus) |  |  |  |

### Phase 2 — Cross-check against AI report (t = 0:13 → 0:18)

- **AI findings we agree with**: # __________ (list the numbers from the projected report)
- **AI findings we disagree with**: # __________
- **Our findings the AI missed**: # __________ (list the numbers from your Phase-1 table above)

### Phase 3 — The three reveals (t = 0:18 → 0:23)

| Question | Your answer (1 sentence) |
|---|---|
| (a) One issue **only humans** caught — what & why? |  |
| (b) One issue **only AI** caught — what & why? |  |
| (c) One issue both **got wrong** — what & why? |  |

### Phase 4 — One sentence for the whiteboard (t = 0:23 → 0:25)
> Pick **one** finding from above and write it as a one-liner you can defend in 30 seconds.

`__________________________________________________________________________`

---

## 5. Severity Rubric

| Level | Meaning | EShop example |
|---|---|---|
| **Cosmetic** | Distracting but does not block the task. | Inconsistent button corner radius. |
| **Minor** | Slows the user; workaround obvious. | Error message says "invalid input" without naming the field. |
| **Major** | Blocks the task for many users; workaround requires expertise. | Coupon field accepts the code but the discount is silently not applied. |
| **Catastrophic** | Causes data loss or financial error. | Quantity stepper allows -1; cart total becomes negative; order still goes through. |

---

## 6. Answer Key (facilitator copy — **do NOT print for audience**)

> This is what we expect a competent team to surface. The Claude vision review will be in the same shape.
> Source: pilot run completed on <!-- TODO @member-C: fill date after S3 pilot --> by members C + B.

### 6.1 Plausible human findings on S-03 (Coupon application)

<!-- TODO @member-C: after S3 pilot, list 5-8 real findings observed by the team. Each must include heuristic # + severity + 1 sentence rationale. Below are PLACEHOLDER examples to be replaced with real ones. -->

1. **H1 Visibility of system status** — *no spinner while coupon validates* — **minor** — users click apply twice and submit two coupons.
2. **H2 Match between system and real world** — *label "Promo code" but error message says "voucher invalid"* — **minor**.
3. **H5 Error prevention** — *apply button is enabled with empty input* — **major** — fires an unnecessary network call.
4. **H9 Help users recognise, diagnose, and recover from errors** — *error message "Invalid"* gives no recovery hint — **major**.
5. **H7 Flexibility and efficiency** — *coupon field is below the fold on a 13" laptop* — **minor**.
6. <!-- TODO @member-C -->

### 6.2 What the AI tends to over-report
- Contrast ratio of muted text (often a true positive but flagged with inflated severity).
- "Inconsistent" capitalisation that is in fact a deliberate brand convention.

### 6.3 What the AI tends to under-report
- Behaviour that only manifests **after** a click — AI sees a static image and cannot evaluate dynamic states.
- Localisation issues (e.g., Vietnamese diacritics rendered as `??`) when the screenshot is in English only.

---

## 7. Facilitator Script

> **Owner**: Member C — Nguyễn Bình An. Member D keeps the time.

### 7.1 t = -5:00 (5 min before start)
- Print 4 copies of §4 worksheet + 4 copies of §8 cheat-sheet.
- Confirm projector shows the AI report at full resolution.
- Place the Maze heatmap printout face-down on the front desk (revealed at debrief).

### 7.2 t = 0:00 — opening (60 s)
> *"This is a 25-minute activity. You will play the role of the human usability reviewer; we will play the AI. At the end we compare scores. There is no winner — the point is to surface what each side misses."*

### 7.3 t = 0:03 — kick-off
- Distribute handouts.
- Start timer (D).

### 7.4 t = 0:13 — AI reveal
- Project the Claude vision report. Read out the *first three findings only* — the rest the audience reads themselves.

### 7.5 t = 0:23 — collect & share
- Each team comes to the whiteboard one at a time. Cap at 30 s per team.

### 7.6 t = 0:25 — hard stop
- Thank teams. Collect worksheets for grading audit.

---

## 8. Cheat-sheet — Nielsen's 10 on 1 page

> Hand out alongside §4 worksheet. Print at A4 single-side.

1. **Visibility of system status** — keep users informed via timely feedback.
2. **Match between system and the real world** — speak the users' language.
3. **User control and freedom** — undo/redo, clearly marked exits.
4. **Consistency and standards** — same word / action everywhere.
5. **Error prevention** — careful design > good error messages.
6. **Recognition rather than recall** — minimize memory load.
7. **Flexibility and efficiency of use** — accelerators for experts.
8. **Aesthetic and minimalist design** — no irrelevant information.
9. **Help users recognise, diagnose, and recover from errors** — plain language, suggest solutions.
10. **Help and documentation** — easy to search, focused on the task.

---

## 9. Reproducibility check

A peer team must be able to **run this entire activity** in ≤ 25 minutes using only:
- this worksheet, the cheat-sheet, the screenshot PDF, and the pre-generated AI report;
- **no DMs to our team, no extra setup**.

If they cannot, this worksheet fails the rubric (Workflow_Briefing slide 10, pitfall #5).

<!-- TODO @member-C: pilot the worksheet with one classmate from a different topic team before final submission. Note findings here. -->

---

*Last updated: 2026-06-05 · Skeleton v0.1.0 · Owner: Member C (Nguyễn Bình An, team leader)*
