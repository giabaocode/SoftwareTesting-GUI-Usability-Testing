# [S5] Activity Worksheet — "Heuristic Showdown: Human vs AI"

> **Stage**: S5 (Pre-share) — tài liệu phải có ≥ 3 ngày làm việc trước live seminar.
> **Owner**: **Nguyễn Bình An** (nhóm trưởng, facilitator audience) — search `@BìnhAn`.
> **Time-box activity**: hard stop 25 phút (theo Seminar Guide §6 *In-class hands-on activity*).
> **Audience**: 4 team × 3-4 sinh viên.
> **Output bắt buộc**: worksheet này + answer key (Section 6) + facilitator script (Section 7).

---

## 1. Tổng quan Activity

| Trường | Giá trị |
|---|---|
| Tiêu đề | **Heuristic Showdown — Human vs AI** |
| Topic | T01 — GUI & Usability Testing |
| SUT | EShop checkout · màn hình **S-03 *Coupon application*** <!-- TODO @BìnhAn: xác nhận màn hình sau khi pilot S3 --> |
| Tool audience cần | Screenshot in ra (PDF handout) + bút — không cần laptop |
| Tool facilitator mang | Laptop có sẵn Claude vision report pre-generate (in lên slide) |
| Thời lượng | 25 phút |
| Quy mô nhóm | 3–4 sinh viên/audience team |
| Mục tiêu | Cho thấy trade-off thực tế: human bắt được issue có ngữ cảnh phức tạp, AI bắt issue bề mặt nhanh, và cả hai phía đều miss things. |

---

## 2. Audience Pre-Read (gửi ≥ 3 ngày trước)

Mỗi audience team trước khi đến phải skim:

1. **Nielsen 10 heuristic** — 1 trang summary sẽ phát ở cửa (xem [§8 Cheat-sheet](#8-cheat-sheet--nielsen-10-trên-1-trang)).
2. **Screenshot EShop** của S-03 (PDF trong Moodle folder chung).
3. **Rubric severity** (cosmetic / minor / major / catastrophic) — xem [§5](#5-rubric-severity).

> ⚠️ Audience nào skip pre-read sẽ mất 1 attendance credit (Workflow_Briefing slide 7).

---

## 3. Step có time-box

> Phỏng theo bảng tham chiếu T01 §7. Mỗi timestamp **tuyệt đối** tính từ lúc bắt đầu activity (t = 0:00).

| Thời gian | Step | Ai | Material |
|---|---|---|---|
| 0:00–0:03 | Facilitator phát screenshot EShop S-03 (PDF) + Nielsen cheat-sheet | Bình An | handout PDF |
| 0:03–0:13 | **PHASE 1 — Human review.** Mỗi audience team viết **≥ 5 heuristic violation** vào worksheet, mỗi cái kèm severity (cosmetic / minor / major / catastrophic). | Audience team | worksheet này §4 |
| 0:13–0:18 | **PHASE 2 — AI reveal.** Facilitator chiếu Claude vision report pre-generate lên màn hình. Team đối chiếu: finding nào trùng, finding nào team miss, finding nào AI miss? | Bình An + audience | slide |
| 0:18–0:23 | **PHASE 3 — Pair discussion.** Mỗi team xác định (a) 1 issue **chỉ human** bắt được, (b) 1 issue **chỉ AI** bắt được, (c) 1 issue cả hai **đều sai**. | Audience pair | worksheet này §4 |
| 0:23–0:25 | **PHASE 4 — Whiteboard share.** Mỗi team viết 1 insight lên bảng hoặc chat lớp. | Tất cả | bảng |

---

## 4. Audience Worksheet (1 bản/team)

> In trang này 1 bản/team và phát lúc t = 0:00.

### Tên team & thành viên
- Team: __________________________
- Thành viên: ___________________________________________

### Phase 1 — 5+ heuristic violation của bạn (t = 0:03 → 0:13)

| # | Heuristic vi phạm (Nielsen 1–10) | Vị trí trên màn hình | Severity (cos/min/maj/cat) |
|---|---|---|---|
| 1 |  |  |  |
| 2 |  |  |  |
| 3 |  |  |  |
| 4 |  |  |  |
| 5 |  |  |  |
| 6 (bonus) |  |  |  |

### Phase 2 — Cross-check với AI report (t = 0:13 → 0:18)

- **Finding AI bạn ĐỒNG Ý**: # __________ (liệt kê số từ report chiếu trên slide)
- **Finding AI bạn KHÔNG đồng ý**: # __________
- **Finding của bạn mà AI miss**: # __________ (liệt kê số từ bảng Phase 1 ở trên)

### Phase 3 — 3 reveal (t = 0:18 → 0:23)

| Câu hỏi | Trả lời (1 câu) |
|---|---|
| (a) 1 issue **chỉ human** bắt — gì & tại sao? |  |
| (b) 1 issue **chỉ AI** bắt — gì & tại sao? |  |
| (c) 1 issue cả hai **đều sai** — gì & tại sao? |  |

### Phase 4 — 1 câu cho whiteboard (t = 0:23 → 0:25)
> Pick **1** finding từ trên và viết thành câu one-liner có thể defend trong 30 giây.

`__________________________________________________________________________`

---

## 5. Rubric Severity

| Mức | Nghĩa | Ví dụ EShop |
|---|---|---|
| **Cosmetic** | Hơi khó chịu nhưng không cản trở task. | Bo góc button không đồng nhất. |
| **Minor** | Làm chậm user; workaround dễ thấy. | Error message ghi "invalid input" mà không nói field nào sai. |
| **Major** | Cản trở task cho nhiều user; workaround cần expertise. | Coupon field nhận mã nhưng giảm giá im lặng không apply. |
| **Catastrophic** | Gây mất data hoặc lỗi tiền. | Quantity stepper cho phép -1; total giỏ thành âm; order vẫn submit được. |

---

## 6. Answer Key (bản facilitator — **KHÔNG in cho audience**)

> Đây là những thứ nhóm kỳ vọng 1 team có năng lực sẽ phát hiện. Claude vision review sẽ có shape tương tự.
> Nguồn: pilot chạy ngày <!-- TODO @BìnhAn: điền ngày sau khi pilot S3 --> bởi Bình An + Kun Da.

### 6.1 Finding human plausible trên S-03 (Coupon application)

<!-- TODO @BìnhAn: sau khi pilot S3, list 5-8 finding thật mà team đã quan sát. Mỗi finding phải có số heuristic + severity + 1 câu giải thích. Dưới đây là PLACEHOLDER ví dụ — thay bằng finding thật. -->

1. **H1 Visibility of system status** — *không có spinner khi đang validate coupon* — **minor** — user click apply 2 lần và submit 2 coupon.
2. **H2 Match between system and real world** — *label ghi "Promo code" nhưng error ghi "voucher invalid"* — **minor**.
3. **H5 Error prevention** — *nút apply enable cả khi input rỗng* — **major** — gọi network không cần thiết.
4. **H9 Help users recognise, diagnose, and recover from errors** — *error "Invalid"* không gợi ý cách khôi phục — **major**.
5. **H7 Flexibility and efficiency** — *coupon field nằm dưới fold trên laptop 13"* — **minor**.
6. <!-- TODO @BìnhAn -->

### 6.2 Những thứ AI hay over-report
- Tỷ lệ contrast của text mờ (đa số là true positive nhưng severity bị thổi phồng).
- "Inconsistent" capitalization mà thực ra là convention brand cố ý.

### 6.3 Những thứ AI hay under-report
- Behaviour chỉ xuất hiện **sau khi** click — AI thấy ảnh tĩnh nên không evaluate được state động.
- Vấn đề localization (vd dấu tiếng Việt render thành `??`) khi screenshot chỉ là English.

---

## 7. Facilitator Script

> **Owner**: Nguyễn Bình An. Lưu Ngô Quốc Bảo giữ thời gian.

### 7.1 t = -5:00 (5 phút trước start)
- In 4 bản worksheet §4 + 4 bản cheat-sheet §8.
- Confirm projector hiện AI report ở full resolution.
- Đặt printout Maze heatmap úp xuống trên bàn trước (reveal lúc debrief).

### 7.2 t = 0:00 — mở đầu (60 s)
> *"Đây là activity 25 phút. Mọi người vào vai human usability reviewer; nhóm mình vào vai AI. Cuối session so sánh điểm. Không có người thắng — mục đích là cho thấy mỗi bên miss cái gì."*

### 7.3 t = 0:03 — kick-off
- Phát handout.
- Bắt đầu timer (Quốc Bảo).

### 7.4 t = 0:13 — AI reveal
- Chiếu Claude vision report. Đọc to *3 finding đầu* — phần còn lại audience tự đọc.

### 7.5 t = 0:23 — thu & share
- Mỗi team lên bảng lần lượt. Giới hạn 30s/team.

### 7.6 t = 0:25 — hard stop
- Cảm ơn các team. Thu worksheet để audit chấm điểm.

---

## 8. Cheat-sheet — Nielsen 10 trên 1 trang

> Phát kèm worksheet §4. In A4 1 mặt.

1. **Visibility of system status** — báo cho user biết feedback đúng lúc.
2. **Match between system and the real world** — dùng ngôn ngữ của user.
3. **User control and freedom** — undo/redo, exit rõ ràng.
4. **Consistency and standards** — cùng từ / cùng action ở mọi nơi.
5. **Error prevention** — thiết kế cẩn thận > error message hay.
6. **Recognition rather than recall** — giảm tải bộ nhớ cho user.
7. **Flexibility and efficiency of use** — accelerator cho expert.
8. **Aesthetic and minimalist design** — không thông tin thừa.
9. **Help users recognise, diagnose, and recover from errors** — ngôn ngữ đơn giản, gợi ý cách khôi phục.
10. **Help and documentation** — dễ search, tập trung vào task.

---

## 9. Reproducibility check

1 team khác phải chạy được **toàn bộ activity này** trong ≤ 25 phút chỉ dùng:
- worksheet này, cheat-sheet, screenshot PDF, và AI report pre-generated;
- **không DM team mình, không setup thêm**.

Nếu họ không làm được, worksheet này fail rubric (Workflow_Briefing slide 10, pitfall #5).

<!-- TODO @BìnhAn: pilot worksheet với 1 bạn từ topic team khác trước khi submit cuối. Note kết quả ở đây. -->

---

*Cập nhật lần cuối: 2026-06-05 · Skeleton v0.1.0 · Owner: Nguyễn Bình An (nhóm trưởng)*
