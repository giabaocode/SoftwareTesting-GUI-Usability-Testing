# [S2] Scope Note — Cho Instructor Review

> **Stage**: S2 (Instructor / TA review & approval)
> **Owner**: Lee Kun Da — search `@KunDa`
> **Mục đích**: File này đi kèm với [`01_Tool_Survey_Proposal.md`](01_Tool_Survey_Proposal.md). Nó chốt chính xác việc gì nhóm sẽ làm và việc gì không, để thầy có thể đưa verdict (APPROVED / MINOR-CHANGE / RECLAIM) trong dưới 2 ngày làm việc.

---

## 1. In-Scope (việc nhóm SẼ làm)

### 1.1 Subset của SUT
Chỉ làm **luồng checkout** của EShop, gồm 5 màn hình sau:

| # | Màn hình | Trigger | UI element chính cần test |
|---|---|---|---|
| S-01 | Product listing | điều hướng từ homepage | search bar, CTA "Add to Cart" |
| S-02 | Cart review | click icon giỏ hàng | quantity stepper, nút remove, subtotal |
| S-03 | Coupon application | nhập mã coupon | input field, nút apply, trạng thái error/success |
| S-04 | Address & shipping | từ giỏ chuyển tiếp | form validation, autocomplete địa chỉ |
| S-05 | Payment | từ address chuyển tiếp | radio button phương thức thanh toán, CTA "Place Order" |

> **Out of scope**: đăng ký tài khoản, trang lịch sử đơn hàng, admin dashboard, mobile native app.

### 1.2 Feature tool sẽ demo live
- **Maze**: **1 study duy nhất với 5 task** (mỗi task tương ứng 1 màn hình S-01 → S-05); output là success rate, click-path, heatmap cho từng task. Giới hạn free tier: 1 study/tháng + 5 seats — đủ nếu gói tất cả task checkout vào 1 study.
- **Claude vision**: upload 3 screenshot → yêu cầu heuristic report theo Nielsen-10 → audit từng finding bằng tay.

### 1.3 Scope activity cho audience
- **"Heuristic Showdown — Human vs AI"** trên 1 màn hình duy nhất (đề xuất S-03 *Coupon application* — nhiều usability defect signal nhất).
- Time-box: hard stop 25 phút. <!-- TODO @BìnhAn: xác nhận lại màn hình sau khi pilot S3 — có thể đổi sang S-02 nếu coupon screen quá nhiễu -->

---

## 2. Out-of-Scope (việc nhóm SẼ KHÔNG làm)

Để tránh scope creep và giữ timeline 4 tuần:

- ❌ Cross-browser matrix testing (cần BrowserStack — không nằm trong cặp tool).
- ❌ Usability trên mobile (Maze support được nhưng SUT scope chỉ web desktop).
- ❌ Accessibility audit (WCAG) — chủ đề liên quan nhưng framework đánh giá riêng; có thể là seminar tương lai.
- ❌ Backend / API issue — không thuộc GUI testing (do T6 cover).
- ❌ Performance / load testing — không thuộc GUI testing (do T5 cover).
- ❌ A/B testing — nhóm test checkout *hiện tại*, không test variant.

---

## 3. Tiêu chí thành công cho Seminar

Đây là chuẩn để nhóm tự đánh giá kết quả:

1. **Live demo chạy end-to-end không cần script** (Rubric §6 *Live demo, 15%*).
2. **Maze study hoàn thành với ≥ 1 heatmap thật** capture được trong lúc demo.
3. **Claude vision tạo ≥ 5 finding Nielsen-10 riêng biệt** trong demo, và nhóm **reject được ≥ 1 finding trong số đó tại chỗ** với lý do (thể hiện AI critical thinking, không phải vendor enthusiasm).
4. **Activity của audience kết thúc trong 25 phút** với ít nhất 3 trong 4 team audience nộp được worksheet đã hoàn thành.
5. **User_Guide.md vượt "reproducibility test"**: 1 team khác có thể install Maze và chạy EShop study chỉ dựa vào docs của nhóm, không cần Slack DM.

---

## 4. Câu hỏi xin instructor (input cho Stage S2)

> **Kun Da — vui lòng thu verdict cho từng dòng tại buổi draft review.**

| # | Câu hỏi | Lý do hỏi | Verdict |
|---|---|---|---|
| Q1 | Subset *checkout* EShop (5 màn hình) đã đủ scope SUT chưa, hay thầy muốn nhóm thêm account/order-history? | Cần lock SUT trước khi build Maze study. | _TBD_ |
| Q2 | Thầy chấp nhận **Claude vision** làm AI-augmented tool, hay nhóm nên thêm 1 AI tool nữa (vd UXTweak AI) để củng cố AI angle? | Rule of pairing yêu cầu ≥ 1 AI tool — nhưng nhiều hơn có thể được điểm cao hơn ở §6 *Depth of study*. | _TBD_ |
| Q3 | Màn hình **S-03 *Coupon application*** có phải target đúng cho activity không, hay thầy gợi ý màn hình EShop khác? | Ảnh hưởng tới thiết kế worksheet ở Stage S5. | _TBD_ |
| Q4 | Maze tier **Free** giới hạn nhóm chỉ **1 study/tháng + 5 seats** (verified trên maze.co/pricing 2026-06-05). Nhóm dự định gói tất cả 5 task EShop vào 1 study duy nhất để vừa giới hạn. Phương án này có ổn không, hay thầy muốn nhóm trả Starter (US$99/tháng)? Lưu ý: Starter vẫn chỉ cho 1 study/tháng — chỉ mở khoá unmoderated toolkit và screen recording. | Tiêu chí cost / licence awareness ở §6 *Tool survey*. | _TBD_ |
| Q5 | URL EShop staging có chung với các team khác (T2 Playwright, T6 Postman) không, hay nhóm được instance riêng? | Ảnh hưởng tới độ ổn định environment lúc demo. | _TBD_ |

<!-- TODO @BìnhAn: sau S2 review, thay _TBD_ bằng verdict và update [01_Tool_Survey_Proposal.md] nếu cần -->

---

## 5. Budget cho iteration

Theo Seminar Guide §2.1 *"Teams may iterate at most twice"* trên S1/S2:

- **Iteration 1**: draft này (submit 2026-06-05 cho review 2026-06-06).
- **Iteration 2** (nếu MINOR-CHANGE): nhóm revise trong 24 giờ và chuyển sang S3 không cần họp lại.
- **Worst case (RECLAIM)**: fallback sang cặp **Hotjar + UXTweak AI** đã có comparison matrix sẵn trong Proposal §3.

---

*Cập nhật lần cuối: 2026-06-05 · Draft v0.1.0 · Owner: Lee Kun Da*
