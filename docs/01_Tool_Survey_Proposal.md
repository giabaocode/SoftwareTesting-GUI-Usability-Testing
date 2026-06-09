# [S1] Tool Survey & Proposal — T01 GUI & Usability Testing

> **Stage**: S1 (Topic claim & tool survey)
> **Mục tiêu độ dài**: ≤ 1 trang (Seminar Guide §2.1)
> **Submission**: File Markdown + GitHub Release `v0.1.0-draft`
> **Deadline chính thức của course**: Tuần 6, Thứ Bảy 23:59 (đây là bản draft trước deadline)

---

## 1. Đề tài

- **Code & tên**: **T01 — GUI & Usability Testing**
- **System Under Test (SUT)**: EShop frontend, luồng checkout:
  *Search → Thêm vào giỏ → Áp coupon → Địa chỉ → Thanh toán.*
- **Lý do chọn scope này**: Nhóm chọn checkout vì đây là nơi user thực sự bỏ giỏ (mất doanh thu), nó có 5 trạng thái UI riêng biệt để đánh giá, và vẫn vừa đủ để demo end-to-end trong 10 phút.

---

## 2. Các Tool ứng viên (yêu cầu ≥ 3 tool)

| # | Tool | Loại / Vai trò |
|---|---|---|
| C1 | **Maze** | Traditional (Truyền thống) — Cho người dùng thật test thử các nhiệm vụ trên thiết kế. |
| C2 | **Claude (vision)** | AI-augmented (Ứng dụng AI) — Dùng trí tuệ nhân tạo để xem và đánh giá nhanh giao diện qua ảnh chụp. |
| C3 | **Hotjar** | Backup (Dự phòng) — Ghi hình thao tác và vẽ bản đồ nhiệt (heatmap) khi web chạy thật. |

---

## 3. Ma trận so sánh (5 tiêu chí theo Seminar Guide §2.1)

Thang điểm: ★☆☆☆☆ (kém) → ★★★★★ (xuất sắc).

| Tiêu chí | Maze | Claude (vision) | Hotjar |
|---|---|---|---|
| **Chi phí bản quyền**<br/>*(Licence cost)* | ★★★☆☆ Bản Free đủ dùng nếu gom nhiều bước vào 1 bài test (1 study). | ★★★★☆ Free: chat trên web/desktop với vision. Pro: US$20 / tháng | ★★★★★ Free forever: 200 000 sessions/tháng, 1 project, replay + heatmap + funnel + basic survey. Growth: từ US$39/tháng. |
| **Độ dễ sử dụng**<br/>*(Learning curve)* | ★★★★☆ Giao diện kéo thả dễ làm quen, mất tầm 15-30 phút tự học. | ★★★★★ Cực kỳ dễ, chỉ cần chat bằng ngôn ngữ tự nhiên và gửi ảnh lên. | ★★★☆☆ Khá phức tạp, cần biết cách nhúng đoạn mã JavaScript vào trang web. |
| **Mức độ phù hợp**<br/>*(EShop fit)* | ★★★★★ Hoạt động được ngay trên bản vẽ mô phỏng (prototype) hoặc trang web chạy nội bộ (local). | ★★★★★ Rất dễ dàng, chỉ cần chụp ảnh màn hình giao diện cần test để phân tích. | ★★★☆☆ Rất khó triển khai vì bắt buộc phải sửa mã nguồn trang web để nhúng code theo dõi. |
| **Khả năng ứng dụng AI**<br/>*(AI capability)* | ★★☆☆☆ Khá hạn chế ở bản Free, tính năng tóm tắt bằng AI bị khóa ở bản trả phí. | ★★★★★ Rất mạnh, nhận diện được chữ/ảnh và đánh giá chuẩn theo 10 nguyên lý Nielsen. | ★★★☆☆ AI hỗ trợ phân tích và nhóm các phản hồi của người dùng. |
| **Cộng đồng hỗ trợ**<br/>*(Community)* | ★★★★☆ Kênh Discord hoạt động sôi nổi, nhiều tài liệu hướng dẫn trên mạng. | ★★★★★ Cộng đồng lập trình viên và người dùng AI khổng lồ trên toàn thế giới. | ★★★★★ Công cụ chuẩn công nghiệp cực kỳ phổ biến trong phân tích web. |

> Nguồn cross-check: screenshot trang pricing chụp ngày 2026-06-05 (lưu tại `ai-disclosure/screenshots/pricing/`):
> [maze.co/pricing](https://maze.co/pricing) · [claude.ai/pricing](https://claude.ai/pricing) · [hotjar.com/pricing](https://www.hotjar.com/pricing). Nội dung về heuristic cross-check với bài NN/g 2024 "Can AI replace usability testers?" (cited trong T01 brief §5).

---

## 4. Phương án đề xuất + Lý do 3-bullet

> **Pick**: **Maze (traditional) + Claude vision (AI-augmented)**.
> Backup giữ lại: **Hotjar**.

1. **Khớp với yêu cầu môn học & Tính khả thi**: Cặp đôi Maze + Claude đáp ứng đúng tiêu chuẩn ghép cặp (Traditional + AI). Maze chạy trực tiếp trên thiết kế mô phỏng (prototype) mà không cần can thiệp mã nguồn, còn Claude giúp đánh giá nhanh qua ảnh chụp màn hình.
2. **Maze có giao diện kéo thả trực quan**: Giúp nhóm dễ dàng xây dựng các nhiệm vụ kiểm thử (tasks) và bài khảo sát cho người dùng mà không yêu cầu kỹ năng kỹ thuật phức tạp.
3. **Tận dụng tài nguyên sẵn có**: Các thành viên trong nhóm đều đã có sẵn tài khoản Claude, giúp triển khai ngay lập tức, tiết kiệm thời gian thiết lập và tối ưu hóa lượt dùng.

---

## 5. AI Disclosure (yêu cầu Stage S1)

| Tool AI đã dùng | Mục đích | Đã cross-check những gì |
|---|---|---|
| Claude Opus 4.7 (web + IDE) | Draft ma trận so sánh và risk table; gợi ý cấu trúc 3-bullet rationale. | Toàn bộ pricing ban đầu đã được **screenshot** ngày 2026-06-05 từ trang pricing live của từng vendor và **được sửa lại** bởi thành viên A — pricing AI đưa ban đầu một phần đã lỗi thời (cutoff Jan 2026). |
| Verify thủ công trên web | Thay thế số liệu AI bằng số liệu verified bằng screenshot cho cả 5 tool ứng viên. | Screenshot đã archive tại `ai-disclosure/screenshots/pricing/` để audit. |

> Không có student ID, course-secret content hay credential EShop nào được nhập vào tool AI. Mọi gợi ý AI đều được người trong nhóm review và edit trước khi commit. Việc sửa pricing nêu trên là edit lớn nhất trước khi publish.

---

## 6. Bước tiếp theo (sau khi được instructor duyệt)

1. Lock scope theo [Scope Note](02_Scope_Note.md).
2. Chuyển sang Stage S3 — install Maze, chạy hello-world study, render Claude vision review đầu tiên.
3. Bắt đầu fill Section 3 (First Test) của [User Guide](03_User_Guide.md).

---

*Cập nhật lần cuối: 2026-06-05 · Draft v0.1.0 · chờ verdict Stage S2*
