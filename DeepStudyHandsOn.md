# Báo cáo: Deep Study & Hands-on Practice

**Tên trường/tổ chức:** [Tên trường/tổ chức]  
**Tên đề tài:** [Tên đề tài]  
**Tên thành viên nhóm:** [Tên các thành viên]  
**Ngày tháng:** [Ngày/Tháng/Năm]  

---

## I. Tóm tắt (Executive Summary)
*Tóm tắt ngắn gọn toàn bộ báo cáo: Đã nghiên cứu gì, đã thực hành làm được gì cho cả UI và Usability testing, và kết quả chung ra sao.*

---

## II. PHẦN 1: UI TESTING (Kiểm thử Giao diện Người dùng)

### 1. Cơ sở lý thuyết / Nghiên cứu sâu (Deep Study)

#### A. Manual UI Testing với BrowserStack (Phương pháp truyền thống)

**Khái niệm:** Manual UI Testing là quá trình tester trực tiếp tương tác với giao diện ứng dụng, quan sát bằng mắt và thao tác thủ công để xác minh rằng các thành phần UI hiển thị đúng thiết kế và hoạt động đúng yêu cầu chức năng. Khác với Automated UI Testing (dùng script để chạy tự động), Manual UI Testing tập trung vào những khía cạnh mà máy khó đánh giá — tính thẩm mỹ, cảm nhận tổng thể, và trải nghiệm tương tác trực quan.

**BrowserStack là gì?**

BrowserStack là nền tảng cloud cho phép tester **truy cập từ xa vào hàng nghìn tổ hợp trình duyệt, OS, và thiết bị thật** để thực hiện manual testing mà không cần cài đặt phần cứng. Tính năng **BrowserStack Live** cho phép mở trình duyệt thật trên máy ảo/thiết bị thật, tương tác trực tiếp như đang dùng máy tính riêng.
**Các loại kiểm tra thủ công trên BrowserStack:**

| # | Loại kiểm tra | Mô tả | Ví dụ trên EShop Checkout |
|---|---|---|---|
| 1 | **Layout & Alignment** | Kiểm tra vị trí, khoảng cách, padding/margin của các element so với mockup/design spec | Nút "Thanh toán" có căn giữa không, khoảng cách giữa các item trong giỏ hàng có đều không |
| 2 | **Typography** | Font family, font size, font weight, line-height, color đúng design system | Tiêu đề sản phẩm dùng đúng font, giá tiền dùng đúng weight bold |
| 3 | **Color & Contrast** | Màu sắc đúng palette, contrast ratio đạt chuẩn WCAG 2.1 AA (≥ 4.5:1 cho text thường, ≥ 3:1 cho text lớn) | Text màu xám trên nền trắng có đủ tương phản để đọc không |
| 4 | **Cross-browser / Cross-device** | Giao diện hiển thị chính xác trên nhiều trình duyệt và thiết bị thật qua BrowserStack Live | Form thanh toán có bị vỡ layout trên Safari iOS không, nút có bị che khuất trên Samsung Galaxy không |
| 5 | **State & Interaction** | Kiểm tra các trạng thái UI: hover, focus, active, disabled, error, loading, empty state | Nút "Áp dụng coupon" khi disabled có đổi màu không, input lỗi có viền đỏ không |
| 6 | **Content & Overflow** | Kiểm tra text truncation, overflow khi nội dung dài, dynamic content length | Tên sản phẩm quá dài có bị tràn ra ngoài khung không, giá tiền nhiều chữ số có bị cắt không |
| 7 | **Accessibility (cơ bản)** | Tab order hợp lý, focus indicator rõ ràng, alt text cho hình ảnh, label cho input | Có thể dùng Tab để điều hướng qua toàn bộ form thanh toán không |

**Best practices khi thực hiện Manual UI Testing trên BrowserStack:**

- Xây dựng **UI Test Checklist** dựa trên design spec — mỗi item ghi rõ Expected vs. Actual.
- Chọn **ma trận test** hợp lý: ít nhất 3 trình duyệt (Chrome, Firefox, Safari) × 3 loại thiết bị (desktop, tablet, mobile).
- Dùng **BrowserStack Local** để tunnel đến app chạy trên localhost — không cần deploy staging.
- Tận dụng tính năng **screenshot 1-click** và **bug annotation** để ghi nhận defect nhanh chóng.
- Kết hợp **Exploratory Testing** bên cạnh checklist: tester tự do thao tác, "phá" UI để tìm lỗi ngoài kịch bản.
- Dùng **Pre-installed DevTools** trên remote browser để inspect CSS, kiểm tra computed styles.

#### B. Claude Vision UI Review (Công cụ AI)

**Nguyên lý hoạt động:** Claude là một multimodal LLM có khả năng xử lý ảnh (vision). Khi upload screenshot giao diện, Claude phân tích layout, text, color, spacing và đối chiếu với các tiêu chí UI/UX để đưa ra danh sách findings kèm giải thích.

**Cách viết prompt hiệu quả:**

- **Prompt cơ bản (review UI issues):**
  > *"Review this screenshot of an e-commerce checkout page. Identify UI issues related to alignment, color contrast, typography consistency, and spacing. For each issue, describe: location on screen, what's wrong, and suggested fix."*

- **Prompt nâng cao (theo Nielsen Heuristics):**
  > *"Evaluate this UI screenshot against Nielsen's 10 Usability Heuristics. For each violation found, specify: heuristic number and name, severity rating (0–4), exact location on screen, description of the problem, and recommended fix."*

- **Prompt so sánh consistency:**
  > *"Compare these two screenshots of the same checkout flow on desktop vs. mobile. Identify any inconsistencies in layout, typography, color, or interactive elements between the two versions."*

**Quy trình Human Audit (bắt buộc):**

Mọi finding của Claude **bắt buộc phải được tester kiểm chứng** trước khi ghi nhận là bug:

1. Claude trả về danh sách findings.
2. Tester mở app thật (trên BrowserStack hoặc local), kiểm tra từng finding.
3. Phân loại: **True Positive** (lỗi có thật) hoặc **False Positive** (AI báo sai).
4. Chỉ ghi nhận True Positive vào bug report chính thức.

**Limitations của Claude Vision:**

- Không tương tác được với app → **không test được** hover, animation, scroll, transition.
- Có thể hallucinate — báo lỗi không tồn tại (false positive).
- Chất lượng phân tích phụ thuộc chất lượng screenshot và prompt.
- Không thay thế manual testing, chỉ đóng vai trò **bổ trợ** ("second pair of eyes").

### 2. Quá trình thực hành thực tế (Hands-on Practice)

#### Phase 1 — Manual UI Testing trên BrowserStack

* **Chuẩn bị môi trường:**
    * Đăng ký tài khoản **BrowserStack** (free trial hoặc gói Live).
    * Cài đặt **BrowserStack Local** để kết nối đến EShop chạy trên localhost (nếu chưa deploy staging).
    * Tạo **UI Test Checklist** trên Google Sheets với các cột: Test Case ID, Màn hình, Trình duyệt/Thiết bị, Mô tả kiểm tra, Expected Result, Actual Result, Status (Pass/Fail), Screenshot Link, Ghi chú.
    * Xác định **ma trận test** (test matrix):

| Trình duyệt | Desktop (Windows) | Desktop (macOS) | Mobile |
|---|---|---|---|
| Chrome (latest) | ✅ | ✅ | Android — Samsung Galaxy S23 |
| Firefox (latest) | ✅ | — | — |
| Safari (latest) | — | ✅ | iOS — iPhone 15 |
| Edge (latest) | ✅ | — | — |

* **Các bước thực hiện:**
    * **Bước 1 — Trang Cart (Giỏ hàng):** Mở BrowserStack Live → chọn trình duyệt/thiết bị → truy cập EShop → kiểm tra grid layout danh sách sản phẩm, nút tăng/giảm số lượng (+/−), nút xóa item, hiển thị tổng tiền, empty cart state.
    * **Bước 2 — Form Coupon:** Kiểm tra input field coupon, nút "Áp dụng", trạng thái khi áp dụng thành công (hiển thị discount), trạng thái khi coupon không hợp lệ (error message), edge case coupon đã hết hạn.
    * **Bước 3 — Form Address (Địa chỉ):** Kiểm tra các required fields có highlight khi bỏ trống, error messages rõ ràng và đúng vị trí, auto-fill behavior, layout form trên mobile devices thật.
    * **Bước 4 — Trang Payment (Thanh toán):** Kiểm tra radio button chọn phương thức thanh toán, form nhập thông tin credit card (masking, validation), nút Submit/Đặt hàng, loading state khi xử lý.
    * **Bước 5 — Cross-browser/Cross-device:** Lặp lại bước 1–4 trên từng tổ hợp trong ma trận test. Dùng BrowserStack screenshot để so sánh rendering giữa các trình duyệt.
    * **Bước 6 — Ghi nhận defect:** Với mỗi lỗi tìm thấy, dùng BrowserStack annotation → chụp screenshot → log vào checklist kèm thông tin trình duyệt/thiết bị/OS.

#### Phase 2 — Claude Vision AI Review

* **Chuẩn bị:**
    * Chụp screenshot đầy đủ (full-page, resolution cao) cho tất cả 4 màn hình ở các trạng thái: default, error, success. Chụp trên **nhiều thiết bị** từ BrowserStack (desktop Chrome, mobile Safari, tablet…) để có ảnh đa dạng.

* **Các bước thực hiện:**
    * **Bước 1 — Review từng màn hình:** Upload lần lượt screenshot Cart, Coupon, Address, Payment → yêu cầu Claude review UI issues (dùng prompt cơ bản).
    * **Bước 2 — So sánh consistency:** Upload cặp screenshot từ BrowserStack (ví dụ: Cart trên Chrome desktop vs. Cart trên Safari iPhone) → yêu cầu Claude tìm sự không nhất quán.
    * **Bước 3 — Đánh giá theo Nielsen Heuristics:** Upload screenshot + dùng prompt nâng cao → yêu cầu Claude đánh giá từng heuristic.
    * **Bước 4 — Human Audit:** Với mỗi finding Claude trả về, tester mở lại BrowserStack Live trên cùng trình duyệt/thiết bị để kiểm chứng → đánh dấu True Positive / False Positive trong bảng kết quả.

* **Log AI Usage:** Ghi lại prompt đã dùng, output của Claude, và kết quả audit vào `ai-disclosure/AI_Usage_Log.md` (theo AI Policy §7).

### 3. Kết quả đạt được & Đánh giá (Results & Evaluation)

**Bảng tổng hợp findings:**

| Metric | BrowserStack Manual | Claude Vision | Tổng cộng |
|---|---|---|---|
| Tổng findings phát hiện | — | — | — |
| True Positive (lỗi xác nhận) | — | — | — |
| False Positive (báo sai) | 0 | — | — |
| Unique findings (chỉ 1 phương pháp tìm ra) | — | — | — |

*(Bảng sẽ được điền sau khi hoàn thành thực hành trên EShop.)*

**Phân loại defects theo Severity × UI Category:**

| Severity ↓ \ Category → | Layout | Typography | Color | State | Cross-browser | Content | A11y |
|---|---|---|---|---|---|---|---|
| Critical | — | — | — | — | — | — | — |
| Major | — | — | — | — | — | — | — |
| Minor | — | — | — | — | — | — | — |
| Cosmetic | — | — | — | — | — | — | — |

*(Bảng sẽ được điền sau khi hoàn thành thực hành trên EShop.)*

**Đánh giá mức độ bổ trợ giữa 2 phương pháp:**

- BrowserStack Manual Testing phát hiện tốt các lỗi **tương tác** (hover, animation, scroll), **cross-browser/cross-device** trên thiết bị thật — những thứ Claude Vision không thể kiểm tra.
- Claude Vision phát hiện tốt các lỗi **visual** mà mắt người dễ bỏ qua (contrast ratio thấp, inconsistency nhỏ giữa các màn hình).
- Kết luận: hai phương pháp **bổ trợ lẫn nhau**, không thay thế nhau.

### 4. Khó khăn và Hướng giải quyết (Troubleshooting)

**BrowserStack Manual Testing:**

| Khó khăn | Cách giải quyết |
|---|---|
| Free trial giới hạn thời gian (30 phút live session/lần, giới hạn tổng) | Lên kế hoạch test matrix rõ ràng trước khi mở session, ưu tiên test các tổ hợp trình duyệt quan trọng nhất |
| Độ trễ (latency) khi thao tác trên remote device — thao tác không mượt như local | Kiểm tra kết nối mạng trước khi test, chọn data center gần nhất (ví dụ: Singapore cho Việt Nam) |
| BrowserStack Local tunnel đôi khi không kết nối được đến localhost | Kiểm tra firewall, đảm bảo port EShop không bị block; thử deploy lên staging thay vì dùng local |
| Tốn thời gian regression test khi dev fix bug → phải kiểm tra lại trên nhiều trình duyệt | Ưu tiên re-test trên trình duyệt đã phát hiện bug + 1 trình duyệt khác để cross-check |

**Claude Vision:**

| Khó khăn | Cách giải quyết |
|---|---|
| False positive — Claude báo lỗi nhưng thực tế không phải lỗi | Bắt buộc human audit mọi finding; dùng công cụ Contrast Checker để kiểm chứng các lỗi về color |
| Screenshot chất lượng thấp → Claude phân tích sai | Chụp full-page, resolution cao (≥1920px width), không nén ảnh — dùng BrowserStack screenshot feature |
| Findings trùng lặp giữa các screenshot | Deduplicate: gom các finding trùng thành 1 defect duy nhất trước khi tổng hợp |
| Không test được dynamic UI (hover, animation, scroll) | Bổ sung bằng manual testing trên BrowserStack ở Phase 1 — đây là lý do cần kết hợp cả hai phương pháp |

---

## III. PHẦN 2: USABILITY TESTING (Kiểm thử Tính Khả dụng)

### 1. Cơ sở lý thuyết / Nghiên cứu sâu (Deep Study)
* Các nguyên tắc heuristic trong Usability, tâm lý người dùng.
* Cách thiết kế kịch bản Usability Test chuẩn.

### 2. Quá trình thực hành thực tế (Hands-on Practice)
* **Chuẩn bị:** Lên kịch bản test (Task scenarios), chọn và mời nhóm người dùng mục tiêu (Participants).
* **Tiến hành test:** 
    * Thu thập dữ liệu định lượng (thời gian hoàn thành task, tỷ lệ lỗi, success rate).
    * Thu thập dữ liệu định tính (phỏng vấn, quan sát cảm xúc, feedback).

### 3. Kết quả đạt được & Đánh giá (Results & Evaluation)
* Tổng hợp các điểm nghẽn (pain points) mà người dùng gặp phải trong luồng thao tác.
* Biểu đồ phân tích (ví dụ: heatmap), kết quả bảng khảo sát (như SUS score) nếu có.

### 4. Khó khăn và Hướng giải quyết (Troubleshooting)
* Khó khăn trong việc tìm kiếm người test phù hợp, môi trường test, hoặc cách phân tích dữ liệu nhiễu.

---

## IV. Kết luận và Hướng phát triển (Conclusion & Future Work)

### 1. Kết luận chung
*Bài học kinh nghiệm rút ra từ việc kết hợp cả hai phương pháp UI Test (chức năng bề mặt) và Usability Test (trải nghiệm).*

### 2. Đề xuất cải tiến (Actionable Recommendations)
*Dựa trên kết quả test của cả 2 phần, đề xuất các sửa đổi cụ thể cho UI/UX của sản phẩm/ứng dụng.*

---

## V. Tài liệu tham khảo (References)
- [1] Link Github project / Test scripts
- [2] Docs của công cụ - Link
- [3] Các tài liệu nghiên cứu về Usability - Link
