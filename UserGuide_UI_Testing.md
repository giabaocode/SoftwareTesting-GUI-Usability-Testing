# User Guide: Manual UI Testing with BrowserStack Live & Claude Vision

> **Seminar topic:** GUI & Usability Testing  
> **Responsible part:** UI Testing  
> **Main tools:** BrowserStack Live, BrowserStack Local, Claude Vision  
> **System under test:** EShop Checkout

---

# 1. Introduction

## 1.1 Purpose

This guide explains how to perform Manual UI Testing using BrowserStack Live together with AI-assisted UI review using Claude Vision.

The objectives are to:

- Verify the UI across browsers and real devices.
- Detect layout and visual issues.
- Evaluate UI consistency.
- Validate AI findings through manual inspection.
- Produce reliable UI bug reports.

Manual UI Testing focuses on aspects that are difficult for automated scripts to assess, such as aesthetic rendering, overall design feel, and natural interactive experiences.

---

## 1.2 Scope

This guide covers:

- BrowserStack Live
- BrowserStack Local
- Claude Vision
- EShop Checkout (specifically the customer checkout flow: Cart, Coupon, Address, Payment, and Success screens of the Frontend Web portal, interacting with the Backend API).

This guide does not include fabricated defects or testing results.

---

## 1.3 Tool Overview

### BrowserStack Live

BrowserStack Live is a cloud testing platform that allows testers to manually test websites on real browsers and real mobile devices without maintaining physical hardware. It grants remote access to thousands of real browser, OS, and device combinations.

Main features include:

- **Cross-browser testing:** Access to Chrome, Firefox, Safari, Edge, etc.
- **Cross-device testing:** Run tests on real iOS and Android devices (e.g., iPhone 15, Samsung Galaxy S23) as well as desktop OS versions (Windows, macOS).
- **Responsive testing:** Inspect layout shifts and fluid designs dynamically.
- **Screenshot capture:** High-quality, one-click screenshot tool.
- **Bug annotation:** Direct visual marking and highlighting on the screen.

---

### Claude Vision

Claude Vision is a multimodal AI capable of reviewing screenshot images and suggesting potential UI/UX issues. By analyzing layouts, spacing, typography, and contrast, it functions as a "second pair of eyes" to catch errors humans might overlook.

Typical review areas include:

- **Layout:** Spacing, padding, grid columns, and responsiveness.
- **Alignment:** Consistent grid alignment and element centering.
- **Typography:** Correct font sizes, font family consistency, weights, line heights, and hierarchy.
- **Color consistency:** Verification of color palette adherence.
- **Contrast:** Measuring contrast ratios (e.g., checking compliance with WCAG 2.1 AA requirement of $\ge$ 4.5:1 for normal text and $\ge$ 3:1 for large text).
- **Nielsen Heuristics:** Identifying usability violations.

> [!IMPORTANT]
> **Human Audit Required:** Claude findings **must always be verified manually** by the tester. AI results can contain false positives (hallucinations) and should not be reported as bugs without manual confirmation.

---

## 1.4 Workflow Overview

```text
Run EShop
      │
      ▼
BrowserStack Live
      │
      ▼
Manual UI Testing
      │
      ▼
Capture Screenshots
      │
      ▼
Claude Vision Review
      │
      ▼
Human Audit
      │
      ▼
Bug Report
```

This workflow ensures a comprehensive assessment. The tester runs the application, inspects it manually across devices via BrowserStack Live, uses Claude Vision to scan for additional visual and usability defects, audits Claude's output to filter out false positives, and documents only validated bugs.

📷 **Suggested Screenshot**

Workflow diagram or project overview.

---

# 2. Install / Setup

## 2.1 Create a BrowserStack Account

1. Visit the BrowserStack website.
2. Register an account (sign up for a free trial or active Live plan).
3. Verify your email address.
4. Sign in.
5. Navigate to the BrowserStack Live Dashboard.

📷 **Suggested Screenshot**

BrowserStack Dashboard after login.

```md
![BrowserStack Dashboard](images/browserstack_dashboard.png)
```

---

## 2.2 Install BrowserStack Local

1. Download the BrowserStack Local binary/app from the BrowserStack website.
2. Start BrowserStack Local on your local machine to establish a secure tunnel.
3. Ensure the tunnel status displays **Connected** in the GUI or terminal. This is required to access your locally-hosted EShop application on remote BrowserStack devices.

📷 **Suggested Screenshot**

BrowserStack Local connected successfully.

```md
![BrowserStack Local Connected](images/browserstack_local_connected.png)
```

---

## 2.3 Run the EShop System

Follow the steps below to start the local EShop backend, frontend web, and admin panel.

### Backend

Open a terminal and run:

```bash
cd eshop-sut/backend

npm install

# Initialize SQLite database and seed mock data (products, user accounts, coupons)
node database.js

# Start the API server
node server.js
```

> [!NOTE]
> Running `node database.js` is required to seed default data (like user accounts, coupons, and inventory items). You only need to run this command once, or whenever you want to reset the database.

### Frontend Web (Customer Portal)

Open a second terminal and run:

```bash
cd eshop-sut/frontend-web

npm install

npm run dev
```

### Web Admin Panel (Optional/Admin Portal)

Open a third terminal and run:

```bash
cd eshop-sut/frontend-admin

npm install

npm run dev
```

Verify that the services are online:

| Component | Port / URL | Description |
|------------|-----|-------------|
| Backend | http://localhost:3000 | API server running SQLite |
| Frontend Web | http://localhost:5173 | Main storefront customer interface |
| Web Admin | http://localhost:5174 | Management dashboard for administrators |

📷 **Suggested Screenshot**

EShop homepage running locally.

```md
![EShop Homepage](images/eshop_homepage.png)
```

---

## 2.4 Prepare Test Environment

Ensure the following credentials, parameters, and services are active before starting the test:

| Item | Value / Description |
|------|------|
| BrowserStack Local | Running |
| Internet | Stable (low latency connection) |
| Default Test User | `test@eshop.com` (password: `Test1234!`) |
| Default Test Admin | `admin@eshop.com` (password: `Admin123!`) |
| Frontend Web URL | http://localhost:5173 |
| Web Admin URL | http://localhost:5174 |
| Backend URL | http://localhost:3000 |

---

## 2.5 Prepare Test Matrix

We test across the following OS, browser, and device combinations:

| Browser | Desktop | Mobile |
|----------|----------|---------|
| Chrome | Windows (latest), macOS (latest) | Android (Samsung Galaxy S23) |
| Firefox | Windows (latest) | — |
| Safari | macOS (latest) | iPhone (iPhone 15) |
| Edge | Windows (latest) | — |

---

## 2.6 Prepare UI Checklist

Tester should inspect components according to these checklist categories:

- **Layout:** Padding, margin, alignment, placement of elements, and grid alignment.
- **Typography:** Font sizes, weights, styles, and font family consistency.
- **Color:** Color palette conformity and WCAG 2.1 contrast ratios.
- **Alignment:** Canned or broken text lines, alignment of inputs, and buttons.
- **Responsive:** Layout wrapping and resizing across window sizes and orientations.
- **Forms:** Focus indicators, labels, validation highlights, and error messages.
- **Buttons:** Hover/active states, pointer styling, size, and disabled states.
- **Accessibility:** Tab-navigation order, presence of image alt text, and label associations.

---

## 2.7 Prepare Evidence Storage

Organize the testing workspace by creating the following directory structure:

```text
browserstack/
claude-review/
reports/
screenshots/
```

- `browserstack/`: Annotated screenshots and logs from BrowserStack.
- `claude-review/`: Prompt logs and Claude vision response exports.
- `reports/`: Bug reports and completed UI checklists.
- `screenshots/`: Clean screenshots captured for review and documentation.

---

# 3. First Test

## 3.1 Open BrowserStack Live

1. Open BrowserStack Live from your dashboard.
2. Select your desired target Operating System (Windows, macOS, iOS, or Android).
3. Select the Browser (Chrome, Firefox, Safari, Edge).
4. For mobile, select the exact Device model (e.g., iPhone 15 or Samsung Galaxy S23).
5. Verify that **BrowserStack Local** is enabled and active in the live session menu to access local ports.

📷 **Suggested Screenshot**

Browser selection page.

```md
![Browser Selection](images/browser_selection.png)
```

---

## 3.2 Manual UI Testing

Navigate to the locally running frontend URL (`http://localhost:5173`) within the BrowserStack remote session.

Perform manual inspection on:

| Step | Screen | Inspection Targets & Test Parameters |
|------|---------|--------------------------------------|
| 1 | Cart | Grid layout of product list, (+/−) quantity buttons, item removal (trash icon), total calculation, empty state. |
| 2 | Coupon | Input valid/invalid coupons to check alignment, validation messages, and discount rendering. <br>**Use SUT Coupon Codes:**<br>- `SAVE10` (10% off, min order $\ge$ 300,000 ₫)<br>- `BIGBUY` (50,000 ₫ fixed, min order $\ge$ 500,000 ₫)<br>- `VIP100` (100,000 ₫ fixed, min order $\ge$ 300,000 ₫)<br>- `EXPIRED` (20% off, expired in 2020) |
| 3 | Address | Address form required fields (highlighted with error borders), error text clarity, auto-fill rendering, mobile form wrap. |
| 4 | Payment | Radio buttons for payment method selection, credit card input formatting/masking, submit order button, loading state. |
| 5 | Success | Order success confirmation message, details breakdown, alignment of elements. |

Verify:

- Layout & alignment
- Typography & fonts
- Colors & contrast
- Hover states (desktop browsers only)
- Focus states and Tab order
- Error messages (appearance and placement)
- Responsive behavior (resizing and viewport compatibility)

📷 **Suggested Screenshot**

BrowserStack Live session showing EShop.

```md
![BrowserStack Live Session](images/browserstack_live.png)
```

---

## 3.3 Capture Evidence

For every visual or functional defect encountered during manual testing:

1. Capture a screenshot using BrowserStack's built-in 1-click screenshot or your OS screenshot utility.
2. Record metadata: OS version, Browser type, Browser version, and Device model.
3. Save the image to the `screenshots/` directory with a descriptive name (e.g., `desktop_chrome_coupon_error_alignment.png`).
4. Use BrowserStack's Annotation Tool to draw borders or arrows on the bug.

📷 **Suggested Screenshot**

BrowserStack Screenshot Tool.

```md
![BrowserStack Screenshot Tool](images/browserstack_screenshot.png)
```

---

## 3.4 Claude Vision Review

Upload the captured high-resolution screenshots to Claude.

Suggested prompts for the review:

- **General UI/UX Review:**
  > *Review this screenshot of an e-commerce checkout page. Identify UI issues related to alignment, color contrast, typography consistency, and spacing. For each issue, describe: location on screen, what's wrong, and suggested fix.*
- **Heuristic Review:**
  > *Evaluate this UI screenshot against Nielsen's 10 Usability Heuristics. For each violation found, specify: heuristic number and name, severity rating (0–4), exact location on screen, description of the problem, and recommended fix.*
- **Cross-device/Consistency Review:**
  > *Compare these two screenshots of the same checkout flow on desktop vs. mobile. Identify any inconsistencies in layout, typography, color, or interactive elements between the two versions.*

📷 **Suggested Screenshot**

Claude with uploaded screenshot.

```md
![Claude Review](images/claude_review.png)
```

---

## 3.5 Human Audit

Every finding suggested by Claude Vision must be audited manually by the tester.

1. Review Claude's output list.
2. Access the live system on BrowserStack to verify if the issue actually exists.
3. Mark findings as **True Positive** (reproducible bug) or **False Positive** (AI hallucination/incorrect reporting).

| Claude Finding | Manual Verification | Final Result |
|----------------|---------------------|--------------|
| Layout issue | Confirmed | True Positive |
| Contrast issue | Not Found | False Positive |

📷 **Suggested Screenshot**

Comparison between Claude output and BrowserStack.

```md
![Human Audit](images/human_audit.png)
```

---

## 3.6 Record Findings

Document all validated defects (True Positives) in the bug tracking sheet or final report.

Each entry should contain:

- **Defect ID** (e.g., UI-01, UI-02)
- **Severity** (Critical, Major, Minor, Cosmetic)
- **Category** (Layout, Typography, Color, Interaction, Responsive, Accessibility)
- **Description** of the issue
- **Environment** (Browser, OS, Device, Viewport size)
- **Steps to reproduce**
- **Recommended fix**
- **Screenshot path**

Example summary table:

| ID | Severity | Category | Description | Environment | Recommendation |
|----|----------|----------|-------------|-------------|----------------|
| UI-01 | Minor | Layout | Cart item delete buttons are misaligned horizontally. | Windows Chrome v120 | Add a flex align-items property to the container. |
| UI-02 | Major | Responsive | Coupon input overflows the screen container. | iPhone 15 Safari | Set max-width: 100% on the input field. |

---

# 4. Advanced Usage

## 4.1 Cross-browser Testing

Ensure the application compiles and renders correctly across multiple rendering engines:

- **Blink/Chromium:** Chrome and Edge (Windows).
- **Gecko:** Firefox (Windows).
- **WebKit:** Safari (macOS).

Look for rendering disparities, CSS support differences, and font sizing discrepancies.

---

## 4.2 Cross-device Testing

Run testing sessions on different physical viewports to ensure proper responsiveness:

- **Desktop (Large screen):** Windows and macOS.
- **Tablet (Medium screen):** iPad models (inspect portrait/landscape modes).
- **Mobile (Small screen):** Android and iOS (check viewport sizes, keyboard overlay handling, and touch-target sizing).

📷 **Suggested Screenshot**

BrowserStack device list.

```md
![Device List](images/device_list.png)
```

---

## 4.3 Nielsen Heuristic Review

Upload screenshots of each state of EShop checkout flow to Claude and run the heuristic prompt. Record findings systematically:

- **Violated Heuristic:** (e.g., Heuristic #5: Error prevention)
- **Severity:** (0 - 4 scale, where 4 is usability catastrophe)
- **Description:** Context of the violation.
- **Recommendation:** Actionable fix.

---

## 4.4 Compare Desktop vs Mobile

Compare the UI design on desktop vs mobile. Use Claude Vision by uploading both images side by side.

Look for:

- **Layout adaptation:** Does the grid system collapse into a single-column layout cleanly?
- **Typography size:** Is the text readable on smaller screens?
- **Touch Targets:** Are buttons and interactable links at least 48x48 dp to prevent user misclicks?
- **Navigation adjustments:** Is navigation easily reachable on mobile?
- **Overflow & Scrolling:** Ensure no horizontal scroll bars occur on mobile viewports.

📷 **Suggested Screenshot**

Desktop vs Mobile comparison.

```md
![Desktop vs Mobile](images/desktop_mobile_compare.png)
```

---

## 4.5 Summarize Findings

Compile a matrix comparing BrowserStack Manual testing and Claude Vision analysis outcomes:

| Finding | BrowserStack | Claude | Final |
|----------|-------------|---------|------|
| Layout | ✓ | ✓ | Confirmed |
| Typography | ✓ | ✓ | Confirmed |
| Contrast | ✗ | ✓ | Verified |
| Hover State | ✓ | ✗ | BrowserStack Only |

---

## 4.6 Best Practices

- **Plan sessions:** Since free accounts/trials may have limited session limits (e.g., 30-minute sessions), plan the test matrix and checklist beforehand.
- **Capture clean images:** Capture full-page, uncompressed, high-resolution screenshots ($\ge 1920\text{px}$ width) to prevent AI misanalysis.
- **Inspect CSS:** Use Pre-installed Developer Tools in the remote browser to inspect styles and confirm layout numbers.
- **Always Audit AI:** Never log a bug directly from AI output without validating it on the live environment first.
- **Log Prompts:** Log all AI queries and responses in your team's AI disclosure log.

---

# 5. Troubleshooting

## BrowserStack

| Problem | Cause | Solution |
|----------|-------|----------|
| BrowserStack Local disconnected | The local tunnel process has stopped or crashed. | Restart BrowserStack Local or verify command line parameters. |
| Localhost inaccessible | Firewall/antivirus blocks outgoing port connections, or port conflict. | Check firewall settings. Ensure backend (3000) and frontend (5173) services are active and accessible. |
| High latency / slow response | Network congestion or distance to remote server. | Check internet connection stability. Select the nearest data center location in BrowserStack settings (e.g., Singapore for Vietnam). |
| Trial time limit exceeded | Session limit of 30 minutes reached. | Prepare the test checklist before starting, prioritising critical test paths. |

---

## Claude Vision

| Problem | Cause | Solution |
|----------|-------|----------|
| False positives (hallucinations) | AI misinterprets visual details or makes assumptions. | Perform human audit verification for every single finding. |
| Incorrect analysis / misses | Poor screenshot quality, resolution, or compression. | Capture high-resolution, uncompressed screenshots (width $\ge 1920\text{px}$). |
| Missing interaction issues | Claude can only analyze static screenshot files, not animations. | Test animations, hover, scroll, and transitions manually in BrowserStack. |
| Redundant suggestions | Multiple screens show the same persistent issue (e.g., header/footer). | Deduplicate similar findings into a single global defect report. |

---

# 6. References

- [BrowserStack Live Documentation](https://www.browserstack.com/docs/)
- [Claude AI System Documentation](https://docs.anthropic.com/claude/)
- [Nielsen Norman Group: 10 Usability Heuristics](https://www.nngroup.com/articles/ten-usability-heuristics/)
- [Web Content Accessibility Guidelines (WCAG) 2.1](https://www.w3.org/TR/WCAG21/)
- [Seminar Guide - GUI & Usability Testing Workflow](file:///d:/Documents/Đại%20học/Năm%203-HCMUS/Kì%203/Kiểm%20thử%20phần%20mềm/Seminar/SoftwareTesting-GUI-Usability-Testing/Seminar_Guide.docx.pdf)
- [AI Usage Guidelines and Disclosure Policy](file:///d:/Documents/Đại%20học/Năm%203-HCMUS/Kì%203/Kiểm%20thử%20phần%20mềm/Seminar/SoftwareTesting-GUI-Usability-Testing/AI%20Usage%20Guidelines.pdf)

---

# 7. Appendix

## 7.1 Prompt Library

### General UI Review

> Review this screenshot of an e-commerce checkout page. Identify UI issues related to alignment, color contrast, typography consistency, and spacing. For each issue, describe: location on screen, what's wrong, and suggested fix.

---

### Nielsen Heuristics

> Evaluate this UI screenshot against Nielsen's 10 Usability Heuristics. For each violation found, specify: heuristic number and name, severity rating (0–4), exact location on screen, description of the problem, and recommended fix.

---

### Compare Desktop vs Mobile

> Compare these two screenshots of the same checkout flow on desktop vs. mobile. Identify any inconsistencies in layout, typography, color, or interactive elements between the two versions.

---

## 7.2 UI Checklist

| Category | Status |
|-----------|--------|
| Layout | [ ] |
| Typography | [ ] |
| Color | [ ] |
| Buttons | [ ] |
| Forms | [ ] |
| Accessibility | [ ] |
| Responsive | [ ] |

---

## 7.3 AI Usage Declaration

Record:

- **AI Tool:** Claude 3.5 Sonnet / Claude Vision
- **Version / Endpoint:** Web UI / API
- **Prompts Used:** (Refer to Appendix 7.1 for exact text)
- **AI Output Summary:** List of suggestions generated by Claude
- **Human Verification Result:** Number of suggestions verified (True Positives vs False Positives)

---

## 7.4 Human Validation Checklist

| Check | Status |
|---------|--------|
| Browser tested | [ ] |
| Devices tested | [ ] |
| Screenshots collected | [ ] |
| Claude review completed | [ ] |
| Human audit completed | [ ] |
| Bug report completed | [ ] |

---

## 7.5 Evidence Checklist

- [ ] BrowserStack screenshots (saved in `browserstack/`)
- [ ] Claude responses (saved in `claude-review/`)
- [ ] Human audit records (saved in `reports/`)
- [ ] Final bug reports (saved in `reports/`)
- [ ] UI checklist (completed and signed off)
