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

| # | Tool | Loại | Licence / Chi phí (verified 2026-06-05) |
|---|---|---|---|
| C1 | **Maze** | Traditional — remote unmoderated usability testing | **Free**: 1 study/tháng, 5 seats, essential prototype testing + surveys. **Starter**: US$99/tháng (vẫn giới hạn 1 study/tháng nhưng mở khoá unmoderated toolkit, screen recording). **Enterprise**: custom. |
| C2 | **Claude (vision)** | AI-augmented — multimodal heuristic reviewer | **Free**: chat trên web/desktop với vision, search, MCP. **Pro**: US$17/tháng nếu trả năm (US$20 nếu trả tháng). **Max**: từ US$100/tháng (usage 5×–20× Pro). |
| C3 | **Hotjar** | Backup — session recording, heatmap, survey | **Free forever**: 200 000 sessions/tháng, 1 project, replay + heatmap + funnel + basic survey. **Growth**: từ US$39/tháng. |
| C4 (alt) | BrowserStack Live | Alt traditional — cross-browser exploratory | **Không có free tier vĩnh viễn.** Live Team: US$30/user/tháng × tối thiểu 5 user = **US$150/tháng (trả năm)**. Team Ultimate (có AI agent): US$375/tháng. |
| C5 (alt) | UXTweak AI | Alt AI-augmented — heatmap interpretation, draft report | **Free**: 1 user, 15 responses/tháng, 1 concurrent study, **truy cập kết quả 14 ngày**. **Business**: €92/tháng (trả năm). |

---

## 3. Ma trận so sánh (5 tiêu chí theo Seminar Guide §2.1)

Thang điểm: ★☆☆☆☆ (kém) → ★★★★★ (xuất sắc).

| Tiêu chí | Maze | Claude (vision) | Hotjar | BrowserStack | UXTweak AI |
|---|---|---|---|---|---|
| **Licence cost** | ★★★☆☆ free 1 study/tháng + 5 seats — vừa đủ nếu gói 5 task vào 1 study | ★★★★☆ free tier đủ cho ~10 lần review vision; Pro $17/tháng nếu cần backup | ★★★★★ free forever, 200k sessions/tháng — nhưng chỉ có giá trị nếu SUT đang deploy public | ★☆☆☆☆ không có free vĩnh viễn; tối thiểu $150/tháng = phá ngân sách sinh viên | ★★☆☆☆ free 15 responses/tháng nhưng chỉ giữ kết quả 14 ngày |
| **Learning curve** | ★★★★☆ drag-and-drop builder cho study | ★★★★★ chat interface, không cần install | ★★★☆☆ phải cài JS tag lên SUT | ★★★☆☆ live VM session — cần plan scenario | ★★★☆☆ ít documentation ngoài vendor docs |
| **EShop fit** | ★★★★★ task-based study khớp với luồng Cart→Coupon→Pay | ★★★★★ checkout screen tĩnh — lý tưởng cho screenshot review | ★★★☆☆ cần deploy live để capture session thật (SUT của course không có) | ★★★☆☆ tốt cho cross-device nhưng không phải cho heuristic usability | ★★★☆☆ overlap với Maze, không có lợi thế riêng |
| **AI capability** | ★★☆☆☆ AI summary cơ bản, full AI feature khoá ở Enterprise | ★★★★★ vision multimodal đầy đủ, reasoning theo Nielsen-10 | ★★★☆☆ AI clustering theme từ feedback | ★★★☆☆ AI agent (test-case gen, proofreader) nhưng chỉ ở Team Ultimate | ★★★★☆ AI heatmap interpretation có ở free tier |
| **Community** | ★★★★☆ Discord active, ~700 GH stars cho unofficial plugin | ★★★★★ ecosystem developer rộng, MCP integration | ★★★★★ analytics chuẩn công nghiệp | ★★★★☆ community thiên về enterprise | ★★☆☆☆ community nhỏ ở Đông Âu |

> Nguồn cross-check: screenshot trang pricing chụp ngày 2026-06-05 (lưu tại `ai-disclosure/screenshots/pricing/`):
> [maze.co/pricing](https://maze.co/pricing) · [claude.ai/pricing](https://claude.ai/pricing) · [hotjar.com/pricing](https://www.hotjar.com/pricing) · [browserstack.com/pricing](https://www.browserstack.com/pricing) · [uxtweak.com/pricing](https://www.uxtweak.com/pricing). Nội dung về heuristic cross-check với bài NN/g 2024 "Can AI replace usability testers?" (cited trong T01 brief §5).

---

## 4. Phương án đề xuất + Lý do 3-bullet

> **Pick**: **Maze (traditional) + Claude vision (AI-augmented)**.
> Backup giữ lại: **Hotjar**.

1. **Khớp với những gì T01 brief đã yêu cầu.** Milestone M1 ở T01 §6 ghi rõ *"Install Maze trial; build 3 EShop task flows"* và §4 liệt kê *"ChatGPT / Claude vision"* làm ví dụ AI tool. In-class activity ở §7, *Heuristic Showdown — Human vs AI*, cũng được thiết kế cho đúng cặp này. Chọn cặp này giảm rủi ro nhận verdict RECLAIM ở S2.
2. **Hợp với SUT EShop và time-box.** Maze chạy được task flow mà không cần production site, Claude review screenshot tĩnh trong vài giây. Cả hai đều có free tier đủ dùng trong 4 tuần. Mỗi tool tạo ra artefact đưa lên slide được: heatmap PNG từ Maze, heuristic report Markdown từ Claude.
3. **Câu chuyện Rule of Pairing rõ ràng.** Maze cho số liệu (task success, time-on-task). Claude cho heuristic finding bằng chữ. Hai output không overlap, nên demo 10 phút show được cả hai. Hai output cũng gặp nhau ở phần so sánh severity human-vs-AI mà T01 §7 yêu cầu.

---

## 5. Rủi ro & Giảm thiểu

| Rủi ro | Khả năng | Phương án giảm thiểu |
|---|---|---|
| **Maze free tier giới hạn 1 study/tháng** — không launch được study thứ 2 nếu cái đầu hỏng giữa tháng | Trung bình | Coi toàn bộ EShop checkout là **1 Maze study với 5 task** (mỗi task = 1 màn hình S-01 → S-05) chứ không phải 5 study riêng. Build + QA study trước trong private rồi mới gửi link. |
| Claude vision bị rate-limit giữa demo | Trung bình | Pre-generate AI heuristic report trước, replay trên slide; chỉ show 1 lần *live* fresh-screenshot review để có authenticity. |
| EShop staging không hoạt động vào ngày demo | Thấp | Có sẵn local mock build + screencast backup (theo Workflow_Briefing slide 7 *"have a backup recording ready"*). |
| Audience không kịp hoàn thành activity trong 25 phút | Trung bình | Worksheet in sẵn timebox; facilitator hard-stop ở mốc 0:18. Xem [Activity Worksheet](04_Activity_Worksheet.md). |
| Hotjar backup không dùng được (cần live deploy không có) | Trung bình | Nếu slot Maze study bị "đốt", fallback sang **UXTweak AI free** cho 15 responses — chấp nhận giới hạn 14 ngày giữ kết quả. Không khuyến nghị BrowserStack/Hotjar làm fallback cho usability heuristic (không hợp scope). |

---

## 6. AI Disclosure (yêu cầu Stage S1)

| Tool AI đã dùng | Mục đích | Đã cross-check những gì |
|---|---|---|
| Claude Opus 4.7 (web + IDE) | Draft ma trận so sánh và risk table; gợi ý cấu trúc 3-bullet rationale. | Toàn bộ pricing ban đầu đã được **screenshot** ngày 2026-06-05 từ trang pricing live của từng vendor và **được sửa lại** bởi thành viên A — pricing AI đưa ban đầu một phần đã lỗi thời (cutoff Jan 2026). |
| Verify thủ công trên web | Thay thế số liệu AI bằng số liệu verified bằng screenshot cho cả 5 tool ứng viên. | Screenshot đã archive tại `ai-disclosure/screenshots/pricing/` để audit. |

> Không có student ID, course-secret content hay credential EShop nào được nhập vào tool AI. Mọi gợi ý AI đều được người trong nhóm review và edit trước khi commit. Việc sửa pricing nêu trên là edit lớn nhất trước khi publish.

---

## 7. Bước tiếp theo (sau khi được instructor duyệt)

1. Lock scope theo [Scope Note](02_Scope_Note.md).
2. Chuyển sang Stage S3 — install Maze, chạy hello-world study, render Claude vision review đầu tiên.
3. Bắt đầu fill Section 3 (First Test) của [User Guide](03_User_Guide.md).

---

*Cập nhật lần cuối: 2026-06-05 · Draft v0.1.0 · chờ verdict Stage S2*
