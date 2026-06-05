# T01 — Seminar về GUI & Usability Testing

> CS423 / CSC15003 — Software Testing · Ấn bản AI-First 2026
> FIT @ HCMUS · Khoa Công nghệ Phần mềm
> Giảng viên: **TS. Trần Duy Hoàng**

Repo này chứa toàn bộ deliverable của nhóm cho seminar **T01 — GUI & Usability Testing**.
SUT (System Under Test) mà nhóm chọn là **luồng checkout của EShop**: giỏ hàng, coupon, địa chỉ, thanh toán.

---

## 1. Cặp công cụ nhóm chọn

Quy định của Seminar Track yêu cầu **1 tool truyền thống + 1 tool AI** trong mọi live demo. Sau khi so sánh các ứng viên trong [Tool Survey Proposal](docs/01_Tool_Survey_Proposal.md), nhóm chọn:

| Vai trò | Tool | Lý do |
|---|---|---|
| **Traditional** | **Maze** | Tạo task-based study (giỏ hàng, coupon, thanh toán), xuất click-path và heatmap. Free tier (1 study/tháng + 5 seats) đủ cho 5 tester. |
| **AI-augmented** | **Claude (vision)** | Upload screenshot của EShop, yêu cầu review theo Nielsen-10. Nhóm sẽ audit từng finding — chính bước audit này mới là điểm nhấn, không phải bản thân output AI. |
| Backup | Hotjar | Session recording + heatmap. Giữ làm dự phòng nếu lỡ "đốt" mất slot study của Maze trong tháng. |

> Đây vẫn là draft. Phương án cuối cùng cần được duyệt ở Stage S2 — xem [Scope Note](docs/02_Scope_Note.md).

---

## 2. Cấu trúc Repo

```
.
├── README.md                          ← bạn đang ở đây
├── docs/
│   ├── 01_Tool_Survey_Proposal.md     ← Deliverable Stage S1 (≤ 1 trang)
│   ├── 02_Scope_Note.md               ← Input cho Stage S2 instructor review
│   ├── 03_User_Guide.md               ← Skeleton Stage S4 (7 sections)
│   ├── 04_Activity_Worksheet.md       ← Deliverable Stage S5 (Heuristic Showdown)
│   └── 05_Seminar_Slides_Outline.md   ← Outline Stage S6 (≤ 15 slides)
├── assets/
│   └── diagrams/
│       ├── workflow_s1_s8.mmd         ← Mermaid: toàn bộ workflow seminar
│       └── checkout_flow.mmd          ← Mermaid: SUT EShop checkout
├── ai-disclosure/
│   └── AI_Usage_Log.md                ← Log liên tục về việc dùng AI
└── releases/
    └── v0.1.0-draft.md                ← Release notes cho buổi draft review
```

---

## 3. Trạng thái các Stage

| Stage | Trạng thái | Deliverable |
|---|---|---|
| S1 — Tool survey & proposal | **DRAFT** | [`docs/01_Tool_Survey_Proposal.md`](docs/01_Tool_Survey_Proposal.md) |
| S2 — Instructor review | PENDING (buổi draft review: 2026-06-06) | [`docs/02_Scope_Note.md`](docs/02_Scope_Note.md) |
| S3 — Deep study + EShop hands-on | CHƯA BẮT ĐẦU | — |
| S4 — User guide + screencast | **SKELETON** | [`docs/03_User_Guide.md`](docs/03_User_Guide.md) |
| S5 — Pre-share | CHƯA BẮT ĐẦU | [`docs/04_Activity_Worksheet.md`](docs/04_Activity_Worksheet.md) |
| S6 — Live seminar (45 phút) | CHƯA BẮT ĐẦU | [`docs/05_Seminar_Slides_Outline.md`](docs/05_Seminar_Slides_Outline.md) |
| S7 — Audience feedback | CHƯA BẮT ĐẦU | — |
| S8 — AI Audit + Reflection | CHƯA BẮT ĐẦU | — |

---

## 4. Định dạng nộp bài (theo yêu cầu của giảng viên)

- **Format**: Viết bằng Markdown.
- **Diagram**: Vẽ bằng Mermaid (nơi nào áp dụng được) — xem [`assets/diagrams/`](assets/diagrams/).
- **Video**: Upload lên YouTube; link ghi trong từng deliverable.
- **Project management**: Theo dõi qua GitHub commit log.
- **Submission**: Mỗi deadline được nộp qua **GitHub Releases**.

---

## 5. Thành viên nhóm

| Vai trò | Thành viên | GitHub |
|---|---|---|
| **C** — **Nhóm trưởng** · Demoer Claude vision · Facilitator activity | **Nguyễn Bình An** | [@CATO-OTAC](https://github.com/CATO-OTAC) |
| **A** — Presenter · Owner Tool Survey Proposal · Phụ trách AI disclosure | Phạm Ngọc Gia Bảo | [@giabaocode](https://github.com/giabaocode) |
| **B** — Demoer Maze · Owner Installation & First-Test docs | Lee Kun Da | [@0769776209](https://github.com/0769776209) |
| **D** — Timekeeper · Owner Failure-Modes + Slides outline | Lưu Ngô Quốc Bảo | [@BaoBeiii](https://github.com/BaoBeiii) |

> Quyết định nhóm theo nguyên tắc đồng thuận; khi không thống nhất, nhóm trưởng có quyền quyết định.

---

## 6. AI Disclosure

Mọi lần dùng AI để tạo nội dung repo này đều được log trong [`ai-disclosure/AI_Usage_Log.md`](ai-disclosure/AI_Usage_Log.md).
Theo AI Policy §7 của Seminar Guide, mọi output AI đều được người trong nhóm review và edit trước khi commit.

---

## 7. Tài liệu tham khảo

- [`materials/Seminar_Guide.docx.pdf`](materials/Seminar_Guide.docx.pdf) — workflow 8-stage + rubric
- [`materials/Seminar_Workflow_Briefing.pptx.pdf`](materials/Seminar_Workflow_Briefing.pptx.pdf) — slide briefing + prompt template
- [`materials/T01_GUI_and_Usability_Testing.docx`](materials/T01_GUI_and_Usability_Testing.docx) — đề tài T01
