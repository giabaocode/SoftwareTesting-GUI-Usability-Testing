# AI Usage Log

> Theo AI Policy §7 của Seminar Guide, mọi lần sử dụng AI để tạo nội dung repo này đều được log tại đây.
> Mọi output AI đều được thành viên nhóm review và chỉnh sửa trước khi commit.

- **Link quy định tham khảo:** [AI Usage Guidelines](https://drive.google.com/file/d/1l6bO6fog1eM6K4_10oMshg5GawmEkr_o/view?usp=sharing)

---

# Log Sử Dụng AI — Seminar T01 GUI & Usability Testing

## Các entry đã ghi

### 2026-7-4 · Lee Kun Da
- **Tool AI**: Gemini
- **Mục đích**: Tóm tắt toàn độ session với Gemini
- **Tóm tắt prompt**: tóm tắt lại toàn bộ session cho t
- **Minh chứng**: ![Alt text](/ai-disclosure/screenshots/Lee%20Kun%20Da/tool_survey_proposal_session_summary.png)
![Alt text](/ai-disclosure/screenshots/Lee%20Kun%20Da/tool_survey_proposal_session_summary1.png)

### 2026-7-4 · Lee Kun Da
- **Tool AI**: Claude
- **Mục đích**: Tóm tắt toàn độ session với Claude trên Anti Gravity
- **Tóm tắt prompt**: tóm tắt session cho t
- **Minh chứng**: ![Alt text](/ai-disclosure/screenshots/Lee%20Kun%20Da/tool_survey_proposal_session_summary2.png)
![Alt text](/ai-disclosure/screenshots/Lee%20Kun%20Da/tool_survey_proposal_session_summary3.png)
---

### 2026-MM-DD · Lee Kun Da 

---

### 2026-7-4 · Nguyễn Bình An
- **Tool AI**: Gemini
- **Mục đích**: Tìm hiểu, so sánh các tool Phần 1 - UI Testing trong `Tool_Survey_Proposal.md` (Manual UI Testing, Browserstack, Claude Vision).
- **Minh chứng**:
![Alt text](/ai-disclosure/screenshots/Nguyen%20Binh%20An/tool_survey_proposal_UI_Testing1.png)
![Alt text](/ai-disclosure/screenshots/Nguyen%20Binh%20An/tool_survey_proposal_UI_Testing2.png)
![Alt text](/ai-disclosure/screenshots/Nguyen%20Binh%20An/tool_survey_proposal_UI_Testing3.png)
---

---

### 2026-7-4 · Lưu Ngô Quốc Bảo
- **Tool AI**: Gemini
- **Mục đích**: Tóm tắt lại toàn bộ nội dung và tiến trình làm việc của session hiện tại.
- **Tóm tắt prompt**: tóm tắt lại toàn bộ session làm việc.
- **Tóm tắt response**: AI hệ thống hóa lại toàn bộ tiến trình dưới dạng các đề mục rõ ràng, bao gồm việc chốt cặp công cụ, các nội dung đã chỉnh sửa trong deep_study_hands_on.md và weekly_report_w4.md, cũng như việc tối ưu hóa, gom gọn cấu trúc nhật ký sử dụng AI trong file AI_Usage_Log.md.
- **Minh chứng**: 
![alt text](/ai-disclosure/screenshots/Luu%20Ngo%20Quoc%20Bao/deep_study_hands_on_summary_1.png)
![alt text](/ai-disclosure/screenshots/Luu%20Ngo%20Quoc%20Bao/deep_study_hands_on_summary_2.png)
![alt text](/ai-disclosure/screenshots/Luu%20Ngo%20Quoc%20Bao/deep_study_hands_on_summary_3.png)
---

### 2026-7-11 · Lưu Ngô Quốc Bảo
- **Tool AI**: Gemini (Antigravity IDE)
- **Mục đích**:
  - Biên soạn tài liệu `UserGuide_UI_Testing.md` (hướng dẫn manual UI testing với BrowserStack và Claude Vision) dựa trên tài liệu nghiên cứu sâu `DeepStudyHandsOn.md` và template cấu trúc định sẵn.
  - Phân tích mã nguồn và tài liệu cài đặt của thư mục `eshop-sut` để đồng bộ hóa và cập nhật chính xác các thông tin thực tế của ứng dụng (lệnh seed database, cấu hình cổng Web Admin, tài khoản kiểm thử mặc định, và danh sách mã coupon thật của SUT).
- **Tóm tắt prompt**:
  - Yêu cầu đọc `DeepStudyHandsOn.md` phần UI testing và viết `UserGuide_UI_Testing.md` theo template mẫu.
  - Yêu cầu đọc thư mục đồ án `eshop-sut` để tìm kiếm và cập nhật các thông tin còn thiếu hoặc cần hiệu chỉnh trong user guide.
- **Tóm tắt response**:
  - Viết tài liệu `UserGuide_UI_Testing.md` hoàn chỉnh theo định dạng Markdown với đầy đủ 7 phần.
  - Chỉnh sửa, bổ sung các phần cài đặt hệ thống (bao gồm lệnh `node database.js` khởi tạo DB mẫu, command chạy `frontend-admin`), bảng môi trường kiểm thử (thêm tài khoản test/admin mặc định), và bổ sung bảng thông tin mã coupon thực tế của SUT (`SAVE10`, `BIGBUY`, `VIP100`, `EXPIRED`).
- **Minh chứng**:
  - ![alt text](/ai-disclosure/screenshots/Luu%20Ngo%20Quoc%20Bao/Screenshot%202026-07-11%20200947.png)
  - ![alt text](/ai-disclosure/screenshots/Luu%20Ngo%20Quoc%20Bao/Screenshot%202026-07-11%20201015.png)
  ![alt text](/ai-disclosure/screenshots/Luu%20Ngo%20Quoc%20Bao/Screenshot%202026-07-11%20201028.png)
---
  ### 2026-07-11–12 · Lee Kun Da

  - **AI tool:** Codex, GPT-5, OpenAI/Codex
  - **Purpose:** Review and refine the Maze Usability Testing User Guide for the EShop checkout seminar.
  - **Prompt summary:** Asked Codex to read the existing `User_Guide.md` on branch `Da/user_guide`, identify the remaining work, explain public/staging access for Maze, design a
  complete Maze Free study, integrate the Maze tracking snippet, update Sections 3.2–3.4 according to the actual study, and shorten the guide. Follow-up prompts covered the seven
  Maze blocks, participant starting states, alternative paths, address handling, and manual review of unfinished missions.
  - **Response summary:** Codex reviewed the existing guide and EShop flow, configured the frontend for one public ngrok tunnel through a Vite API proxy, integrated the Maze
  snippet, and redesigned the study as one end-to-end Free Explore task followed by six questions. It updated the guide to use only evidence supported by the actual Maze
  configuration, added pilot and participant instructions, removed unsupported automatic metrics, and shortened the document.
  - **Human work and verification:** Lee Kun Da created and configured the Maze study, supplied the tracking snippet, checked the study flow, requested corrections based on the
  actual Maze Free interface, reviewed the shortened User Guide, and committed the result as `090be8f`.
  - **Evidence:** 
![alt text](<ui guide summary.png>)