# [S6] Outline Slide Seminar — Live 45 phút

> **Stage**: S6 (Live seminar)
> **Owner**: Lưu Ngô Quốc Bảo — search `@QuốcBảo`
> **Giới hạn cứng**: ≤ **15 slide** (Workflow_Briefing slide 7 — *"the activity is the centrepiece, not the slides"*).
> **Format**: file này định nghĩa nội dung của từng slide; file `Seminar_Slides.pptx` cuối cùng sẽ build từ outline này dùng template course.

---

## 0. Phân bổ thời gian (session live 45 phút)

| Block | Thời gian | Slide cover | Người nói |
|---|---|---|---|
| Pitch | 0:00 – 0:10 (10 phút) | S1 – S5 | Phạm Ngọc Gia Bảo |
| Live demo | 0:10 – 0:20 (10 phút) | S6 – S8 (chủ yếu screen-share) | Lee Kun Da + Nguyễn Bình An |
| Audience activity | 0:20 – 0:40 (20 phút) | S9 – S12 | Nguyễn Bình An facilitate |
| Q&A | 0:40 – 0:45 (5 phút) | S13 – S15 | Cả nhóm; lead = Nguyễn Bình An |

> Số slide target: **14 slide** (= cap 15 − 1 slide buffer an toàn).

---

## Outline từng slide

### S1 — Title
- **Owner**: Gia Bảo
- **Content**:
  - Title: *Heuristic Showdown — GUI & Usability Testing với Maze + Claude vision*
  - Course / team / date / tên instructor (TS. Trần Duy Hoàng — section instructor).
- **Speaker note (30 s)**: nêu tên nhóm, tên SUT (EShop checkout), tên cặp tool. Chỉ vậy.

### S2 — Tại sao topic này quan trọng
- **Owner**: Gia Bảo
- **Content**: 1 stat cứng làm anchor cho phần pitch còn lại.
  - **Stat** (cite Baymard Institute trên slide): *"Baymard Institute báo cáo tỷ lệ bỏ giỏ trung bình ~70% trên e-commerce, trong đó friction ở luồng checkout (chi phí phát sinh không báo trước, bắt tạo tài khoản, form dài) là 1 trong những nguyên nhân được cite nhiều nhất."*
  - URL nguồn in trên slide: https://baymard.com/lists/cart-abandonment-rate
  - **Anecdote optional** — chỉ thêm vào nếu thành viên nào có câu chuyện checkout failure thật, kể trong ≤ 25 từ. **Không** bịa.
- **Speaker note (60 s)**: mở bằng stat, sau đó hỏi "70% là cái gì?" — để câu hỏi treo 1-2 giây rồi trả lời. Nếu thầy hỏi số chính xác, nói *"khoảng 70% — Baymard 2024 tổng hợp 49 nguồn"* — đừng over-precision.

### S3 — 3 câu hỏi của usability testing
- **Owner**: Gia Bảo
- **Content**: diagram tam giác với 3 đỉnh:
  - *User có thể **tìm thấy** không?*
  - *User có **tin tưởng** không?*
  - *User có **hồi phục** được sau khi click nhầm không?*
- **Speaker note (45 s)**: functional test bình thường không trả lời câu nào trong 3 câu trên. Đó là khoảng trống mà seminar nhóm lấp.

### S4 — Cặp tool · rule of pairing
- **Owner**: Gia Bảo
- **Content**:
  - Logo Maze + 1 dòng "làm gì" + "free tier OK".
  - Logo Claude vision + 1 dòng + "free tier OK".
  - 1 callout: *Workflow_Briefing slide 3 — every demo must show both columns*.
- **Speaker note (90 s)**: justify lựa chọn trong 2 câu mỗi tool. Reference [`01_Tool_Survey_Proposal.md`](01_Tool_Survey_Proposal.md) §4 — chỉ vào QR code ở slide S15.

### S5 — Method · 5 step
- **Owner**: Gia Bảo
- **Content**: diagram pipeline 5 bước (Mermaid render export ra):
  `Màn hình EShop → Maze study (5 task) → tester data → Claude vision review → team audit`
- **Speaker note (60 s)**: 30s nói về leg Maze, 30s nói về leg Claude. Phần tiếp theo sẽ SHOW cái này.

### S6 — Live demo · leg Maze
- **Owner**: Kun Da demo; Gia Bảo narrate
- **Content**: **text tối thiểu** — chỉ agenda cho 5 phút tiếp theo.
  - Build study · publish · mời 1 tester (pre-record) · show heatmap.
- **Speaker note**: switch sang browser. KHÔNG đọc slide.

### S7 — Live demo · leg Claude vision
- **Owner**: Bình An demo; Gia Bảo narrate
- **Content**: style minimal tương tự.
  - Paste prompt · upload screenshot · nhận finding · audit 1 cái **on stage** (reject hoặc accept).
- **Speaker note**: bước audit là khoảnh khắc tạo credibility — nhấn mạnh.

### S8 — Live demo · so sánh
- **Owner**: Kun Da + Bình An cùng
- **Content**: bảng song song trên màn hình (live từ run vừa rồi):
  - Finding Maze | Finding Claude | Overlap? | Cái nào đúng?
- **Speaker note (90 s)**: đây là punchline của live demo. Show 1 cái human-only thắng rõ và 1 cái AI-only thắng rõ.

### S9 — Intro activity
- **Owner**: Bình An
- **Content**:
  - Title: *Heuristic Showdown — Human vs AI*
  - Time-box: 25 phút.
  - Timer 4 phase ở đáy slide (0:00 / 0:03 / 0:13 / 0:18 / 0:23 / 0:25).
- **Speaker note (60 s)**: đọc luật từ [`04_Activity_Worksheet.md`](04_Activity_Worksheet.md) §7.2.

### S10 — Activity · màn hình đang review
- **Owner**: Bình An
- **Content**: ảnh full-screen EShop S-03 (coupon application). Không có text khác.
- **Speaker note**: im lặng — projector giữ slide này trong khi team làm 10 phút.

### S11 — Activity · AI reveal (t = 0:13)
- **Owner**: Bình An
- **Content**: capture full-screen Claude vision report (in trước để audience mark up).
- **Speaker note (60 s)**: đọc to finding 1, 2, 3. Audience tự đọc phần còn lại.

### S12 — Activity · whiteboard share (t = 0:23)
- **Owner**: Bình An
- **Content**:
  - Grid 4 ô trống trên slide; fill live mỗi team 1 bullet.
  - Prompt in sẵn: *"chỉ human bắt được"*, *"chỉ AI bắt được"*, *"cả hai đều sai"*.
- **Speaker note**: giới hạn team 30 giây/team. Quốc Bảo enforce.

### S13 — Failure mode audience cần nhớ
- **Owner**: Quốc Bảo
- **Content**: 3 bullet rút từ [`03_User_Guide.md`](03_User_Guide.md) §6:
  - <!-- TODO @QuốcBảo: one-liner cho mỗi: Maze success-rate over-confidence; Claude bịa UI; AI miscalibrate severity. -->
- **Speaker note (60 s)**: đây là slide takeaway. Dừng 1 nhịp nhấn mạnh.

### S14 — Khi nào dùng cách này (và khi nào KHÔNG)
- **Owner**: Quốc Bảo
- **Content**: slide 2 cột.
  - ✅ Dùng khi: luồng checkout-style tĩnh, UI English, free tier chấp nhận được.
  - ❌ Skip khi: SPA động cao, screenshot có PII, cần sample > 50 tester.
- **Speaker note (45 s)**: thẳng thắn được điểm; không over-sell.

### S15 — Q&A · references · QR code
- **Owner**: Cả nhóm; lead = Bình An
- **Content**:
  - Nửa trên: 3 câu thầy có thể hỏi + 1 dòng trả lời (chuẩn bị trước).
    - *"Cách này khác accessibility testing thế nào?"* — framework riêng (WCAG); xem Scope Note §2.
    - *"Sao không dùng Hotjar?"* — cần deploy live; xem Proposal §3.
    - *"Claude có bao giờ nói dối nhóm không?"* — có; xem User_Guide §6.2.
  - Nửa dưới: QR code → GitHub repo + tài liệu course.
- **Speaker note**: mở floor; redirect câu off-topic khéo léo (Rubric §6 *Q&A + facilitation, 10%*).

---

## Quy định thiết kế slide (Quốc Bảo enforce)

1. **Mật độ text**: ≤ 30 từ/slide trừ S15 (Q&A).
2. **Font**: default của course template — không override.
3. **Hình**: mọi screenshot phải anonymize (không personal data, không tên user thật).
4. **Logo**: logo Maze + Claude chỉ xuất hiện ở S4 — không spam branding khắp slide.
5. **Transition**: không. Click-only.
6. **Speaker note**: mọi slide có speaker note ≤ 90 s (≤ 200 từ).

---

## Checklist rehearsal (đêm trước)

- [ ] Chạy thử full với timer — phải kết thúc ≤ 44:00.
- [ ] Máy demo có Maze + Claude tab **pre-login**.
- [ ] Backup screencast sẵn để play nếu mạng chết (Workflow_Briefing slide 7).
- [ ] Worksheet in × 5 team (1 dự phòng).
- [ ] Bút whiteboard đã test (tối thiểu 2 màu).
- [ ] Mỗi thành viên đã practise slide của mình ít nhất 2×.

<!-- TODO @QuốcBảo: schedule giờ rehearsal khi có ngày seminar cụ thể; thêm vào README §3 Stage Status. -->

---

*Cập nhật lần cuối: 2026-06-05 · Skeleton v0.1.0 · Owner: Lưu Ngô Quốc Bảo*
