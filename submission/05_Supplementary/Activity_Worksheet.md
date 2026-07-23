# Activity Worksheet - Heuristic Showdown: Human vs AI

**Topic:** T01 - GUI & Usability Testing  
**Duration:** 20 minutes  
**Team size:** 3-4 students  
**Materials:** This worksheet and the embedded EShop screenshots  
**Internet after distribution:** Not required

**Activity owner/facilitator: 23127149 - Nguyễn Bình An**  
**Answer-key reviewer: 23127327 - Lưu Ngô Quốc Bảo**

# Learning goal

By the end of the activity, your team should be able to separate:

1. A visible observation.
2. A plausible usability hypothesis.
3. A verified defect.

The activity uses Nielsen's heuristics and a 0-4 severity scale:

| Rating | Meaning |
|---:|---|
| 0 | Not a usability problem |
| 1 | Cosmetic |
| 2 | Minor |
| 3 | Major |
| 4 | Usability catastrophe / task blocker |

# Part A - Human review (7 minutes)

Inspect the two EShop screenshots.

![Coupon screen](../assets/eshop_coupon.png)

![Success screen](../assets/eshop_success.png)

Write at least five candidate findings. Use only what is visible. If more evidence is needed, say so.

| No. | Visible observation | Possible heuristic | Tentative severity | Evidence still needed |
|---:|---|---|---:|---|
| 1 |  |  |  |  |
| 2 |  |  |  |  |
| 3 |  |  |  |  |
| 4 |  |  |  |  |
| 5 |  |  |  |  |

# Part B - Audit the AI draft (7 minutes)

For each AI statement, select **Verified from screenshot**, **Rejected**, or **Needs more evidence**. Explain briefly.

| ID | AI-generated statement | Your verdict | Reason |
|---|---|---|---|
| AI-1 | The success page gives a clear completion message in a prominent position. |  |  |
| AI-2 | The coupon input is impossible to operate with a keyboard. |  |  |
| AI-3 | The success page does not show an order identifier or order summary. |  |  |
| AI-4 | The green confirmation button fails WCAG AA contrast. |  |  |
| AI-5 | The coupon state communicates the applied code, saved amount, and updated total. |  |  |
| AI-6 | Mobile Safari hides the payment button behind the virtual keyboard. |  |  |
| AI-7 | The underlined currency symbol proves that the total is a clickable link. |  |  |
| AI-8 | The screenshots alone cannot prove whether the full checkout has an address-confirmation step. |  |  |

<div class="page-break"></div>

# Part C - Final defect decision (4 minutes)

Choose one candidate from Part A and complete the decision gate:

| Field | Team answer |
|---|---|
| Candidate issue |  |
| What is directly visible? |  |
| What is still an assumption? |  |
| Verification step |  |
| Final status: verified / rejected / needs evidence |  |
| Final severity and rationale |  |

# Part D - One-minute share-out (2 minutes)

Complete this sentence:

> Evidence changed our verdict on __________________ because __________________.

<div class="page-break"></div>

# Facilitator answer key

The key rewards evidence quality, not matching one exact wording.

## Part A - Acceptable candidate observations

Examples include:

- The success state is prominent and clearly worded.
- The success screen does not visibly include an order ID, order summary, or receipt link.
- "Quay lại trang chủ" is the only visible next action after success.
- The coupon state shows the applied code, savings, and updated total near the action.
- The amount text and currency symbol have inconsistent underline styling in the captured screen.
- The screenshot crop does not reveal the entire checkout, so absence of an address step cannot be proven from this image alone.

Do not award a verified-defect verdict for hover, focus, keyboard, responsive, contrast-ratio, or screen-reader claims without the required interaction or measurement.

## Part B - Suggested verdicts

| ID | Suggested verdict | Rationale |
|---|---|---|
| AI-1 | **Verified from screenshot** | The success heading is large, centered, and visually prominent. This verifies visibility, not user comprehension. |
| AI-2 | **Needs more evidence** | Keyboard operation cannot be established from a static screenshot. Test tab order, focus, typing, and activation. |
| AI-3 | **Verified from screenshot, with scope note** | No order ID or summary is visible in the captured success state. Whether it is required is a product decision; severity needs task/context evidence. |
| AI-4 | **Needs more evidence** | A contrast ratio must be measured from actual foreground/background colors. |
| AI-5 | **Verified from screenshot** | The applied code, saved amount, and new amount are visible. Usability quality still needs participant evidence. |
| AI-6 | **Needs more evidence** | Requires a real Mobile Safari session and virtual keyboard interaction. |
| AI-7 | **Rejected** | Underlining may be styling or browser rendering; clickability requires interaction/DOM evidence. "Proves" is unjustified. |
| AI-8 | **Verified** | The screenshots are partial states and cannot prove the presence or absence of another step in the flow. |

## Scoring rubric (10 points)

| Criterion | Points |
|---|---:|
| At least five specific observations | 2 |
| Correct heuristic mapping with reasonable rationale | 2 |
| AI audit distinguishes visible facts from interaction/measurement claims | 3 |
| Final defect decision includes a concrete verification step | 2 |
| Share-out explains how evidence changed the verdict | 1 |
