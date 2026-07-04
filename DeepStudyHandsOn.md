# Báo cáo: Deep Study & Hands-on Practice

**Tên trường/tổ chức:** [Tên trường/tổ chức]  
**Tên đề tài:** [Tên đề tài]  
**Tên thành viên nhóm:** [Tên các thành viên]  
**Ngày tháng:** [Ngày/Tháng/Năm]

---

## I. Tóm tắt (Executive Summary)

_Tóm tắt ngắn gọn toàn bộ báo cáo: Đã nghiên cứu gì, đã thực hành làm được gì cho cả UI và Usability testing, và kết quả chung ra sao._

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

  > _"Review this screenshot of an e-commerce checkout page. Identify UI issues related to alignment, color contrast, typography consistency, and spacing. For each issue, describe: location on screen, what's wrong, and suggested fix."_

- **Prompt nâng cao (theo Nielsen Heuristics):**

  > _"Evaluate this UI screenshot against Nielsen's 10 Usability Heuristics. For each violation found, specify: heuristic number and name, severity rating (0–4), exact location on screen, description of the problem, and recommended fix."_

- **Prompt so sánh consistency:**
  > _"Compare these two screenshots of the same checkout flow on desktop vs. mobile. Identify any inconsistencies in layout, typography, color, or interactive elements between the two versions."_

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

- **Log AI Usage:** Ghi lại prompt đã dùng, output của Claude, và kết quả audit vào `ai-disclosure/AI_Usage_Log.md` (theo AI Policy §7).

### 3. Kết quả đạt được & Đánh giá (Results & Evaluation)

**Bảng tổng hợp findings:**

| Metric | BrowserStack Manual | Claude Vision | Tổng cộng |
|---|---|---|---|
| Tổng findings phát hiện | — | — | — |
| True Positive (lỗi xác nhận) | — | — | — |
| False Positive (báo sai) | 0 | — | — |
| Unique findings (chỉ 1 phương pháp tìm ra) | — | — | — |

_(Bảng sẽ được điền sau khi hoàn thành thực hành trên EShop.)_

**Phân loại defects theo Severity × UI Category:**

| Severity ↓ \ Category → | Layout | Typography | Color | State | Cross-browser | Content | A11y |
|---|---|---|---|---|---|---|---|
| Critical | — | — | — | — | — | — | — |
| Major | — | — | — | — | — | — | — |
| Minor | — | — | — | — | — | — | — |
| Cosmetic | — | — | — | — | — | — | — |

_(Bảng sẽ được điền sau khi hoàn thành thực hành trên EShop.)_

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

| Khó khăn                                                     | Cách giải quyết                                                                                |
| ------------------------------------------------------------ | ---------------------------------------------------------------------------------------------- |
| False positive — Claude báo lỗi nhưng thực tế không phải lỗi | Bắt buộc human audit mọi finding; dùng công cụ Contrast Checker để kiểm chứng các lỗi về color |
| Screenshot chất lượng thấp → Claude phân tích sai | Chụp full-page, resolution cao (≥1920px width), không nén ảnh — dùng BrowserStack screenshot feature |
| Findings trùng lặp giữa các screenshot | Deduplicate: gom các finding trùng thành 1 defect duy nhất trước khi tổng hợp |
| Không test được dynamic UI (hover, animation, scroll) | Bổ sung bằng manual testing trên BrowserStack ở Phase 1 — đây là lý do cần kết hợp cả hai phương pháp |

---

## III. PHẦN 2: USABILITY TESTING (Kiểm thử Tính Khả dụng)

### 1. Cơ sở lý thuyết / Nghiên cứu sâu (Deep Study)

#### A. Mục tiêu của Usability Testing trong đề tài

Usability Testing tập trung đánh giá mức độ dễ sử dụng của luồng checkout EShop, bao gồm các bước: xem giỏ hàng, áp dụng coupon, nhập địa chỉ giao hàng, chọn phương thức thanh toán và hoàn tất đơn hàng. Usability Testing quan tâm nhiều hơn đến hành vi và cảm nhận của người dùng khi họ thực hiện một nhiệm vụ cụ thể.

**Mục tiêu đánh giá chính:**

- Người dùng có hoàn thành được các task checkout quan trọng hay không.
- Người dùng mất bao lâu để hoàn thành từng task.
- Người dùng nhầm lẫn, click sai, quay lại bước trước hoặc bỏ cuộc ở điểm nào.
- Các yếu tố nào làm giảm sự tự tin, sự rõ ràng và mức độ hài lòng khi checkout.
- Công cụ Maze hỗ trợ nhóm thu thập và tổng hợp dữ liệu usability như thế nào.

#### B. Các khái niệm và chỉ số sử dụng

| Khái niệm / Chỉ số   | Ý nghĩa                                                              |
| -------------------- | -------------------------------------------------------------------- |
| Task success rate    | Tỷ lệ người dùng hoàn thành đúng task                                |
| Time on task         | Thời gian người dùng cần để hoàn thành task                          |
| Misclick rate        | Tỷ lệ click vào vùng không mong muốn hoặc không giúp task tiến triển |
| Drop-off point       | Bước mà người dùng dừng lại hoặc không thể đi tiếp                   |
| User path            | Chuỗi hành động người dùng thực hiện trong luồng checkout            |
| Qualitative feedback | Nhận xét mở của người tham gia                                       |
| Severity             | Mức độ ảnh hưởng của pain point                                      |

#### C. Công cụ chính: Maze

Theo `Tool_Survey_Proposal.md`, nhóm chọn **Maze** làm công cụ chính cho Usability Testing vì Maze phù hợp với task-based testing trên prototype hoặc website thật, có thể đo completion rate, misclick rate và thời gian hoàn thành task.

**Lý do Maze phù hợp với EShop Checkout:**

- Luồng checkout có nhiều task tuyến tính, dễ chuyển thành kịch bản test trong Maze.
- Các chỉ số như completion rate, misclick rate và time on task giúp phát hiện điểm nghẽn ở từng bước.
- Heatmap/click path hỗ trợ nhìn nhanh các vùng gây nhầm lẫn.
- Giao diện Maze dễ dùng, phù hợp để nhóm thiết lập study nhanh và cho người tham gia test không cần cài đặt phức tạp.

**Giới hạn khi dùng Maze:**

- Free tier có giới hạn về số study/seat, vì vậy study cần được chuẩn bị kỹ trước khi publish chính thức.
- Dữ liệu định lượng chỉ phản ánh hành vi trong phạm vi task được thiết kế; task viết sai có thể làm kết quả bị lệch.
- Trường hợp test trên prototype có thể cho kết quả khác website thật vì prototype không có đầy đủ logic động.

### 2. Quá trình thực hành thực tế (Hands-on Practice)

#### A. Thiết kế study trên Maze

Study được thiết kế dưới dạng unmoderated task-based test. Người tham gia nhận một chuỗi nhiệm vụ ngắn trong luồng checkout và Maze ghi nhận hành vi thao tác trong quá trình họ hoàn thành từng nhiệm vụ.

| Trường               | Nội dung                                   |
| -------------------- | ------------------------------------------ |
| Tên study            | [Điền tên study trên Maze]                 |
| Link study           | [Điền link Maze nếu được phép chia sẻ]     |
| Đối tượng tham gia   | [Ví dụ: sinh viên đã từng mua hàng online] |
| Thời gian chạy study | [Ngày bắt đầu - ngày kết thúc]             |
| Số response hợp lệ   | [Điền sau khi chạy study]                  |

**Câu hỏi nghiên cứu:**

1. Người dùng có hiểu rõ bước áp dụng coupon và thấy discount được cập nhật không?
2. Người dùng có gặp khó khăn khi nhập địa chỉ giao hàng không?
3. Người dùng có nhận biết rõ trạng thái lỗi/thành công trong quá trình thanh toán không?
4. Bước nào trong checkout tạo ra nhiều misclick hoặc drop-off nhất?

**Task scenarios:**

| Task ID | Màn hình / Flow  | Kịch bản cho người tham gia                                              | Expected behavior                                                   | Metric cần thu                              |
| ------- | ---------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------- | ------------------------------------------- |
| UT-01   | Cart             | Bạn muốn kiểm tra lại sản phẩm trong giỏ hàng và tiếp tục thanh toán.    | Người dùng xác nhận item, quantity, total và đi tới bước tiếp theo. | Success rate, time on task, misclick        |
| UT-02   | Coupon           | Bạn có mã giảm giá `[Điền mã]`. Hãy áp dụng mã này trước khi thanh toán. | Người dùng nhập coupon, bấm apply, nhận biết discount.              | Success rate, misclick, feedback            |
| UT-03   | Address          | Hãy nhập thông tin giao hàng để đơn hàng có thể được vận chuyển.         | Người dùng điền đủ required fields và xử lý lỗi nếu thiếu.          | Error rate, time on task, drop-off          |
| UT-04   | Payment          | Hãy chọn phương thức thanh toán và hoàn tất đơn hàng thử nghiệm.         | Người dùng chọn payment method, xác nhận order.                     | Success rate, time on task                  |
| UT-05   | Overall checkout | Hãy hoàn thành toàn bộ luồng mua hàng từ giỏ hàng tới xác nhận đơn.      | Người dùng đi hết checkout flow không cần trợ giúp.                 | Completion rate, path, qualitative feedback |

**Câu hỏi sau task / sau study:**

| Loại câu hỏi  | Nội dung câu hỏi                                                       | Dữ liệu mong muốn            |
| ------------- | ---------------------------------------------------------------------- | ---------------------------- |
| Rating        | Bạn đánh giá mức độ dễ hoàn thành task này từ 1-5 như thế nào?         | Điểm hài lòng theo task      |
| Open feedback | Có bước nào làm bạn bối rối hoặc không chắc chắn không?                | Pain point định tính         |
| Confidence    | Bạn có tự tin rằng đơn hàng đã được tạo thành công không? Vì sao?      | Nhận thức về feedback/status |
| Improvement   | Nếu được thay đổi một điểm trong luồng checkout, bạn muốn thay đổi gì? | Đề xuất cải thiện            |

#### B. Pilot test

Nhóm chạy pilot với 1-2 người tham gia để kiểm tra link study, task wording, luồng prototype/website và cách Maze ghi nhận dữ liệu trước khi gửi study chính thức.

| Hạng mục kiểm tra                             | Kết quả pilot   |
| --------------------------------------------- | --------------- |
| Link Maze mở được trên thiết bị mục tiêu      | [Kết quả pilot] |
| Prototype/website EShop load đúng             | [Kết quả pilot] |
| Task wording rõ ràng, không dẫn dắt quá mức   | [Kết quả pilot] |
| Maze ghi nhận click/path/time đúng            | [Kết quả pilot] |
| Câu hỏi sau task hiển thị đúng                | [Kết quả pilot] |
| Không lộ dữ liệu nhạy cảm / thông tin cá nhân | [Kết quả pilot] |

**Điều chỉnh sau pilot:**  
[Ghi lại các thay đổi về wording/task/link/settings sau pilot.]

#### C. Chạy study chính thức

| Nội dung ghi nhận                     | Ghi chú thực nghiệm                                |
| ------------------------------------- | -------------------------------------------------- |
| Kênh mời người tham gia               | [Lớp học, nhóm chat, bạn bè, participant panel...] |
| Số response thu được                  | [Điền số]                                          |
| Số response hợp lệ                    | [Điền số]                                          |
| Thời gian trung bình hoàn thành study | [Điền từ Maze]                                     |
| Vấn đề kỹ thuật khi chạy study        | [Điền nếu có]                                      |

Sau khi kết thúc study, nhóm tổng hợp dữ liệu theo từng task. Các chỉ số định lượng trong Maze được đối chiếu với feedback mở để xác định các pain point chính trong luồng checkout.

### 3. Kết quả đạt được & Đánh giá (Results & Evaluation)

#### A. Tổng quan kết quả study

| Metric                          | Kết quả          | Nhận xét           |
| ------------------------------- | ---------------- | ------------------ |
| Tổng số response                | [Điền số]        | [Ghi chú]          |
| Response hợp lệ                 | [Điền số]        | [Ghi tiêu chí lọc] |
| Completion rate toàn study      | [Điền %]         | [Nhận xét]         |
| Thời gian hoàn thành trung bình | [Điền thời gian] | [Nhận xét]         |
| Task có nhiều lỗi nhất          | [Điền Task ID]   | [Lý do]            |
| Task có nhiều misclick nhất     | [Điền Task ID]   | [Lý do]            |
| Điểm hài lòng trung bình        | [Điền nếu có]    | [Nhận xét]         |

#### B. Kết quả theo từng task

| Task ID | Success rate | Avg/Median time | Misclick / error nổi bật | Drop-off | Nhận xét chính |
| ------- | ------------ | --------------- | ------------------------ | -------- | -------------- |
| UT-01   | [Điền]       | [Điền]          | [Điền]                   | [Điền]   | [Điền]         |
| UT-02   | [Điền]       | [Điền]          | [Điền]                   | [Điền]   | [Điền]         |
| UT-03   | [Điền]       | [Điền]          | [Điền]                   | [Điền]   | [Điền]         |
| UT-04   | [Điền]       | [Điền]          | [Điền]                   | [Điền]   | [Điền]         |
| UT-05   | [Điền]       | [Điền]          | [Điền]                   | [Điền]   | [Điền]         |

#### C. Tổng hợp pain points

| ID    | Pain point    | Bằng chứng                         | Severity                        | Ảnh hưởng tới user | Đề xuất cải thiện |
| ----- | ------------- | ---------------------------------- | ------------------------------- | ------------------ | ----------------- |
| UP-01 | [Điền vấn đề] | [Heatmap/path/feedback/screenshot] | [Critical/Major/Minor/Cosmetic] | [Điền]             | [Điền]            |
| UP-02 | [Điền vấn đề] | [Heatmap/path/feedback/screenshot] | [Critical/Major/Minor/Cosmetic] | [Điền]             | [Điền]            |
| UP-03 | [Điền vấn đề] | [Heatmap/path/feedback/screenshot] | [Critical/Major/Minor/Cosmetic] | [Điền]             | [Điền]            |

#### D. Nhận xét từ kết quả usability

[Viết 1-2 đoạn sau khi có dữ liệu thật: task nào dễ nhất, task nào gây khó khăn nhất, pain point nào có tác động lớn nhất, và Maze giúp nhóm phát hiện điều gì trong luồng checkout.]

### 4. Khó khăn và Hướng giải quyết (Troubleshooting)

| Khó khăn                              | Rủi ro ảnh hưởng tới báo cáo                       | Cách xử lý / ghi nhận                                                   |
| ------------------------------------- | -------------------------------------------------- | ----------------------------------------------------------------------- |
| Không đủ người tham gia               | Dữ liệu không đại diện, khó kết luận mạnh          | Ghi rõ sample size, xem kết quả là exploratory, không khái quát quá mức |
| Người tham gia không đúng target user | Feedback có thể lệch so với người mua hàng thật    | Ghi tiêu chí participant và giới hạn nghiên cứu                         |
| Task wording gây hiểu nhầm            | Người dùng fail vì đề bài, không phải vì UI        | Pilot test trước, chỉnh wording, ghi lại thay đổi                       |
| Prototype/website lỗi kỹ thuật        | Metric bị nhiễu bởi lỗi ngoài usability            | Loại response bị lỗi kỹ thuật, ghi rõ trong limitations                 |
| Maze free tier giới hạn               | Không thể tạo nhiều study hoặc sửa sau khi publish | Chuẩn bị kỹ task, chạy pilot trước khi publish chính thức               |

---

## IV. Kết luận và Hướng phát triển (Conclusion & Future Work)

### 1. Kết luận chung

_Bài học kinh nghiệm rút ra từ việc kết hợp cả hai phương pháp UI Test (chức năng bề mặt) và Usability Test (trải nghiệm)._

### 2. Đề xuất cải tiến (Actionable Recommendations)

_Dựa trên kết quả test của cả 2 phần, đề xuất các sửa đổi cụ thể cho UI/UX của sản phẩm/ứng dụng._

---

## V. Tài liệu tham khảo (References)

- [1] Link Github project / Test scripts
- [2] Docs của công cụ - Link
- [3] Các tài liệu nghiên cứu về Usability - Link
