# [S2] Scope Note — for Instructor Review

> **Stage**: S2 (Instructor / TA review & approval)
> **Owner**: Lee Kun Da — search `@KunDa`
> **Purpose**: This is the companion to [`01_Tool_Survey_Proposal.md`](01_Tool_Survey_Proposal.md). It pins down exactly what we will and will not do, so the instructor can give a verdict (APPROVED / MINOR-CHANGE / RECLAIM) in under 2 working days.

---

## 1. In-Scope (what we WILL do)

### 1.1 SUT subset
Only the EShop **checkout flow**, defined as the following 5 screens:

| # | Screen | Trigger | Key UI elements under test |
|---|---|---|---|
| S-01 | Product listing | navigate from homepage | search bar, "Add to Cart" CTA |
| S-02 | Cart review | click cart icon | quantity stepper, remove, subtotal |
| S-03 | Coupon application | enter coupon code | input field, apply button, error/success states |
| S-04 | Address & shipping | proceed from cart | form validation, address autocomplete |
| S-05 | Payment | proceed from address | payment-method radio, "Place Order" CTA |

> **Out of scope**: account registration, order-history page, admin dashboard, mobile native app.

### 1.2 Tool features we WILL demonstrate live
- **Maze**: **a single study with 5 tasks** (one per screen S-01 → S-05); success-rate, click-path, and heatmap output per task. Free tier limit: 1 study/month + 5 seats — sufficient if we bundle all checkout tasks into one study.
- **Claude vision**: upload 3 screenshots → request Nielsen-10 heuristic-evaluation report → audit each finding manually.

### 1.3 Audience activity scope
- **"Heuristic Showdown — Human vs AI"** on a single screen (S-03 *Coupon application* recommended — highest signal-to-noise for usability defects).
- Time-box: 25 minutes hard stop. <!-- TODO @BìnhAn: confirm screen choice after running pilot — could be S-02 if coupon screen too noisy -->

---

## 2. Out-of-Scope (what we will NOT do)

To prevent scope creep and protect the 4-week timeline:

- ❌ Cross-browser matrix testing (would require BrowserStack — out of pair).
- ❌ Mobile usability (Maze supports it, but our SUT scope is desktop web only).
- ❌ Accessibility (WCAG) audit — adjacent topic but separate evaluation framework; could be a future seminar.
- ❌ Backend / API issues — out of GUI testing scope (covered by T6).
- ❌ Performance / load testing — out of GUI testing scope (covered by T5).
- ❌ A/B testing — we are testing the *existing* checkout, not variants.

---

## 3. Success Criteria for the Seminar

This is the bar against which we should be evaluated:

1. **Live demo runs end-to-end without a script** (Rubric §6 *Live demo, 15%*).
2. **Maze study completes with ≥ 1 real heatmap** captured during demo.
3. **Claude vision produces ≥ 5 distinct Nielsen-10 findings** during demo, and the team can **reject ≥ 1 of them on the spot** with reasoning (demonstrates AI critical thinking, not vendor enthusiasm).
4. **Audience activity finishes within 25 minutes** with at least 3 of 4 audience teams submitting a completed worksheet.
5. **User_Guide.md passes the "reproducibility test"**: a peer team can install Maze and run the EShop study using only our docs, with no Slack DM.

---

## 4. Open Questions for Instructor (Stage S2 input)

> **Kun Da — please collect instructor verdict per row at the draft-review session.**

| # | Question | Why we're asking | Instructor verdict |
|---|---|---|---|
| Q1 | Is the EShop *checkout* subset (5 screens) sufficient SUT scope, or do you want us to include account/order-history? | Need to lock SUT before the Maze study is built. | _TBD_ |
| Q2 | Do you accept **Claude vision** as the AI-augmented tool, or should we add a second AI tool (e.g., UXTweak AI) to harden the AI angle? | Rule of pairing says ≥ 1 AI tool — but more might score higher on §6 *Depth of study*. | _TBD_ |
| Q3 | Is screen **S-03 *Coupon application*** the right activity target, or do you suggest a different EShop screen? | Affects worksheet design in Stage S5. | _TBD_ |
| Q4 | The Maze **Free** tier limits us to **1 study/month + 5 seats** (verified on maze.co/pricing 2026-06-05). We plan to bundle all 5 EShop screen tasks into a single study to fit within this limit. Is that acceptable, or do you want us to pay for Starter (US$99/mo)? Note: Starter has the same 1-study/month limit — it only unlocks the unmoderated toolkit and screen recording. | Cost / licence awareness criterion in §6 *Tool survey*. | _TBD_ |
| Q5 | Will the **EShop staging URL** be the same one used by other teams (T2 Playwright, T6 Postman), or do we get a dedicated instance? | Affects environment stability during demo. | _TBD_ |

<!-- TODO @KunDa: after S2 review, replace _TBD_ with the verdict and update [01_Tool_Survey_Proposal.md] if needed -->

---

## 5. Iteration Budget

Per Seminar Guide §2.1 *"Teams may iterate at most twice"* on S1/S2:

- **Iteration 1**: this draft (submitted on 2026-06-05 for review on 2026-06-06).
- **Iteration 2** (if MINOR-CHANGE): we will revise within 24 hours and proceed to S3 without a second review meeting.
- **Worst case (RECLAIM)**: fall back to the **Hotjar + UXTweak AI** pair already comparison-matrixed in Proposal §3.

---

*Last updated: 2026-06-05 · Draft v0.1.0 · Owner: Lee Kun Da*
