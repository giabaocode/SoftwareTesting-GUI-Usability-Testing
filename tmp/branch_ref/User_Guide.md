# User Guide: Usability Testing for EShop Checkout with Maze

> Seminar topic: T01 - GUI & Usability Testing  
> Responsible part: Usability Testing  
> Main tool: Maze  
> System under test: EShop checkout flow

---

## 1. Introduction

This guide explains how to run a usability test for the EShop checkout flow using Maze. The goal is to check whether users can complete the main checkout tasks smoothly, where they hesitate, where they misclick, and which parts of the flow should be improved.

The usability test focuses on the following checkout steps:

| Step | Area | What we want to observe |
|---|---|---|
| 1 | Cart review | Whether users understand product quantity, price, and total cost |
| 2 | Coupon | Whether users can apply a discount code and notice the result |
| 3 | Shipping address | Whether users can complete required delivery information |
| 4 | Payment | Whether users can choose a payment method and understand validation feedback |
| 5 | Order confirmation | Whether users know the checkout process is complete |

Maze is used because it supports task-based usability testing and can collect useful evidence such as task success, time on task, misclicks, user paths, and open-ended feedback. These metrics help the team turn user behavior into concrete usability findings.

This guide does not include fabricated test results. All result tables must be completed only after the Maze study is actually run.

---

## 2. Install / Setup

### 2.1 Create the Maze workspace

1. Go to Maze and create or log in to a team account.
2. Create a new project for the EShop checkout usability test.
3. Choose the study type that matches the available EShop material:
   - Use a website test if the EShop checkout has a public or staging URL.
   - Use a prototype test if the checkout flow is available as a Figma, Sketch, Adobe XD, or similar prototype.
   - Use draft/open-question blocks only if the real website or prototype is not ready yet.

Do not use a private localhost URL as the final study URL unless participants can access it through a proper tunnel or staging setup. A Maze study should be tested from a participant device before being shared.

### 2.2 Run the EShop SUT locally

The EShop SUT source has been cloned into this workspace from:

```text
https://github.com/ttbhanh/eshop-sut
```

Relevant local folders:

| Component | Folder | Local URL |
|---|---|---|
| Backend API | `eshop-sut/backend` | `http://localhost:3000` |
| Frontend Web | `eshop-sut/frontend-web` | `http://localhost:5173` |

Local startup steps:

```bash
cd eshop-sut/backend
npm install
node database.js
node server.js
```

Open a second terminal for the web frontend:

```bash
cd eshop-sut/frontend-web
npm install
npm run dev
```

Default test account from the SUT documentation:

| Role | Email | Password |
|---|---|---|
| User | `test@eshop.com` | `Test1234!` |

Useful coupon codes from the SUT documentation:

| Code | Type | Requirement | Note |
|---|---|---|---|
| `SAVE10` | 10% discount | Order >= 300,000 VND | One use per user |
| `BIGBUY` | 50,000 VND discount | Order >= 500,000 VND | One use per user |
| `VIP100` | 100,000 VND discount | Order >= 300,000 VND | Two uses per user |
| `EXPIRED` | 20% discount | Expired coupon | Useful for error-state testing |

For an official Maze study, do not ask many participants to reuse the same account and coupon without resetting data or creating separate test users. Coupon usage limits can make later participants see different behavior, which would pollute the usability results.

### 2.3 Prepare the test asset

Before creating the official Maze study, prepare the target flow:

| Required item | Status |
|---|---|
| Local EShop web URL | `http://localhost:5173` |
| Local checkout route | `http://localhost:5173/checkout` |
| Local cart route | `http://localhost:5173/cart` |
| Backend API URL | `http://localhost:3000` |
| Test user account | `test@eshop.com` / `Test1234!` |
| Test coupon code for pilot | `SAVE10` or `VIP100`, depending on database state |
| Sample product for checkout task | `iPhone 15 Pro Max`, `Samsung Galaxy S24 Ultra`, or another seeded product |
| Public/staging URL for official Maze study |  https://nonegregiously-nongospel-lorri.ngrok-free.dev |
| Known limitations of the test environment | Localhost works for local pilot only; official participants need public/staging access |

Do not include private passwords, real payment data, student IDs, or course-secret content in the Maze study or in AI tools.

### 2.4 Define participant criteria

The target participants should be people who can reasonably represent online shoppers. For this seminar, participants may be classmates or invited testers.

Record the participant criteria before the study starts:

| Field | Description |
|---|---|
| Target participant group | University students enrolled in the Software Testing course |
| Expected number of participants | ~40 (entire class) |
| Required device/browser | Phone (iOS/Android) or computer (Chrome, Firefox, Safari, Edge) |
| Estimated completion time | ~5 minutes |

### 2.5 Prepare evidence storage

Create a clear folder for screenshots and exported results:

```text
ai-disclosure/
weekly_reports/
releases/
```

Recommended evidence to save:

- Screenshot of Maze study setup.
- Screenshot of each task block.
- Screenshot of participant preview mode.
- Screenshot or export of Maze results after the study.
- Notes from pilot testing.
- Final summary table of findings.

---

## 3. First Test

The first test should be a small pilot, not the official class-wide study. The pilot checks whether the study link works, whether the task wording is understandable, and whether Maze records the expected data.

### 3.1 Create the Maze study

1. Open the Maze project.
2. Create a new study.
3. Add the EShop checkout URL or prototype link.
4. Name the study clearly, for example:

```text
EShop Checkout Usability Test - Pilot
```

5. Add an introduction screen explaining the scenario:

```text
You are testing an online shopping checkout flow. Please complete each task as naturally as possible. This is a test of the interface, not a test of your personal ability.
```

Current draft evidence:

![Maze checkout task outline draft](weekly_reports/usability_evidence/maze_checkout_task_outline_draft.png)

The screenshot shows an earlier draft of the Maze study named `EShop Checkout Usability Test - Group 3`. It is setup evidence only. The live Free-plan study uses the single Free Explore scenario and follow-up questions described below.

### 3.2 Add task scenarios

Use one end-to-end **Free Explore** website task so participants stay in one checkout session.

| Task ID | Maze block | Start URL | Participant task | What to observe |
|---|---|---|---|---|
| UT-01 | Website Test - Free Explore | Public EShop home URL | Add one product to the cart, continue to checkout, log in with the test account if prompted, apply the provided coupon, review the final amount, and confirm payment. Notice whether an address-confirmation step exists, then click `End task`. | Click heatmaps on the key screens; whether users notice the missing address step; whether the final state is understood. |

Use the public ngrok/staging URL and a pilot-verified coupon. The current SUT has no shipping-address form, so ask users to observe its absence rather than to enter an address. Free Explore results are interpreted through heatmaps and question responses, not automatic success or misclick rates.

### 3.3 Add post-task questions

Add the following six question blocks after UT-01. Together with the single Free Explore Website Test, this creates a seven-block study. Keep them required, except that the final open question may be optional if the pilot shows that participants abandon it.

| Order | Maze question block | Question | Response options / purpose |
|---|---|---|---|
| Q1 | Opinion Scale | How clear was the feedback after you applied the coupon? | Required, 1 = Not clear at all and 5 = Very clear. |
| Q2 | Multiple Choice | Where did you see shipping-address information in the checkout flow? | Required: `A. A clear address-entry or confirmation step`; `B. Address information was present but unclear`; `C. I did not see an address-entry or confirmation step`; `D. I am not sure`. |
| Q3 | Yes/No | After confirming payment, were you confident that the order had been created successfully? | Required. |
| Q4 | Opinion Scale | How easy was the overall EShop checkout flow to use? | Required, 1 = Very difficult and 5 = Very easy. |
| Q5 | Multiple Choice | Which part of the checkout flow required the most effort? | Required: `A. Finding and adding a product`; `B. Reviewing the cart and reaching checkout`; `C. Logging in`; `D. Applying the coupon or reviewing the total`; `E. Confirming payment`; `F. None of these`. |
| Q6 | Open Question | Which step was most confusing, and what one change would improve the checkout flow most? | Optional if needed. |

### 3.4 Run a pilot test

Run the study with 1-2 pilot participants. Before publishing, confirm: the public link works on another device, the full checkout and coupon work, a pilot response produces a heatmap, and Q1-Q6 appear in order without requesting real personal/payment data. Record any change made after the pilot.

### 3.5 Local self-check evidence

A local self-check of the EShop flow was completed before the official Maze participant study. The checked flow was:

```text
add product -> cart -> login -> checkout -> coupon -> confirm
```

Evidence screenshots are stored in `weekly_reports/usability_evidence/`:

| Evidence file | Purpose |
|---|---|
| [Screenshot 2026-07-11 171903.png](weekly_reports/usability_evidence/Screenshot%202026-07-11%20171903.png) | Local self-check screenshot |
| [Screenshot 2026-07-11 171919.png](weekly_reports/usability_evidence/Screenshot%202026-07-11%20171919.png) | Local self-check screenshot |
| [Screenshot 2026-07-11 172001.png](weekly_reports/usability_evidence/Screenshot%202026-07-11%20172001.png) | Local self-check screenshot |
| [Screenshot 2026-07-11 172035.png](weekly_reports/usability_evidence/Screenshot%202026-07-11%20172035.png) | Local self-check screenshot |
| [Screenshot 2026-07-11 172039.png](weekly_reports/usability_evidence/Screenshot%202026-07-11%20172039.png) | Local self-check screenshot |

These screenshots prove that the author could run the checkout flow locally. They are not Maze participant results, so they must not be used as success-rate, misclick-rate, or user-feedback evidence.

### 3.6 Publish and collect responses

After the pilot is successful:

1. Publish the Maze study.
2. Share the participant link through the agreed class channel.
3. Record the date, time, and channel used for sharing.
4. Stop collecting responses after the planned deadline.
5. Export or screenshot the Maze results for evidence.

Study record:

| Field | Value |
|---|---|
| Official study link | `[Fill in]` |
| Sharing channel | `[Fill in]` |
| Start time | `[Fill in]` |
| End time | `[Fill in]` |
| Total responses | `[Fill in after study]` |
| Valid responses | `[Fill in after filtering]` |

---

## 4. Advanced Usage

### 4.1 Read Free Explore evidence

This Free Explore study uses only the evidence visible in Maze Results:

- Save 1-2 heatmaps showing important or unexpected clicks.
- Summarize the Q1-Q5 response distributions and 1-2 repeated themes from Q6.
- Do not report automatic success, misclick, expected-path, or time-on-task metrics.

Heatmaps show clicks only; they do not reliably show typing, hover, drag, or transient pop-ups.

### 4.2 Summarize task-level results

Complete this short summary after the Maze study.

| Scenario | Heatmap / click observation | Question evidence | Main observation |
|---|---|---|---|
| UT-01 - End-to-end checkout Free Explore | `[Fill in from 1-2 heatmap screenshots]` | `[Fill in from Q1-Q6 responses]` | `[Fill in]` |

### 4.3 Convert evidence into usability findings

Add at most two high-impact findings based on real evidence.

| ID | Pain point | Evidence | Severity | User impact | Suggested improvement |
|---|---|---|---|---|---|
| UP-01 | `[Fill in]` | `[Heatmap / question response / screenshot]` | `[Critical/Major/Minor/Cosmetic]` | `[Fill in]` | `[Fill in]` |
| UP-02 | `[Fill in]` | `[Heatmap / question response / screenshot]` | `[Critical/Major/Minor/Cosmetic]` | `[Fill in]` | `[Fill in]` |

Suggested severity scale:

| Severity | Definition |
|---|---|
| Critical | Prevents users from completing checkout |
| Major | Causes serious confusion, delay, or repeated errors |
| Minor | Creates friction but users can still continue |
| Cosmetic | Visual or wording issue with low impact on completion |

### 4.4 Avoid invalid conclusions

Do not claim that all users found checkout easy, that a problem is fixed, or that a small class sample represents all customers. Use careful wording:

```text
Based on the collected class-participant data, the checkout screen showed friction around [area] because [heatmap and question evidence]. Since the participant sample is limited and the study uses Free Explore, this result should be treated as exploratory rather than fully representative of all EShop users.
```

### 4.5 Prepare the seminar explanation

For the seminar, explain: checkout scenario, Free Explore setup, heatmap/question evidence, 1-2 findings, recommended improvement, and study limitations.

---

## 5. Troubleshooting

| Problem | Likely cause | Fix |
|---|---|---|
| Maze study link does not open | Study is not published or link is private | Check publish status and test the participant link in an incognito browser |
| EShop URL does not load for participants | Localhost/private network URL was used | Deploy to staging or use a prototype accessible to participants |
| Participants fail because they do not understand the task | Task wording is unclear or too broad | Run a pilot and rewrite the task in simpler language |
| Participants follow different paths than expected | The UI allows multiple valid routes or task goal is vague | Accept valid alternative paths or refine task success criteria |
| Maze records many misclicks | UI may be confusing, or clickable areas are not configured correctly | Inspect click map and verify Maze task setup |
| Results are too few to conclude | Not enough valid participants | Report sample size clearly and avoid broad claims |
| Feedback is too short or unhelpful | Open question is too vague | Ask a more specific post-task question |
| Metrics look inconsistent | Technical issue, participant distraction, or invalid response | Define filtering criteria and mark invalid responses transparently |
| Need to edit study after publishing | Maze plan or study state may restrict changes | Duplicate the study or document changes clearly before rerunning |
| Free-tier limit affects testing | Too many drafts or study constraints | Prepare carefully, pilot early, and avoid unnecessary duplicate studies |

---

## 6. References

- `Seminar_Guide.docx.pdf` - Stage S4 user guide requirement and seminar rubric.
- `AI Usage Guidelines.pdf` - AI usage disclosure and prohibited-use rules.
- `Tool_Survey_Proposal.md` - Tool comparison and Maze selection rationale.
- `DeepStudyHandsOn.md` - Usability testing study design and hands-on notes.
- Maze documentation: <https://help.maze.co/>
- Nielsen Norman Group, Usability Testing: <https://www.nngroup.com/articles/usability-testing-101/>
- Nielsen Norman Group, 10 Usability Heuristics: <https://www.nngroup.com/articles/ten-usability-heuristics/>

---

## 7. Appendix: AI Usage Notes

This section is included to comply with the course AI Usage Guidelines.

### 7.1 AI use declaration

AI was used to assist with drafting the structure and wording of this Markdown user guide. The guide must be reviewed, edited, and validated by the student/team before submission.

| Required detail | Entry |
|---|---|
| Tool name, version, platform | Codex, GPT-5, OpenAI/Codex |
| Access time | 2026-07-11, Asia/Bangkok |
| Purpose of use | Draft a usability-testing user guide structure and reusable Markdown content |
| Prompt summary | Create `User_Guide.md` following `Seminar_Guide.docx.pdf` and strict `AI Usage Guidelines.pdf`, scoped to Usability Testing responsibility |
| AI-generated content | Initial guide structure, tables, task templates, troubleshooting list, and AI usage appendix |
| Student/team work required | Review wording, run Maze study, collect real participant data, fill placeholders, verify findings, add screenshots/evidence, and remove any inaccurate statements |
| Evidence | Add screenshot or chat-history reference in `ai-disclosure/AI_Usage_Log.md` |

### 7.2 Human validation checklist

Before submitting this guide, the responsible student/team must confirm:

| Check | Status |
|---|---|
| All Maze links are real and accessible | `[To confirm]` |
| Pilot test was actually run | `[To confirm]` |
| Participant count is real | `[To confirm]` |
| Maze metrics are copied from actual results | `[To confirm]` |
| Open feedback is quoted or summarized honestly | `[To confirm]` |
| No fake audience feedback is included | `[To confirm]` |
| No private data is included | `[To confirm]` |
| AI-assisted text was reviewed and edited by the student/team | `[To confirm]` |
| Screenshots or chat history are saved as evidence | `[To confirm]` |

### 7.3 Prohibited use reminder

Do not use AI to generate fake study results, fake participant comments, fake screenshots, fake attendance, or final conclusions that are not supported by actual Maze evidence.
