# GUI & Usability Testing for EShop Checkout

## Human judgment, strengthened by AI - never replaced by it

**Group 03 - CSC13003 - 23KTPM4**  
Nguyễn Bình An - Phạm Ngọc Gia Bảo - Lee Kun Da - Lưu Ngô Quốc Bảo

**GUI Testing demo video:** [https://youtu.be/cOqglxehzA4](https://youtu.be/cOqglxehzA4)

<p class="owner">Responsible: All four members</p>

# A technically correct checkout can still fail its users

- Functional tests answer: "Did the action complete?"
- GUI testing asks: "Did the interface render and react correctly?"
- Usability testing asks: "Could a person understand and complete the task?"
- AI can propose issues quickly, but it cannot observe intent or own the final verdict.

<div class="takeaway">Our approach combines real interaction, structured user research, and a human audit gate.</div>

<p class="owner">Responsible: 23127149 - Nguyễn Bình An</p>

# One checkout flow, three complementary lenses

| Lens | Tool/practice | Main evidence |
|---|---|---|
| Cross-browser UI | BrowserStack Live | Reproduction on a named browser/device |
| Usability | Maze Free Explore | Click evidence + follow-up responses |
| AI-assisted review | Claude Vision | Screenshot-review hypotheses |

**Scope:** cart -> login -> coupon -> amount review -> confirmation

<p class="owner">Responsible: 23127149 - Nguyễn Bình An</p>

# Evidence becomes a defect only after human verification

<div class="flow">
  <div><strong>1</strong><br>Run EShop</div>
  <div><strong>2</strong><br>Inspect in BrowserStack</div>
  <div><strong>3</strong><br>Capture evidence</div>
  <div><strong>4</strong><br>Ask AI for hypotheses</div>
  <div><strong>5</strong><br>Reproduce and decide</div>
</div>

<div class="takeaway">AI output is an input to testing, not a test result.</div>

<p class="owner">Responsible: 23127327 - Lưu Ngô Quốc Bảo</p>

# A small risk-based matrix is better than random coverage

| Environment | What it helps expose |
|---|---|
| Windows + Chrome | Primary desktop behavior |
| Windows + Firefox/Edge | Engine-specific CSS and focus behavior |
| macOS + Safari | WebKit rendering differences |
| Android device | Narrow viewport + virtual keyboard |
| iPhone + Mobile Safari | Touch targets + viewport behavior |

Record exact OS, browser, version, device, viewport, account, and seed state for every finding.

<p class="owner">Responsible: 23127327 - Lưu Ngô Quốc Bảo</p>

# The repository proves the checkout path was runnable

<div class="columns">
<div>

![Local cart self-check](../assets/eshop_cart.png)

</div>
<div>

![Local coupon self-check](../assets/eshop_coupon.png)

</div>
</div>

These local screenshots demonstrate cart and coupon states. They are not cross-browser results and do not prove usability.

<p class="owner">Responsible: 23127027 - Phạm Ngọc Gia Bảo</p>

# Maze turns the flow into an observable participant task

<div class="columns wide-image">
<div>

![Maze study draft](../assets/maze_study_draft.png)

</div>
<div>

**Free Explore task**

Add a product, reach checkout, apply the coupon, review the amount, confirm payment, and notice whether address confirmation exists.

**Follow-up evidence**

- Coupon-feedback clarity
- Address-step visibility
- Confidence after confirmation
- Overall ease
- Most effortful step
- One suggested improvement

</div>
</div>

<p class="owner">Responsible: 23127027 - Phạm Ngọc Gia Bảo</p>

# Neutral wording protects the validity of the study

**Avoid**

> Click "Giỏ hàng", then press "Tiến hành thanh toán", enter `BIGBUY`, and click the green button.

**Prefer**

> Add one product, continue through checkout, apply the provided coupon, review the amount, and confirm payment.

Pilot with 1-2 people before release. Verify the URL, seed state, question order, and result capture.

<p class="owner">Responsible: 23127035 - Lee Kun Da</p>

# Ask AI for hypotheses and the evidence needed

**Prompt contract**

> Review this checkout screenshot as a hypothesis generator. For each possible issue, give the location, heuristic, tentative severity, evidence still needed, and a verification step. Do not claim a defect that cannot be established from the screenshot.

AI is useful for:

- Visual hierarchy and consistency checks
- Candidate heuristic violations
- Comparing desktop and mobile screenshots

AI cannot prove hover, focus, loading, DOM, keyboard, or user-intent claims from one screenshot.

<p class="owner">Responsible: 23127149 - Nguyễn Bình An</p>

# The human audit gate has four possible verdicts

| Verdict | Decision |
|---|---|
| **Verified** | Reproduced in the named environment |
| **Rejected** | Absent, expected, or based on a wrong assumption |
| **Needs evidence** | Requires interaction, DOM, or measurement |
| **Duplicate** | Same root cause as an existing issue |

Final severity belongs to the human reviewer and is based on task impact, not AI confidence.

<p class="owner">Responsible: 23127327 - Lưu Ngô Quốc Bảo</p>

# Each method has failure modes we must disclose

| Method | Typical failure | Control |
|---|---|---|
| BrowserStack | Tunnel or shared-account state changes | Preflight and reset test data |
| Maze | Heatmap is mistaken for user intent | Triangulate with questions |
| AI vision | Hidden interaction problems are invented | Reproduce or reject |
| AI vision | Contrast ratio is asserted without measurement | Measure with a checker |
| Study design | Task wording teaches the solution | Pilot neutral wording |
| Sampling | A class sample is generalized | Label conclusions exploratory |

<p class="owner">Responsible: 23127327 - Lưu Ngô Quốc Bảo</p>

# Heuristic Showdown makes the audit process tangible

**20-minute audience activity**

1. Inspect one EShop screen and list at least five candidate issues.
2. Map each to a Nielsen heuristic and tentative severity.
3. Audit a prepared AI review containing plausible and unsupported claims.
4. Mark each claim: verified, rejected, or needs evidence.
5. Share one case where evidence changed the verdict.

The worksheet and answer key work offline after distribution.

<p class="owner">Responsible: 23127149 - Nguyễn Bình An</p>

# Our strongest finding is about evidence discipline

**The repository currently supports**

- A runnable local checkout flow
- Cart, coupon, and confirmation screenshots
- A Maze study draft
- Documented AI-use evidence

**It does not yet support**

- Participant success or misclick rates
- A verified cross-browser defect set
- Claude precision/recall
- Fabricated audience feedback

<div class="takeaway">Knowing what the evidence cannot say is part of good testing.</div>

<p class="owner">Responsible: 23127027 - Phạm Ngọc Gia Bảo</p>

# Use AI to widen the search - keep humans accountable

**Observe with real interaction.**  
**Ask AI for structured hypotheses.**  
**Verify every claim.**  
**Report limitations honestly.**

GUI Testing demo video (YouTube Unlisted): [https://youtu.be/cOqglxehzA4](https://youtu.be/cOqglxehzA4)

<p class="owner">Responsible: All four members</p>
