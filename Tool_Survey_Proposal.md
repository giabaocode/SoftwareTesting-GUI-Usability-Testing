# Báo cáo: Topic Claim & Tool Survey
 
**Thành viên nhóm:**

| Họ tên | MSSV | Phần phụ trách |
| :--- | :--- | :--- |
| Nguyễn Bình An | 23127149 |  |
| Phạm Ngọc Gia Bảo | 23127027 | Tìm hiểu và hỗ trợ chọn tool Maze |
| Lee Kun Da | 23127035 | Tìm hiểu sơ lược các tools usability test và viết report |
| Lưu Ngô Quốc Bảo | 23127327 |  |

**Ngày tháng:** 3/7/2026  

> Đây là report được viết lại vì sau quá trình meeting với giảng viên, một số tool và nội dung được điều chỉnh lại
---

## PHẦN 1: UI TESTING (Kiểm thử Giao diện Người dùng)

### 1. Khảo sát các công cụ
*Liệt kê và phân tích các công cụ/công nghệ có thể sử dụng cho UI Testing.*

#### 1.1 Manual UI Testing
- **Giới thiệu tổng quan:** ...
- **Ưu điểm (Pros):** ...
- **Nhược điểm (Cons):** ...
- **Use-case phù hợp:** ...

#### 1.2 Browserstack
- **Giới thiệu tổng quan:** ...
- **Ưu điểm (Pros):** ...
- **Nhược điểm (Cons):** ...
- **Use-case phù hợp:** ...

#### 1.3 Claude Vision
- **Giới thiệu tổng quan:** ...
- **Ưu điểm (Pros):** ...
- **Nhược điểm (Cons):** ...
- **Use-case phù hợp:** ...

### 2. Quyết định lựa chọn

| Tiêu chí | Manual UI Testing | Browserstack | Claude Vision |
| :--- | :--- | :--- | :--- |
| Licence Cost | ... | ... | ... |
| Learning Curve | ... | ... | ... | 
| EShop Fit | ... | ... | ... |
| AI Capability | ... | ... | ... |
| Community | ... | ... | ... |
| Lý do | ... | ... | ... |

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