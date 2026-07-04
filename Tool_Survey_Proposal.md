# Báo cáo: Topic Claim & Tool Survey
 
**Thành viên nhóm:**

| Họ tên | MSSV | Phần phụ trách |
| :--- | :--- | :--- |
| Nguyễn Bình An | 23127149 | Tìm hiểu và phân tích các công cụ UI Testing   |
| Phạm Ngọc Gia Bảo | 23127027 | Tìm hiểu và hỗ trợ chọn tool Maze |
| Lee Kun Da | 23127035 | Tìm hiểu sơ lược các tools usability test và viết report |
| Lưu Ngô Quốc Bảo | 23127327 | Tìm hiểu và hỗ trợ chọn tool Useberry  |

**Ngày tháng:** 3/7/2026  

> Đây là report được viết lại vì sau quá trình meeting với giảng viên, một số tool và nội dung được điều chỉnh lại
---

## PHẦN 1: UI TESTING (Kiểm thử Giao diện Người dùng)

### 1. Khảo sát các công cụ
*Liệt kê và phân tích các công cụ/công nghệ có thể sử dụng cho UI Testing.*

#### 1.1 Manual UI Testing
- **Giới thiệu tổng quan:** Bản chất là kỹ sư QA dùng mắt, tay và tư duy logic để trực tiếp thao tác trên ứng dụng, cảm nhận trải nghiệm người dùng (UX) và tìm lỗi. Đây là phương pháp tiếp cận dựa trên trực giác con người (Intuition), khác biệt hoàn toàn so với hai phương pháp còn lại.
- **Ưu điểm (Pros):**
  - Đánh giá được trải nghiệm (UX) — chỉ con người mới cảm nhận được font chữ có khó đọc không, bố cục có rối mắt không, luồng thao tác có mượt mà hay không
  - Phát hiện lỗi logic và edge-case xuất sắc thông qua Exploratory Testing — tìm ra lỗi "kỳ quặc" phát sinh ngẫu nhiên mà không script hay AI nào nghĩ ra được
  - Chi phí ban đầu bằng 0 — không cần mua tool, không cần setup hạ tầng, mở app lên là test được ngay
- **Nhược điểm (Cons):**
  - Tốc độ chậm, tốn nguồn lực — thử nghiệm lặp lại một tính năng qua nhiều phiên bản rất nhàm chán và tốn thời gian
  - Bị giới hạn bởi thiết bị vật lý — tester chỉ test được trên vài máy có sẵn tại văn phòng
  - Yếu tố chủ quan — kết quả có thể bị bỏ sót do tester mệt mỏi hoặc mất tập trung
- **Use-case phù hợp:** Giai đoạn đầu dự án khi giao diện và tính năng còn thay đổi liên tục hàng tuần; khi cần kiểm thử tính năng mới tinh (new features) hoặc đánh giá độ mượt của UX.

#### 1.2 Browserstack
- **Giới thiệu tổng quan:** Browserstack không thay thế con người hay AI, mà là một kho thiết bị ảo/thật trên Cloud. Nhóm có thể "mượn" thiết bị thật (như iPhone 16, máy tính cài Safari) để làm Manual Test (qua BrowserStack Live) hoặc chạy code Automation.
- **Ưu điểm (Pros):**
  - Độ chính xác tuyệt đối nhờ test trên thiết bị thật 100%, bắt được lỗi hiển thị đặc thù của từng dòng máy (VD: lỗi tràn viền Dynamic Island trên iPhone)
  - Giải quyết bài toán tương thích cross-browser/cross-device với hơn 3.000 cấu hình có sẵn, không cần mua thiết bị thật
  - Hỗ trợ cả Manual (giao diện click chuột test tay) lẫn Automation (chạy test tự động hàng loạt - Parallel Testing)
- **Nhược điểm (Cons):**
  - Chi phí rất đắt đỏ — phí bản quyền tính theo nghìn USD/năm, vượt ngân sách dự án nhỏ/startup
  - Phụ thuộc mạng — điều khiển máy ảo/thật từ xa qua Internet nên mạng yếu sẽ gây giật, lag khi làm Manual QA
- **Use-case phù hợp:** Khi sản phẩm đã ổn định, chuẩn bị release và cần đảm bảo giao diện hiển thị chuẩn trên nhiều loại màn hình (responsive & cross-browser); phù hợp với dự án B2C lớn (E-commerce, Fintech) nơi khách hàng dùng đa dạng thiết bị.


#### 1.3 Claude Vision
- **Giới thiệu tổng quan:** Là việc tận dụng khả năng phân tích hình ảnh và tư duy lập luận của mô hình ngôn ngữ lớn (LLM). Nhóm chụp ảnh màn hình UI (hoặc UI mockup từ Figma) rồi gửi cho Claude để AI phân tích, so sánh hoặc tự động hóa hành vi kiểm thử.
- **Ưu điểm (Pros):**
  - Tư duy như một chuyên gia UI/UX — đọc hiểu bố cục, phân tích độ tương phản màu sắc (WCAG accessibility), kiểm tra chính tả/text, phát hiện sai lệch giữa design và actual
  - Viết kịch bản bằng ngôn ngữ tự nhiên — chỉ cần ra lệnh mô tả yêu cầu kiểm tra thay vì viết code/HTML selector
  - Tốc độ phân tích cực nhanh — quét một ảnh UI phức tạp và đưa ra báo cáo chi tiết chỉ trong vài giây
- **Nhược điểm (Cons):**
  - Tính ngẫu nhiên (non-deterministic) — cùng một ảnh nhưng các lần hỏi khác nhau có thể cho nhận xét hơi khác nhau, không nhất quán 100% như automation truyền thống
  - Không có nhận thức về "cảm xúc" — chỉ phân tích dựa trên luật lệ/dữ liệu, không thay thế hoàn toàn cảm giác trải nghiệm thực của con người
  - Chi phí token và bảo mật — test liên tục bằng ảnh tốn nhiều chi phí API, và việc đẩy ảnh chứa dữ liệu nhạy cảm lên Cloud có thể vi phạm chính sách bảo mật doanh nghiệp
- **Use-case phù hợp:** So sánh nhanh thiết kế Figma với sản phẩm thật (Visual Regression/Diff); kiểm tra nhanh chuẩn thiết kế, độ tương phản màu, lỗi chính tả, audit accessibility; hỗ trợ Manual QA viết mô tả Bug Report chuyên nghiệp.

### 2. Quyết định lựa chọn

| Tiêu chí | Manual UI Testing | Browserstack | Claude Vision |
| :--- | :--- | :--- | :--- |
| Licence Cost | Miễn phí | Rất cao — tính phí theo nghìn USD/năm | Chi phí theo token API, phát sinh khi dùng nhiều |
| Learning Curve | Thấp — chỉ cần mở app và thao tác trực tiếp | Trung bình — cần làm quen giao diện điều khiển thiết bị cloud và cấu hình automation | Thấp — ra lệnh bằng ngôn ngữ tự nhiên, không cần biết code/selector |
| EShop Fit | Tốt cho việc cảm nhận UX luồng mua hàng, phát hiện lỗi logic khi thao tác thật | Rất tốt — đảm bảo giao diện EShop hiển thị chuẩn trên nhiều thiết bị/trình duyệt khách hàng thực tế dùng | Tốt cho audit nhanh giao diện, phát hiện lệch design, nhưng không thay được cảm nhận UX thực tế |
| AI Capability | Không có | Không có (chỉ là hạ tầng thiết bị, không có khả năng AI) | Rất cao — phân tích hình ảnh, lập luận, viết report bằng AI |
| Community | Không áp dụng (phương pháp thủ công, không phải công cụ/nền tảng) | Lớn — công cụ phổ biến trong ngành QA, tài liệu và hỗ trợ dồi dào | Đang phát triển — cộng đồng ứng dụng AI vào QA còn mới, tài liệu tham khảo chưa nhiều |
| Lý do | Cần thiết ở giai đoạn đầu để đánh giá UX và tìm lỗi edge-case mà công cụ khác không làm được | Cần thiết trước khi release để đảm bảo tương thích đa thiết bị, dù chi phí cao | Bổ trợ nhanh, tiết kiệm thời gian audit thiết kế và viết bug report, giảm tải cho Manual QA |
 ---
## PHẦN 2: USABILITY TESTING (Kiểm thử Tính Khả dụng)

### 1. Khảo sát các công cụ
#### 1.1 Maze
- **Giới thiệu tổng quan:** Maze là nền tảng nghiên cứu sản phẩm (product research) cho phép thực hiện usability test dạng unmoderated trên prototype hoặc website thực. Maze hỗ trợ nhiều phương pháp: prototype testing (Figma, Adobe XD, Sketch), live website testing, card sorting, tree testing, survey và moderated interview. Maze có tích hợp AI (Maze AI) để tự động tạo báo cáo và phân tích phản hồi mở.
- **Ưu điểm (Pros):**
  - Tích hợp native với Figma — import prototype trực tiếp, không cần export thủ công
  - Task-based testing mạnh: đo completion rate, misclick rate, thời gian hoàn thành task
  - Báo cáo tự động với AI insights, giảm thời gian tổng hợp dữ liệu
  - Giao diện trực quan, dễ sử dụng cho cả non-researcher
  - Participant panel toàn cầu hơn 6 triệu người
- **Nhược điểm (Cons):**
  - Free tier giới hạn (1 study/tháng, tối đa 5 seats)
  - Chủ yếu task-based, thiếu chiều sâu qualitative (verbal/non-verbal insights)
  - Prototype đôi khi bị crash, đặc biệt trên mobile
  - Các tính năng nâng cao (Tree Testing, Interviews) bị khóa ở gói Enterprise đắt tiền
- **Use-case phù hợp:** Phù hợp khi cần validate nhanh một luồng cụ thể (checkout flow) trên prototype Figma, đo lường task success rate và phát hiện misclick pattern.

#### 1.2 Useberry
- **Giới thiệu tổng quan:** Useberry là nền tảng UX research toàn diện hỗ trợ cả unmoderated testing và moderated interviews. Useberry cho phép test prototype (Figma, Adobe XD, Sketch, InVision), test website thực, card sorting, tree testing, five-second test, preference testing và survey. Nền tảng cung cấp analytics chi tiết bao gồm heatmap, click map, user flow visualization và session replay.
- **Ưu điểm (Pros):**
  - Đa dạng phương pháp test trong cùng một nền tảng (unmoderated + moderated interviews)
  - Heatmap và click map trực quan — dễ phát hiện vùng gây nhầm lẫn trên UI
  - Session replay giúp xem lại toàn bộ hành vi người dùng
  - Five-second test hữu ích cho đánh giá first impression của trang checkout
  - Chi phí hợp lý hơn Maze, free tier cho phép 10 responses/tháng
  - Tích hợp tốt với Figma, import prototype liền mạch
- **Nhược điểm (Cons):**
  - Participant pool nhỏ hơn so với các nền tảng enterprise lớn
  - Có learning curve ban đầu để master hết các tính năng
  - Prototype phức tạp, nặng có thể gặp vấn đề performance khi test
- **Use-case phù hợp:** Phù hợp khi cần kết hợp nhiều phương pháp usability testing (heatmap + session replay + five-second test) để đánh giá toàn diện trải nghiệm checkout, đặc biệt khi ngân sách hạn chế.

### 2. So sánh và Lựa chọn

| Tiêu chí | Maze | Useberry |
| :--- | :--- | :--- |
| Licence Cost | Free: 1 study/tháng, 5 seats. Starter: ~$99/tháng. Enterprise: $12k–$70k/năm | Free: 10 responses/tháng. Growth plan linh hoạt, rẻ hơn đáng kể so với Maze |
| Learning Curve | Thấp — giao diện trực quan, dễ dùng ngay cả với non-researcher | Trung bình — có learning curve nhẹ ban đầu để master hết các tính năng (heatmap, session replay, five-second test) |
| EShop Fit | Khá — task-based testing đo được completion rate và misclick trên checkout flow, nhưng thiếu heatmap và session replay | Tốt — heatmap + click map + session replay phù hợp để phân tích toàn diện luồng checkout EShop |
| AI Capability | Có — Maze AI tự động tạo báo cáo, phân tích phản hồi mở, phát hiện pattern | Chưa có — chưa tích hợp AI, phân tích thủ công |
| Community | Lớn — cộng đồng đông đảo, nhiều tài liệu hướng dẫn, forum hoạt động | Nhỏ hơn — cộng đồng đang phát triển, tài liệu ít hơn, participant pool nhỏ hơn |

**Quyết định lựa chọn (Final Decision):** Nhóm chọn **Maze** làm công cụ chính cho Usability Testing vì:
1. **Không giới hạn số lượng response:** Free tier của Maze cho phép unlimited participants trong 1 study — phù hợp để test với cả lớp (~40 người), trong khi Useberry chỉ cho 10 responses/tháng.
2. **Learning curve thấp:** Giao diện trực quan, dễ thiết lập study nhanh, không cần thời gian đào tạo cho người tham gia test.
3. **AI tích hợp sẵn:** Maze AI tự động tạo báo cáo và phân tích phản hồi mở — bổ trợ tốt cho Claude vision (công cụ AI-augmented của nhóm).
4. **Cộng đồng lớn:** Tài liệu hướng dẫn phong phú, panel 6M+ participants, dễ tìm support khi gặp vấn đề.