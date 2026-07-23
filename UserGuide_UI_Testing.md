# Manual UI Testing Report: EShop Cart Screen
## BrowserStack Live + Claude Vision + Human Audit

> **Seminar topic:** GUI & Usability Testing
> **Responsible part:** UI Testing
> **Tools used:** BrowserStack Live, BrowserStack Local, Claude Vision
> **System under test:** EShop — Cart screen (FR-07)
> **Test device:** Samsung Galaxy S26 (Android, Chrome)
> **Date:** 23/07/2026

---

# 1. Introduction

## 1.1 Purpose

This report documents the Manual UI Testing performed on the EShop Cart screen, combining three layers:

1. **Manual testing** on a real device via BrowserStack Live, following a three-category GUI checklist.
2. **AI-assisted review** using Claude Vision, with the FR-07 specification embedded in the prompt.
3. **Human Audit** to verify every AI finding, adjust severity ratings, and consolidate duplicate reports.

The goal is not only to find defects, but to establish where each tool is effective and where human judgement remains necessary.

---

## 1.2 Scope

**In scope:**

- EShop Cart screen (FR-07), tested on Samsung Galaxy S26 / Chrome via BrowserStack Live.
- Three GUI checklist categories: Layout & Style, Interaction, Responsive & Accessibility.
- Compliance check against SRS FR-07 (6 requirements).

**Out of scope (not tested in this round):**

- Coupon, Address, Payment, and Success screens — the checkout flow beyond the Cart was not covered.
- Cross-browser testing on desktop browsers (Firefox, Safari, Edge).
- Nielsen Heuristic evaluation and desktop-vs-mobile comparison prompts.

This report contains only observed results. No defects or measurements were fabricated.

---

## 1.3 Tool Overview

### BrowserStack Live

A cloud platform providing remote access to real browsers and physical devices, removing the need to maintain a device lab.

Features used in this round:

- **Real device access** — Samsung Galaxy S26 running Chrome.
- **BrowserStack Local** — secure tunnel allowing the remote device to reach the EShop instance running on `localhost`.
- **Device rotation** — used to confirm that layout breakage was width-dependent rather than a data issue.
- **Screenshot capture and annotation** — one-click capture with device metadata attached, plus on-image markup.

DevTools is available in BrowserStack Live but was not used in this round; all verification was performed by visual inspection and interaction on the device.

### Claude Vision

A multimodal AI model that analyses screenshot images and reports potential UI issues. It served as a "second pair of eyes" over the manual inspection.

Reviewed areas: layout, spacing, typography, touch-target sizing, and compliance with a supplied specification.

**Known limitations, confirmed during this round:**

- Analyses static images only — cannot evaluate behaviour that requires interaction.
- Cannot assess anything outside the captured viewport.
- Assigns severity based on visual prominence rather than business impact.

> [!IMPORTANT]
> Every Claude finding was manually verified before being recorded. AI output was never logged directly as a defect.

---

## 1.4 Workflow

```text
Run EShop (local)
      │
      ▼
BrowserStack Live + Local tunnel
      │
      ▼
Manual UI Testing (3-category checklist)
      │
      ▼
Capture screenshot + annotation
      │
      ▼
Claude Vision review (UI + SRS compliance)
      │
      ▼
Human Audit (verify, re-rate, consolidate)
      │
      ▼
Bug report
```

---

# 2. Setup

## 2.1 BrowserStack Account and Local Tunnel

1. Registered a BrowserStack account and signed in to the Live dashboard.
2. Downloaded and ran the BrowserStack Local application, establishing a tunnel to the local machine.
3. Verified tunnel status showed **Connected**, then confirmed reachability using the **Test your URL** function against `http://localhost:5173` (HTTP 200).

![BrowserStack Live device selection](/browserstack_dashboard.png)


![BrowserStack Local tunnel connected](/browserstack_local_connected.png)


> [!NOTE]
> **Issue encountered:** the tunnel initially returned `ECONNREFUSED 127.0.0.1:5173` despite showing Connected. Root cause: Vite was listening only on IPv6 (`::1`) while the tunnel probed IPv4. Fixed by adding `server.host: true` to `vite.config.js`. See Section 5.

---

## 2.2 Running the EShop System

```bash
# Terminal 1 — Backend
cd eshop-sut/backend
npm install
node database.js     # seed database (run once)
node server.js       # API server on port 3000

# Terminal 2 — Frontend Web
cd eshop-sut/frontend-web
npm install
npm run dev          # storefront on port 5173
```

Services verified:

| Component | URL | Status |
|---|---|---|
| Backend API | http://localhost:3000 | Running |
| Frontend Web | http://localhost:5173 | Running |

Test account used: `test@eshop.com` / `Test1234!`

---

## 2.3 Test Matrix

The following matrix was defined for the UI testing scope:

| Browser | Desktop | Mobile |
|---|---|---|
| Chrome | Windows (latest), macOS (latest) | Android — Samsung Galaxy S26 |
| Firefox | Windows (latest) | — |
| Safari | macOS (latest) | iOS — iPhone 15 |
| Edge | Windows (latest) | — |

> [!NOTE]
> **Coverage achieved in this round:** only the **Samsung Galaxy S26 / Chrome** combination was executed. The remaining combinations are planned but not yet covered — findings in this report should be read as mobile-Chrome specific and are not confirmed on other rendering engines.

---

## 2.4 GUI Checklist

Inspection was organised into three categories:

| # | Category | Items inspected |
|---|---|---|
| 01 | **Layout & Style** | Alignment, typography, colour and contrast, content overflow |
| 02 | **Interaction** | Button states, form behaviour, destructive-action confirmation |
| 03 | **Responsive & Accessibility** | Layout adaptation across viewport widths, touch-target sizing |

---

## 2.5 Severity Scale

Severity is rated by **impact on the business flow**, not by how visually prominent the defect appears.

| Level | Definition |
|---|---|
| **Critical** | Blocks the main flow entirely: the user cannot complete the task, or data / monetary values are incorrect. |
| **Major** | The flow still works, but causes clear confusion or difficulty. |
| **Minor** | Deviates from the design or specification, but does not obstruct usage. |
| **Cosmetic** | Aesthetic only, no functional impact. |

Verification status:

| Status | Definition |
|---|---|
| **True Positive** | Defect confirmed to exist after manual verification. |
| **False Positive** | AI reported a defect that does not exist — excluded from the report. |
| **Needs further investigation** | Signs of a defect, but not yet reproduced reliably. |

---

## 2.6 Evidence Storage

Evidence collected in this round consists of:

- Setup and session screenshots.
- Screenshots of the Cart screen captured through BrowserStack, with device metadata attached.
- `Bug_Tracking_Simple.xlsx` — the defect log.

---

# 3. Test Execution

## 3.1 Manual Testing by Checklist

Testing was performed on the Cart screen at `http://localhost:5173` inside the BrowserStack Live session.

![EShop running on Samsung Galaxy S26](/browser_selection.png)

### Category 01 — Layout & Style

| Observation | Result |
|---|---|
| The "Giỏ hàng" navigation label wraps and overlaps the EShop logo in the header | Fail |
| Currency symbol "đ" wraps onto a separate line from the amount, in every price cell | Fail |

### Category 02 — Interaction

The cart under test contained four product rows, including "Samsung Galaxy S24 Ultra" and two separate rows for "iPhone 15 Pro Max".

| Test performed | Expected (SRS FR-07) | Actual | Result |
|---|---|---|---|
| Tapped the Delete button on a cart row | A confirmation dialog appears before deletion | The item was removed immediately with no confirmation | Fail |
| Added "iPhone 15 Pro Max" again while already in the cart | Quantity increases on the existing row | A new duplicate row was created | Fail |

### Category 03 — Responsive

| Observation | Result |
|---|---|
| The five-column table does not collapse at ~380px width; all headers and cells wrap | Fail |
| Rotating to landscape gave the table more width and improved rendering — confirming the issue is width-dependent, not a data problem | Confirmed diagnosis |

---

## 3.2 Evidence Capture

Screenshots were captured using BrowserStack's one-click screenshot tool, which attaches device, OS, and browser metadata automatically. The annotation tool was used to mark the defective header region before export.

---

## 3.3 Claude Vision Review

The cropped screenshot (phone viewport only) was uploaded to Claude Sonnet 5 together with a single prompt containing three blocks:

1. **Context** — Cart screen of an e-commerce web application, captured on Samsung Galaxy S26, mobile viewport, Vietnamese language.
2. **Specification** — the full text of SRS FR-07 (6 requirements).
3. **Tasks** — (a) review the UI for layout, overflow, typography, spacing, touch-target and responsive issues, each with location, description, severity and suggested fix, limited to the 7 most important; (b) compare the screenshot against each SRS requirement, returning one of *Pass* / *Violation* / *Cannot be verified from the image*, and propose manual test steps for anything unverifiable.

The exact prompt text is in Appendix 7.1.

![Claude Vision review session](/claude_review.png)

### Result — Part 1: UI review

Claude returned 7 issues:

| # | Issue | Claude's severity |
|---|---|---|
| 1 | Quantity column misaligned, value pushed against the Price column | Critical |
| 2 | No +/− controls in the Quantity column | Critical |
| 3 | Long product names wrap across 2–3 lines, uneven row heights | Major |
| 4 | Table header row heights inconsistent between columns | Minor |
| 5 | Delete button touch target below the 44×44px minimum | Major |
| 6 | "iPhone 15 Pro Max" appears in two separate rows | Critical |
| 7 | Insufficient padding between the Price and Quantity columns | Cosmetic / Minor |

![Claude Vision review session](/claude_review2.png)

### Result — Part 2: SRS compliance

| Requirement | Claude's verdict |
|---|---|
| FR-07.1 — column labels and +/− controls | Violation |
| FR-07.2 — duplicate products must merge | Violation |
| FR-07.3 — delete confirmation dialog | Cannot be verified from the image |
| FR-07.4 — "Tiếp tục mua sắm" button | Cannot be verified from the image |
| FR-07.5 — total label must read "Tổng cộng" | Cannot be verified from the image |
| FR-07.6 — empty cart state | Cannot be verified from the image |

Claude marked **4 of 6 requirements as unverifiable** and proposed manual test steps for each. Three distinct reasons applied: the behaviour required interaction (FR-07.3), the elements lay outside the captured viewport (FR-07.4, FR-07.5), or the state did not exist in the current data (FR-07.6).

![Claude Vision review session](/claude_review3.png)

---

## 3.4 Human Audit

Each AI finding was verified against the live application before being recorded.

### Audit of the 7 UI findings

| Claude # | Verification method | Status | Claude severity | Final severity | Decision |
|---|---|---|---|---|---|
| 1 | Visual check on device | True Positive | Critical | **Major** | Downgraded — quantity value and line total are still correct and checkout is not blocked; the issue is legibility only |
| 2 | Visual check on device | True Positive | Critical | **Critical** | Retained — no quantity control is reachable anywhere on the screen. Changing quantity requires deleting and re-adding the item, so the flow is genuinely blocked. Whether the control is missing from the markup or hidden by CSS was not determined |
| 3 | Visual check on device | True Positive | Major | **Minor** | Merged with #4 into one entry; affects scannability, not operation |
| 4 | Visual check on device | True Positive | Minor | — | Merged into the entry above |
| 5 | Visual estimate only — not measured | **Needs further investigation** | Major | Major (provisional) | The button is a plain text link with no padding, so the target is visibly small, but no measurement was taken during the session. Recorded provisionally pending measurement |
| 6 | Also reproduced manually during Category 02 testing | True Positive | Critical | **Major** | Same defect already logged from manual testing — not duplicated. Downgraded: the cart total is still calculated correctly, so no monetary error occurs |
| 7 | Visual check on device | True Positive | Cosmetic/Minor | — | Not an independent defect: it is a consequence of the table compression already logged under Responsive |

### Audit of the 4 unverifiable SRS requirements

| Requirement | Manual test performed | Result |
|---|---|---|
| FR-07.3 | Tapped Delete on a cart row | Violation — no confirmation dialog |
| FR-07.6 | Removed all items to create the empty state | Violation — the message "Giỏ hàng của bạn đang trống" is present, but the illustration required by the spec is missing |
| FR-07.4 | Scrolled to the bottom, inspected and clicked the button | Violation on label — reads "Mua tiếp" instead of "Tiếp tục mua sắm". Navigation to the home page works correctly |
| FR-07.5 | Scrolled to the bottom, read the total label | Violation — reads "Tổng tạm tính", the exact wording the spec prohibits |

**All 6 SRS requirements were found to be in violation.** Claude could conclude only 2 of them from the screenshot; the remaining 4 required interaction, state creation, or scrolling beyond the captured viewport.

---

# 4. Results

## 4.1 Defect Log

12 entries were recorded in `Bug_Tracking_Simple.xlsx`:

| # | Category | Location | Description | Severity | Status |
|---|---|---|---|---|---|
| 1 | Layout & Style | Header | "Giỏ hàng" label overlaps the logo | Major | True Positive |
| 2 | Layout & Style | Price column | Currency symbol wraps onto its own line | Major | True Positive |
| 3 | Interaction | Delete button | No confirmation dialog before deletion | Major | True Positive |
| 4 | Interaction | Product list | Duplicate product creates a new row instead of merging quantity | Major | True Positive |
| 5 | Responsive & Accessibility | Whole cart | Five-column table does not collapse on mobile | Critical | True Positive |
| 6 | Layout & Style | Product table | Product names wrap 2–3 lines, uneven row heights | Minor | True Positive |
| 7 | Layout & Style | Quantity column | Quantity misaligned, pushed against Price | Major | True Positive |
| 8 | Interaction | Quantity column | +/− controls missing | Critical | True Positive |
| 9 | Interaction | Delete button | Touch target appears undersized | Major | Needs further investigation |
| 10 | Layout & Style | Empty cart page | Text-only empty state; illustration required by SRS is missing | Minor | True Positive |
| 11 | Layout & Style | Back button | Label reads "Mua tiếp" instead of "Tiếp tục mua sắm"; navigation works | Minor | True Positive |
| 12 | Layout & Style | Total line | Label reads "Tổng tạm tính" instead of "Tổng cộng" | Minor | True Positive |

**Breakdown by severity:** 2 Critical, 6 Major, 4 Minor.
**Breakdown by category:** Layout & Style 7, Interaction 4, Responsive & Accessibility 1.
**Verification status:** 11 True Positive, 1 needs further investigation, 0 False Positive.

---

## 4.2 Tool Contribution

| Defect source | Count | Log entries | Notes |
|---|---|---|---|
| Found by manual testing only | 5 | 1, 2, 10, 11, 12 | Header overlap and currency wrapping were not reported by Claude at all. The remaining three required interaction, state creation, or scrolling beyond the captured viewport |
| Found by Claude only | 4 | 6, 7, 8, 9 | Name wrapping (merged with header row height), quantity misalignment, missing +/− controls, and the suspected undersized touch target (entry 9, not yet measured) |
| Found by both | 3 | 3, 4, 5 | Delete confirmation, duplicate rows, table not collapsing |

Total: 5 + 4 + 3 = 12 logged defects.

Of the 7 issues Claude reported, 4 produced new log entries; 1 (duplicate rows) had also been found manually, and 2 were consolidated into existing entries as consequences of the same root cause.

Notably, two purely visual defects — the header label overlapping the logo, and the currency symbol wrapping onto its own line — were found by manual inspection but **not** reported by Claude, despite both being visible in the submitted screenshot. AI review is fast and broad, but not exhaustive.

Two severity ratings were adjusted during the audit — one downgraded, one retained after verification, despite both having been rated Critical by the AI.

No false positives occurred in this round. This is not evidence that they do not occur; the audit step remains mandatory.

---

## 4.3 Observations

**AI is fast but biased toward surface issues, and not exhaustive.** Claude produced 7 findings in roughly 30 seconds, all concerning what is visible in the image: alignment, spacing, label text, and element sizing. This is genuine value — several of these are easy for a human to overlook after prolonged inspection. However, it also missed two visible defects that manual inspection caught: the header label overlapping the logo, and the currency symbol wrapping onto a separate line. Speed does not imply completeness.

**Humans catch context-dependent issues.** Four of the six specification requirements could not be assessed from a screenshot at all. The confirmation dialog required tapping; the empty-cart state had to be created by deleting every item; two labels lay below the captured viewport. None of these are inferable from a static image.

**Severity must be human-final.** Findings #1 and #2 were both rated Critical by the AI. After verification, #1 was downgraded to Major — the values displayed remain correct and checkout is unaffected — while #2 was retained as Critical, since the absence of quantity controls forces the user to delete and re-add an item to change quantity. The AI rated by visual prominence; the human rated by business impact.

**Verification depth was limited to visual inspection.** No measurements or DOM inspection were performed in this round, so entry 9 (touch-target size) remains unresolved, and for entry 8 it was not established whether the quantity control is absent from the markup or merely hidden. Both conclusions rest on what is observable on screen, which is sufficient to confirm the defect from a user's perspective but not to diagnose its cause.

**AI reports symptoms, humans identify root causes.** Claude listed the narrow column padding (#7) as a standalone defect. It is in fact a consequence of the table failing to collapse on mobile, already logged under Responsive. Recording it separately would have produced two tickets for one underlying fix.

---

# 5. Issues Encountered

| Problem | Cause | Resolution |
|---|---|---|
| Live session displayed "Download Local App" despite the tunnel showing Connected | The Local tunnel and the Live dashboard were signed in under different BrowserStack accounts | Signed both into the same account; confirmed the Access Key matched on both sides |
| `ECONNREFUSED 127.0.0.1:5173` from Test your URL while `localhost:5173` opened fine in a local browser | Vite was listening on IPv6 (`::1`) only; the tunnel probed IPv4 | Added `server.host: true` to `vite.config.js` and restarted the dev server |
| "Blocked request. This host (bs-local.com) is not allowed" when testing from an iOS device | Vite's `allowedHosts` protection | Added `allowedHosts: ['bs-local.com']` to `vite.config.js` |
| Two `BrowserStackLocal` processes running simultaneously caused `onlyAutomate` mode, invisible to Live | The GUI application and the CLI binary were launched at the same time | Terminated all processes and started only one instance |
| Free-trial session minutes exhausted mid-testing | Trial account limits | Prepared the checklist before opening a session so that session time is spent testing rather than planning |

---

# 6. Conclusion and Next Steps

Twelve defects were recorded on the Cart screen, including two Critical issues: the table failing to collapse on mobile, and the absence of quantity controls required by the specification. All six FR-07 requirements were found to be in violation.

The two tools proved complementary rather than interchangeable. Claude Vision was substantially faster at surfacing visible layout and sizing problems, while manual testing on a real device was the only way to establish behavioural and state-dependent defects — which accounted for four of the six specification violations. The Human Audit step was necessary in both directions: to adjust severity ratings that the AI had assigned by visual prominence, and to consolidate findings that shared a single root cause.

**Not yet covered, recommended for the next round:**

- The remaining checkout screens: Coupon, Address, Payment, Success.
- The remaining test-matrix combinations, particularly desktop browsers and WebKit (Safari / iPhone), to confirm whether these defects are engine-specific.
- Measurement of defect #9 (Delete button touch target) against the 44×44px minimum, to resolve its provisional status.
- DOM-level inspection of defect #8 to establish whether the quantity control is missing from the markup or hidden by CSS, which determines the nature of the fix.
- Nielsen Heuristic evaluation and a desktop-versus-mobile comparison, both of which were prepared but not executed in this round.

---

# 7. Appendix

## 7.1 Prompt Used

```
Đây là ảnh chụp màn hình trang Giỏ hàng của một ứng dụng web thương mại
điện tử (EShop), chụp trên điện thoại Samsung Galaxy S26 (màn hình
mobile, trình duyệt Chrome). Ngôn ngữ của ứng dụng là tiếng Việt.

Dưới đây là đặc tả yêu cầu (SRS) cho chức năng này:

--- SRS FR-07: Giỏ hàng ---
1. Hiển thị danh sách sản phẩm với các cột: "Sản phẩm", "Đơn giá",
   "Số lượng" (có nút +/- để chỉnh), "Thành tiền", "Thao tác".
2. Thêm cùng một sản phẩm vào giỏ sẽ tăng số lượng, không tạo dòng mới.
3. Nút Xóa sản phẩm phải có dialog xác nhận trước khi thực hiện.
4. Có nút "Tiếp tục mua sắm" để quay về trang chủ.
5. Tổng tiền hiển thị nhãn chính xác: "Tổng cộng" (không phải
   "Tổng tạm tính").
6. Giỏ hàng trống phải có hình minh họa và thông báo rõ ràng.
--- Hết SRS ---

Hãy thực hiện 2 phần đánh giá sau:

PHẦN 1 — REVIEW GIAO DIỆN TỔNG QUÁT:
Tìm các lỗi thuộc các nhóm: bố cục & căn chỉnh, tràn nội dung & xuống
dòng sai, nhất quán typography, khoảng cách, kích thước vùng chạm, và
lỗi responsive trên màn hình nhỏ. Với mỗi lỗi: vị trí chính xác, mô tả,
vì sao là vấn đề trên mobile, mức độ (Critical/Major/Minor/Cosmetic),
đề xuất sửa. Giới hạn 7 lỗi quan trọng nhất.

PHẦN 2 — ĐỐI CHIẾU VỚI SRS:
So sánh ảnh với TỪNG yêu cầu trong SRS, trả về bảng:
Số yêu cầu | Trạng thái | Bằng chứng trong ảnh | Ghi chú.
Trạng thái chỉ dùng: "Đạt" / "Vi phạm" / "Không kiểm chứng được từ ảnh".

Cuối cùng, liệt kê các yêu cầu cần kiểm thử thủ công bổ sung và nêu
thao tác kiểm thử cụ thể cho từng yêu cầu.
```

---

## 7.2 GUI Checklist — Completion Status

| Category | Status | Notes |
|---|---|---|
| Layout & Style | Completed | 7 defects recorded |
| Interaction | Completed | 4 defects recorded |
| Responsive & Accessibility | Partially completed | Width-based responsive behaviour tested; tab order and alt-text not assessed |

---

## 7.3 AI Usage Declaration

| Item | Detail |
|---|---|
| AI tool | Claude Sonnet 5 (Vision), web interface |
| Number of prompts | 1 combined prompt (UI review + SRS compliance) |
| Prompt text | See Appendix 7.1 |
| Output | 7 UI findings, 6-row SRS compliance table, manual test suggestions for 4 unverifiable requirements |
| Human verification | All 7 findings audited. Result: 6 True Positive, 1 needs further investigation, 0 False Positive. Of these, 4 produced new log entries, 1 duplicated an entry already logged during manual testing, and 2 were consolidated as symptoms of an already-logged root cause. 2 severity ratings were adjusted |

---

## 7.4 Evidence

| Evidence | File | Referenced in |
|---|---|---|
| BrowserStack device selection | `browserstack_dashboard.png` | §2.1 |
| Local tunnel connected | `browserstack_local_connected.png` | §2.1 |
| EShop on Galaxy S26 via tunnel | `browser_selection.png` | §3.1 |
| Claude Vision prompt submission | `claude_review.png` | §3.3 |
| Claude Vision UI findings table | `claude_review2.png` | §3.3 |
| Claude Vision SRS compliance table | `claude_review3.png` | §3.3 |
| Defect log (12 entries) | `Bug_Tracking_Simple.xlsx` | §4.1 |

> [!NOTE]
> Annotated defect screenshots captured during manual testing were not exported from the BrowserStack session and are therefore not attached to this report. Section 4.1 remains the authoritative defect record.

---

# 8. References

- [BrowserStack Live Documentation](https://www.browserstack.com/docs/)
- [Claude Documentation](https://docs.claude.com/)
- [Web Content Accessibility Guidelines (WCAG) 2.1](https://www.w3.org/TR/WCAG21/)
- EShop SRS — FR-07: Shopping Cart