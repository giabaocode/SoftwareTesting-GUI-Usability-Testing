# Log Sử Dụng AI — Seminar T01 GUI & Usability Testing

> **Custodian**: Phạm Ngọc Gia Bảo
> **Append-only**: mọi thành viên phải thêm 1 entry **trước** khi commit artefact có AI hỗ trợ.
> **Lý do tồn tại file này**: Seminar Guide §7 *AI Policy* + Workflow_Briefing slide 10 pitfall #1 — *"Copy-pasting AI output unedited"* trigger auto-penalty. Log này là bằng chứng cho thấy bước human-review đã diễn ra.

---

## Template entry (copy block này cho mỗi entry mới)

```
### YYYY-MM-DD · <thành viên> · <artefact>
- **Tool AI**: <tên + version, vd Claude Opus 4.7, ChatGPT 5, GitHub Copilot>
- **Mục đích**: <1 câu — bạn muốn AI hỗ trợ việc gì>
- **Tóm tắt prompt**: <≤ 3 câu; KHÔNG paste secret, PII, hay course-secret content>
- **Output đã dùng**: <file nào + section nào; vd "docs/03_User_Guide.md §6.2">
- **Cross-check**: <official docs / GH issue / paper URL + claim đã verify>
- **Đã edit gì trước commit**: <diff giữa output AI và bản commit cuối — diễn đạt bằng lời>
- **Mức độ tự tin sau review**: high / medium / low
- **Commit hash (điền sau khi commit)**: <git short-SHA>
```

---

## Các entry đã ghi

### 2026-06-05 · Gia Bảo · Scaffold + S1 Tool Survey Proposal
- **Tool AI**: Claude Opus 4.7
- **Mục đích**: Draft repo scaffold, README, và Tool Survey Proposal 1 trang với ma trận so sánh.
- **Tóm tắt prompt**: Đưa 3 PDF/docx course (Seminar_Guide, Workflow_Briefing, T01 brief) làm context. Yêu cầu đánh giá stage hiện tại của nhóm, đề xuất cặp tool traditional + AI cho SUT EShop checkout có lý do, và 1 kế hoạch viết theo 8 commit GitHub dự định làm tối nay.
- **Output đã dùng**:
  - `README.md`
  - `docs/01_Tool_Survey_Proposal.md` (section 1–7)
  - `docs/02_Scope_Note.md` (skeleton)
  - `docs/03_User_Guide.md` (skeleton 7 section)
  - `docs/04_Activity_Worksheet.md` (skeleton)
  - `docs/05_Seminar_Slides_Outline.md` (skeleton)
  - `assets/diagrams/workflow_s1_s8.mmd`, `assets/diagrams/checkout_flow.mmd`
- **Cross-check**:
  - **Pricing cho cả 5 tool ứng viên** (Maze, Claude, Hotjar, BrowserStack, UXTweak) → **screenshot trực tiếp** từ trang pricing live của từng vendor ngày 2026-06-05. Screenshot lưu tại `ai-disclosure/screenshots/pricing/`. **Sửa lớn** đã áp dụng vào Proposal — xem §2 và §3 của [`docs/01_Tool_Survey_Proposal.md`](../docs/01_Tool_Survey_Proposal.md). Cụ thể:
    - **Maze**: AI ban đầu nói "≤ 3 missions, ≤ 5 testers per mission". **Sửa thành** "1 study/tháng + 5 seats". Đây giờ là rủi ro chính cho seminar (xem Proposal §5).
    - **Hotjar**: AI ban đầu nói "Free Basic ≤ 35 sessions/day". **Sửa thành** "Free forever, 200 000 sessions/tháng, 1 project, có sẵn replay + heatmap + funnel".
    - **BrowserStack**: AI ban đầu nói "Live plan from US$29/mo". **Sửa thành** "Không có free tier vĩnh viễn; từ US$150/tháng (US$30/user × tối thiểu 5 user)".
    - **UXTweak**: AI ban đầu nói "Free ≤ 3 studies/mo". **Sửa thành** "Free: 15 responses/tháng, 1 concurrent study, truy cập kết quả 14 ngày; Business €92/tháng".
    - **Claude**: AI ban đầu nói "Pro US$20/mo". **Sửa thành** "Pro US$17/tháng trả năm (US$20 trả tháng); Max từ US$100/tháng".
  - Tên Nielsen 10 heuristic → verified với `nngroup.com/articles/ten-usability-heuristics/`.
  - Tool gợi ý cho T01 → verified với `materials/T01_GUI_and_Usability_Testing.docx` bảng 1 và 3.
  - 8 stage workflow + rubric weight → verified với `materials/Seminar_Guide.docx.pdf` §2 và §6.
- **Đã edit gì trước commit**:
  - Thay **mọi pricing figure** trong Proposal bằng số đã verify từ screenshot (như trên). Đây là edit lớn nhất trong draft.
  - Re-rate cột Licence-cost trong Comparison Matrix (§3) theo pricing đã sửa — Maze giảm từ ★★★★☆ xuống ★★★☆☆ (1 study/tháng là restrictive); Hotjar tăng lên ★★★★★ (free forever); BrowserStack giảm xuống ★☆☆☆☆ (không free vĩnh viễn).
  - Đổi "mission" → "study" toàn bộ (trang pricing Maze dùng "study"; product UI dùng "maze" nhưng để cross-team dễ đọc, nhóm dùng "study" trong docs).
  - Bỏ gợi ý của AI thêm BrowserStack làm AI-augmented tool (không có AI feature align với usability heuristic).
  - Siết 3-bullet rationale trong Proposal §4 để anchor rõ vào T01 §6 Milestone M1 và §7 in-class activity, giảm rủi ro RECLAIM.
  - Thay placeholder "expand later" của AI bằng tag `<!-- TODO @<tên> -->` để mỗi thành viên claim và commit phần của mình.
- **Mức độ tự tin sau review**: high cho pricing (verified bằng screenshot); medium cho claim feature tool (cần verify hands-on trong Stage S3 — đặc biệt giới hạn Maze "1 study/tháng" áp dụng cho study có 5 task).
- **Commit hash**: _điền sau khi commit_

---

### 2026-MM-DD · Lee Kun Da · User_Guide §2 Installation
<!-- TEMPLATE — copy và điền trước Stage S3 milestone M1 -->

---

### 2026-MM-DD · Nguyễn Bình An · User_Guide §4 Advanced Usage + pilot Activity Worksheet
<!-- TEMPLATE — copy và điền trước Stage S5 -->

---

### 2026-MM-DD · Lưu Ngô Quốc Bảo · User_Guide §6 Failure Modes
<!-- TEMPLATE — copy và điền trước Stage S5. Cite primary source cho mỗi failure mode — không bịa. -->

---

## Luật cứng (nhắc lại từ Seminar Guide §7)

1. **Không copy-paste**. Mọi output AI phải được edit bởi người trước khi commit. Paste trực tiếp = vi phạm học thuật.
2. **Cite nguồn gốc, không cite AI**. Nếu Claude bảo Maze giá $99/tháng, cite `maze.co/pricing`, không cite Claude.
3. **Không secret trong prompt**. Không bao giờ paste student ID, credential EShop staging, hay course-secret content.
4. **Không bịa**. Không dùng AI để tạo audience feedback, attendance, hay citation giả.
5. **Mỗi artefact 1 entry**. Mỗi commit có nội dung AI hỗ trợ phải reference 1 entry ở đây.
