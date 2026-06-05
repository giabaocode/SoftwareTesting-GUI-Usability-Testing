# [S4] User Guide — Maze + Claude Vision trên EShop Checkout

> **Stage**: S4 (User-guide + demo recording)
> **Section bắt buộc**: 7 (theo Workflow_Briefing slide 6, gồm cả section **Failure Modes** mới)
> **Độ dài**: target 1500–2500 từ khi đã fill xong
> **Ràng buộc format**: Chỉ Markdown; screenshot lưu trong `assets/screenshots/`
>
> **Ownership** (giai đoạn skeleton; mỗi người hoàn thiện phần của mình trước Stage S5):
> - §1 Giới thiệu → **Phạm Ngọc Gia Bảo** (search `@GiaBảo`)
> - §2 Installation → **Lee Kun Da** (search `@KunDa`)
> - §3 First Test → **Lee Kun Da** (search `@KunDa`)
> - §4 Advanced Usage → **Nguyễn Bình An** (search `@BìnhAn`)
> - §5 Troubleshooting → **Nguyễn Bình An** (search `@BìnhAn`)
> - §6 Failure Modes → **Lưu Ngô Quốc Bảo** (search `@QuốcBảo`)
> - §7 References → **Lưu Ngô Quốc Bảo** (search `@QuốcBảo`)

---

## 1. Giới thiệu

### 1.1 Bối cảnh vấn đề
Functional test nói cho bạn biết nút "Place Order" có hoạt động không. Nó không nói cho bạn biết user có *tìm thấy* nút, có *tin tưởng* nó, hay có *hồi phục* được sau khi click nhầm hay không. GUI & Usability testing lấp vào khoảng trống đó. Câu hỏi đơn giản: *cái đó có dễ không? có rõ ràng không? hệ thống có nói cùng ngôn ngữ với user không?* Nielsen viết ra những câu hỏi này từ 1994 và đến 2026 chúng vẫn còn dùng được.

### 1.2 Hướng dẫn này dành cho ai
Hướng dẫn này dành cho sinh viên CS423 muốn chấm EShop checkout theo Nielsen-10. Nhóm dùng Maze làm tool truyền thống và Claude vision làm tool AI. Bạn không cần kinh nghiệm usability testing trước đó. Bạn chỉ cần 1 trình duyệt và biết cách chụp screenshot.

### 1.3 Sau khi đọc hướng dẫn này, bạn có thể
Sau khi đọc hết các section, bạn có thể:
- Chạy 1 usability study 5-tester trên EShop checkout với Maze. Nhóm gói 5 task (mỗi màn hình 1 task) vào 1 study duy nhất để vừa giới hạn free tier 1 study/tháng.
- Chấm cùng những màn hình đó theo Nielsen-10 bằng tay, sau đó chạy Claude vision review trên cùng screenshot và đối chiếu cả hai bên cạnh nhau.
- Gắn nhãn severity cho từng finding (cosmetic / minor / major / catastrophic) và biến kết quả thành báo cáo 1 trang để team dev EShop có thể hành động.

### 1.4 Khi nào KHÔNG nên dùng cách này
Bỏ qua cặp tool này nếu rơi vào một trong các trường hợp:
- SUT là single-page app nặng. Maze không capture được màn hình thay đổi behind the scenes mà không có prototype đã build sẵn, và Claude vision chỉ thấy snapshot bạn upload — cả 2 đều không nhìn thấy state động.
- Screenshot có dữ liệu cá nhân (tên khách hàng, địa chỉ, số thẻ). Không paste những thứ này vào AI bên thứ ba; cả data policy của HCMUS lẫn AI Policy §7 đều cấm.
- Bạn cần hơn 5 tester trong 1 round. Free tier Maze giới hạn 5 seat/study và Starter plan ($99/tháng) cũng vẫn giữ giới hạn 1 study/tháng — trả tiền không mở khoá thêm tester.

---

## 2. Installation

### 2.1 Yêu cầu trước
| Yêu cầu | Phiên bản tối thiểu | Lý do |
|---|---|---|
| Browser hiện đại | Chrome 120+ / Edge 120+ | Maze study editor cần |
| Tài khoản Maze | Free tier | Đăng ký tại maze.co |
| Tài khoản Claude | Free tier (anthropic.com) hoặc `claude.ai` | Cho vision upload |
| Tool screenshot | OS built-in (Snipping Tool / ⌘+Shift+4) | Capture màn hình EShop |
| URL EShop staging | Course cung cấp | Xem [`02_Scope_Note.md`](02_Scope_Note.md) §Q5 |

### 2.2 Cài đặt từng bước — Maze
1. Mở https://maze.co và click **Sign up free**.
2. Chọn **Continue with email** (KHÔNG dùng option Google SSO — xem §5.2 Troubleshooting).
3. Xác thực email; sẽ vào được dashboard Maze.
4. Click **Create new maze** → **Start from scratch**.

<!-- TODO @KunDa: chèn screenshot tại bước này — assets/screenshots/maze_dashboard.png. Khoanh đỏ nút "Create new maze". -->

5. <!-- TODO @KunDa: tiếp tục 3-5 step nữa cho tới khi "first empty study sẵn sàng". Mô tả command/click chính xác, đừng viết "navigate to settings". -->

### 2.3 Cài đặt từng bước — Claude vision
1. <!-- TODO @KunDa: 5-7 step từ "mở claude.ai" tới "image-prompt đầu tiên đã gửi". Lưu ý rate-limit ở free tier. -->

### 2.4 Note theo OS
<!-- TODO @KunDa: 1 đoạn cho mỗi Windows / macOS / Linux. Lưu ý: máy lab HCMUS chạy Windows 11. -->

---

## 3. First Test — End-to-end trên EShop trong ≤ 15 step

> Theo Workflow_Briefing slide 6: "End-to-end on EShop in ≤ 15 steps".

### 3.1 Scenario
1 user lần đầu vào EShop muốn: **Search "wireless headphones" → thêm cái rẻ nhất vào giỏ → áp coupon `SAVE10` → checkout dưới dạng guest, thanh toán COD.**

### 3.2 Build Maze study (step 1–8)
1. <!-- TODO @KunDa: từng step cho "Add task" → "Add screen" → ... → "Get share link". Đánh số từng step. -->
2. ...

### 3.3 Claude vision review (step 9–12)
9. <!-- TODO @KunDa: từng step cho "screenshot the page" → "open Claude" → "paste prompt template" → "save report". -->
10. ...

### 3.4 So sánh 2 output (step 13–15)
13. <!-- TODO @KunDa: cách align finding quantitative của Maze (vd 60% task success) với finding qualitative của Claude (vd "Match between system and real world: ✗"). -->

### 3.5 Artefact output dự kiến
Sau khi xong §3, bạn sẽ có 4 file lưu trong `assets/first-test-run/`:

- `maze_study_report.pdf`
- `maze_heatmap_screen-S03.png`
- `claude_heuristic_report.md`
- `comparison_table.md`

---

## 4. Advanced Usage

### 4.1 Maze — branching study
<!-- TODO @BìnhAn: giải thích conditional branching: cách gửi tester FAIL S-02 đi route khác với tester success. 1 ví dụ ngắn. -->

### 4.2 Maze — chạy session parallel
<!-- TODO @BìnhAn: cách gửi cùng 1 study tới 5 tester parallel và aggregate kết quả. -->

### 4.3 Claude vision — multi-image batch prompting
<!-- TODO @BìnhAn: giải thích cách upload tối đa 5 screenshot trong 1 prompt và yêu cầu 1 heuristic report tổng hợp. Bao gồm prompt chính xác sẽ dùng — anchor vào Workflow_Briefing slide 9 TEMPLATE 1. -->

### 4.4 Claude vision — audit output của chính AI bằng TEMPLATE 4
<!-- TODO @BìnhAn: demo cách dùng AI Prompt TEMPLATE 4 từ Workflow_Briefing slide 9 để critique review đầu tiên của Claude. Đây là điểm khác biệt quan trọng cho rubric depth-of-study. -->

### 4.5 Rubric severity tự chế
Áp dụng thang 4 bậc T01 §2: cosmetic / minor / major / catastrophic.

<!-- TODO @BìnhAn: viết 1 đoạn mô tả anchor cho từng level, kèm 1 ví dụ EShop-specific cho mỗi cái. -->

---

## 5. Troubleshooting (≥ 3 lỗi thật + cách fix)

> Theo Workflow_Briefing slide 6: ít nhất 3 lỗi thật nhóm đã gặp, kèm fix. Không bịa lỗi.

### 5.1 Lỗi: Maze study link trả 404 sau khi publish
**Triệu chứng**: <!-- TODO @BìnhAn: triệu chứng thật -->
**Nguyên nhân**: <!-- TODO @BìnhAn -->
**Fix**: <!-- TODO @BìnhAn -->

### 5.2 Lỗi: Maze Google-SSO loop
**Triệu chứng**: <!-- TODO @BìnhAn: viết đúng những gì đã quan sát -->
**Nguyên nhân**: <!-- TODO @BìnhAn -->
**Fix**: <!-- TODO @BìnhAn -->

### 5.3 Lỗi: Claude vision từ chối screenshot với "image too large"
**Triệu chứng**: claude.ai trả về *"This image is too large to process"* và screenshot không được phân tích.
**Nguyên nhân** (verified trên [docs.anthropic.com/.../vision](https://docs.anthropic.com/en/docs/build-with-claude/vision) ngày 2026-06-05):
- **claude.ai và direct Claude API**: tối đa **10 MB** mỗi ảnh (base64-encoded).
- **Amazon Bedrock / Vertex AI**: chặt hơn — tối đa **5 MB** mỗi ảnh.
- Tất cả endpoint: tối đa **8000×8000 px**. Nếu gửi hơn 20 ảnh/request, giới hạn dimension giảm xuống **2000×2000 px**.
- Bất kể size upload là bao nhiêu, Claude resize ảnh về "native resolution" trước khi xử lý (1568 px cạnh dài cho hầu hết model; 2576 px cho Opus 4.7+). Upload lớn hơn không thêm fidelity — chỉ tăng latency và token cost.

**Fix**:
1. Nén screenshot: `pngquant input.png --output out.png` (Linux/macOS) hoặc paint.NET *"Save As JPEG quality 85"* (Windows).
2. Hoặc pre-resize về ~1600 px cạnh dài — khớp với native resolution của Claude và giảm latency.
3. Verify size cuối < 10 MB trước khi upload.

### 5.4 (Lỗi bonus thứ 4) <!-- TODO @BìnhAn: thêm lỗi thứ 4 nếu gặp trong S3 -->

---

## 6. Failure Modes (≥ 3 cách tool có thể đánh lừa bạn)

> **KHÔNG ĐƯỢC SKIP** — đây là 1 trong top-6 auto-penalty pitfall (Workflow_Briefing slide 10).
> Dùng AI Prompt TEMPLATE 2 (Workflow_Briefing slide 9) để brainstorm, sau đó **verify từng entry với official docs / GitHub issue / paper**. Không bịa.

### 6.1 Failure mode: Maze success-rate over-confidence
- **Trigger**: 5 tester đều hoàn thành task trong < 30s.
- **Triệu chứng**: dashboard hiện "100% success" → team kết luận màn hình đã usable.
- **Vì sao đánh lừa**: <!-- TODO @QuốcBảo: giải thích selection bias — tester Maze thường là UX-literate; khách EShop thật thì không. Cite bài NN/g 2024. -->
- **Detection**: <!-- TODO @QuốcBảo -->
- **Mitigation**: <!-- TODO @QuốcBảo -->

### 6.2 Failure mode: Claude vision bịa UI element
- **Trigger**: yêu cầu Claude evaluate 1 screenshot mà *coupon field* **không có** trên đó.
- **Triệu chứng**: Claude trả về heuristic violation về "coupon field placement" mà thực ra không có trên màn hình.
- **Vì sao đánh lừa**: <!-- TODO @QuốcBảo: giải thích LLM có thể pattern-match layout e-commerce kỳ vọng lên screenshot thật. Cite primary source (Anthropic blog hoặc model card). -->
- **Detection**: <!-- TODO @QuốcBảo -->
- **Mitigation**: <!-- TODO @QuốcBảo -->

### 6.3 Failure mode: AI miscalibrate severity
- **Trigger**: Claude rate "low text contrast" là **major** nhưng rate "không có error message khi coupon invalid" là **minor**.
- **Triệu chứng**: thứ tự severity không khớp với thứ tự của human expert.
- **Vì sao đánh lừa**: T01 §7 cảnh báo rõ *"Severity rating must be human-final; AI severity is often miscalibrated."*
- **Detection**: đối chiếu từng severity của AI với scoring thủ công của team; flag những chênh lệch > 1 level.
- **Mitigation**: <!-- TODO @QuốcBảo: viết protocol nhóm — vd "Severity AI chỉ là tham khảo; nhóm trưởng quyết định cuối tại weekly review." -->

### 6.4 (Mode thứ 4 bonus) <!-- TODO @QuốcBảo: thêm mode thứ 4 nếu gặp. Maze recording dừng ở biên iframe là 1 lỗi phổ biến. -->

---

## 7. References

### 7.1 Nguồn primary
- Nielsen, J. (1994; rev. 2020). **10 Usability Heuristics for User Interface Design**. Nielsen Norman Group. https://www.nngroup.com/articles/ten-usability-heuristics/
- Krug, S. (2010). **Rocket Surgery Made Easy**. New Riders. (Ch. 1–3 về remote test lightweight.)
- BS EN ISO 9241-11:2018 — *Ergonomics of human-system interaction — Part 11: Usability: Definitions and concepts.*
- NN/g (2024). *Can AI replace usability testers?* — cite theo T01 brief §5.

### 7.2 Documentation của vendor
- Maze docs: https://help.maze.co
- Claude API & vision: https://docs.anthropic.com
- <!-- TODO @QuốcBảo: thêm Hotjar docs (backup) + plugin community nào reference -->

### 7.3 Tài liệu course
- [`materials/Seminar_Guide.docx.pdf`](../materials/Seminar_Guide.docx.pdf)
- [`materials/Seminar_Workflow_Briefing.pptx.pdf`](../materials/Seminar_Workflow_Briefing.pptx.pdf)
- [`materials/T01_GUI_and_Usability_Testing.docx`](../materials/T01_GUI_and_Usability_Testing.docx)

### 7.4 AI Disclosure
Skeleton của guide này được draft bằng Claude Opus 4.7 ngày 2026-06-05. Mọi claim factual trong §6 (Failure Modes) **phải re-verify với nguồn primary đã cite** trước khi submit — xem [`ai-disclosure/AI_Usage_Log.md`](../ai-disclosure/AI_Usage_Log.md).

---

*Cập nhật lần cuối: 2026-06-05 · Skeleton v0.1.0 · Phân chia cho 4 thành viên — xem ownership block ở đầu file.*
