# GUI & Usability Testing

> **Seminar T01 — Nhóm 3**
> **System Under Test:** EShop Checkout
> **Nội dung:** Lý thuyết → công cụ → demo trực tiếp
> **Trọng tâm Usability Testing:** Maze

---

## Slide 2 — GUI Testing

---

## Slide 3 — Manual GUI Testing là gì?

Tester trực tiếp quan sát và thao tác để xác minh UI hiển thị, phản hồi và nhất quán.

- **Phạm vi rà soát:** layout, typography, color/contrast, overflow và UI state.
- **Yêu cầu đầu ra:** checklist, screenshot, môi trường và bug report có khả năng tái hiện được.

---

## Slide 4 — EShop Checkout: kiểm thử gì?

Phạm vi kiểm thử: **Cart → Coupon → Address → Payment → Success**

### Cart — Giỏ hàng

- Grid, tăng/giảm số lượng và xoá sản phẩm.
- Tổng tiền và trạng thái trống.

### Coupon — Mã giảm giá

- Trạng thái valid, invalid và expired.
- Discount và error message.

### Address & Payment — Địa chỉ và thanh toán

- Label, focus và validation.
- Ẩn số thẻ và trạng thái loading.

---

## Slide 5 — UI checklist trước khi bắt đầu

Các yếu tố giao diện cần rà soát trước khi thực hiện test:

**Sản phẩm → Giỏ hàng → Đăng nhập → Địa chỉ → Thanh toán**

1. **Layout & Style**
   - Layout/alignment.
   - Typography.
   - Color và độ tương phản.
   - Overflow.
2. **Tương tác**
   - Button: hover, active và disabled.
   - Form: label, focus, validation và error.
3. **Responsive & Accessibility**
   - Responsive và cross-browser.
   - Tab order, focus indicator và alt text.

---

## Slide 6 — BrowserStack Live

BrowserStack Live là nền tảng kiểm thử đa thiết bị trên đám mây.

> Thiết bị thật trên cloud để kiểm thử tương tác.

1. **Thiết bị thật:** hệ thống thiết bị thật chạy trên cloud.
2. **Đa nền tảng:** Chrome, Firefox, Safari và Edge trên Windows, macOS, Android và iOS.
3. **Hỗ trợ debug:** responsive, scroll, keyboard, DevTools, screenshot và annotation.

---

## Slide 7 — Claude Vision

Claude Vision là trợ lý AI hỗ trợ phát hiện lỗi giao diện.

> AI làm cặp mắt thứ hai để phát hiện lỗi hiển thị.

1. **Rà soát visual:** rà soát screenshot về layout, spacing, typography, contrast và consistency.
2. **Cấu trúc prompt:** prompt cần cung cấp location, issue và suggested fix.
3. **Giới hạn:** không test được hover, scroll hoặc animation và có thể tạo false positive.

---

## Slide 8 — AI finding phải được kiểm chứng

Quy trình kiểm chứng độc lập giúp đảm bảo chất lượng bug report.

### AI Findings — Gợi ý từ AI

Dựa trên nguyên tắc:

- Claude quét nhanh screenshot.
- Phát hiện spacing, contrast và layout.
- Tiết kiệm thời gian rà soát.

### Human Audit — Xác minh thủ công

Dựa trên hành vi:

- Tái hiện trên BrowserStack hoặc local.
- Loại bỏ false positive.
- Đánh giá mức độ nghiêm trọng.

> Chỉ **True Positive** mới được ghi vào bug report chính thức.

---

## Slide 9 — Ma trận browser/device

Các môi trường kiểm thử được lựa chọn để bao phủ những rendering engine phổ biến:

| Rendering engine | Môi trường |
|---|---|
| Chromium | Chrome trên Windows/macOS; Edge trên Windows; Samsung Galaxy S26 |
| Gecko | Firefox trên Windows |
| WebKit | Safari trên macOS; iPhone 15 |

Mục tiêu là đảm bảo giao diện EShop Checkout hoạt động tốt trên các rendering engine phổ biến.

---

## Slide 10 — Từ EShop đến bug report

Quy trình kiểm thử gồm sáu bước:

1. **Setup:** chạy EShop và BrowserStack Local.
2. **Manual Test:** thực hiện test trên BrowserStack.
3. **Screenshot:** chụp màn hình khi phát hiện lỗi.
4. **AI Review:** Claude rà soát các screenshot.
5. **Human Audit:** kiểm chứng thủ công các gợi ý.
6. **Bug Report:** tạo bug report cho các lỗi thực tế.

Mỗi bug report cần ghi rõ browser, OS, version, device, viewport và UI state.

---

## Slide 11 — Responsive, states và edge cases

Các trường hợp cần tập trung kiểm thử thực tế:

| Desktop | Mobile | Edge cases |
|---|---|---|
| Hover, active, disabled | Wrap, overflow | Nội dung dài, cart rỗng |
| Tab order | Touch target | Error message |
| Focus ring | Keyboard overlay và orientation | Loading, success state |

Kiểm thử kỹ lưỡng sự thay đổi trạng thái và khả năng phản hồi của giao diện.

---

## Slide 12 — Evidence & bug report

### Bug report fields

- ID.
- Severity.
- Category.
- Description.
- Environment.
- Steps.
- Expected/actual.
- Screenshot.
- Recommended fix.

### Folder structure

```text
browserstack/
claude-review/
reports/
screenshots/
```

### Lưu trữ

Mỗi bug report được lưu trữ đi kèm screenshot và log ghi nhận lỗi.

### Giới hạn

Cần URL public và snippet để có expected path; một số tính năng phụ thuộc gói; wording và trạng thái tài khoản có thể làm lệch kết quả.

---

## Slide 13 — BrowserStack và Claude bổ trợ nhau

Sự kết hợp giữa tương tác thực tế và rà soát visual tự động:

| BrowserStack — Tương tác & Responsive | Claude Vision — Rà soát visual tự động |
|---|---|
| Tương tác thật trên thiết bị thật | AI phát hiện lỗi layout, contrast và spacing |
| Test responsive và cross-device | Rà soát nhanh visual bug trên screenshot |
| Kiểm tra hover, scroll và DevTools | Cảnh báo sớm các điểm bất thường |

> Manual verification là bước quyết định để loại bỏ false positive.

---

## Slide 14 — Nguồn & sign-off

### Tài liệu dự án

- `DeepStudyHandsOn.md`
- `Tool_Survey_Proposal.md`
- `UserGuide_UI_Testing.md`

### Công cụ, tiêu chuẩn và tài liệu tham khảo

- BrowserStack Live và Claude Vision.
- [10 Usability Heuristics for User Interface Design](https://www.nngroup.com/articles/ten-usability-heuristics/)
- [Website Testing — Maze](https://maze.co/features/live-website-testing/)
- [Website Test: Setting Success Paths](https://help.maze.co/articles/3802260279-website-test-setting-success-paths-in-a-website-test)
- [Usability Testing 101](https://www.nngroup.com/articles/usability-testing-101/)
- [A Guide to Click Heatmaps in Maze](https://help.maze.co/articles/9190398044-a-guide-to-click-heatmaps-in-maze)
- WCAG 2.1 và Nielsen Heuristics.

### Sign-off checklist

- [ ] Browser/device.
- [ ] Screenshot.
- [ ] Claude review.
- [ ] Human audit.
- [ ] Report.

---

## Slide 15 — Usability Testing

> Quan sát người dùng thật hoàn thành nhiệm vụ thật.

---

## Slide 16 — Usability Testing là gì?

Không hỏi giao diện có “đẹp” không; quan sát người dùng có đạt mục tiêu hay không.

Đưa người dùng đại diện vào một kịch bản thực tế, giao nhiệm vụ đại diện, quan sát hành vi và thu thập phản hồi để phát hiện vấn đề sử dụng.

### Effectiveness — Hiệu quả

Người dùng có hoàn thành đúng nhiệm vụ không?

### Efficiency — Hiệu suất

Mất bao nhiêu thời gian, bước đi và nỗ lực?

### Satisfaction — Hài lòng

Người dùng cảm thấy rõ ràng, tự tin và dễ chịu không?

---

## Slide 17 — Tại sao cần Usability Testing?

- **Phát hiện lỗi sớm:** tìm ra các điểm nghẽn, sự nhầm lẫn hoặc khó khăn mà người dùng gặp phải khi thao tác trên giao diện sản phẩm.
- **Hiểu góc nhìn thực tế:** lắng nghe phản hồi khách quan từ người dùng thật thay vì chỉ dựa vào phỏng đoán chủ quan của đội ngũ thiết kế hay lập trình viên.
- **Tiết kiệm chi phí:** sửa lỗi ngay trong giai đoạn thiết kế hoặc thử nghiệm có chi phí thấp hơn rất nhiều so với khi sản phẩm đã phát hành chính thức ra thị trường.

---

## Slide 18 — Moderated và Unmoderated Testing

### Moderated Testing

Là phương pháp usability testing có researcher tham gia trực tiếp để quan sát, hướng dẫn và trao đổi với người dùng trong quá trình thực hiện nhiệm vụ.

Chi phí và thời gian thực hiện cao hơn, số lượng người tham gia thường ít.

### Unmoderated Testing

Là phương pháp usability testing mà người dùng tự thực hiện các nhiệm vụ, không có researcher đồng hành; toàn bộ dữ liệu được hệ thống ghi nhận tự động.

Chi phí thấp hơn, dễ triển khai với số lượng người tham gia lớn.

---

## Slide 19 — 10 Usability Heuristics: 01–05

Nguyên tắc kinh nghiệm để chuyên gia phát hiện rủi ro giao diện:

1. **Hiển thị trạng thái hệ thống — Visibility of system status**
   Phản hồi kịp thời: loading, coupon đã áp dụng, thanh toán đã xử lý.
2. **Khớp với thế giới thực — Match between system and the real world**
   Dùng từ ngữ, biểu tượng và thứ tự quen thuộc với người mua.
3. **Quyền kiểm soát và tự do — User control and freedom**
   Cho phép quay lại, huỷ, sửa giỏ hoặc thoát khỏi thao tác ngoài ý muốn.
4. **Nhất quán và tiêu chuẩn — Consistency and standards**
   Một hành động phải có cùng tên, hình thức và quy ước xuyên suốt.
5. **Ngăn ngừa lỗi — Error prevention**
   Thiết kế để tránh lỗi trước khi phải hiện thông báo lỗi.

---

## Slide 20 — 10 Usability Heuristics: 06–10

> Heuristic là “rule of thumb”, không phải checklist thay thế người dùng thật.

6. **Nhận biết thay vì ghi nhớ — Recognition rather than recall**
   Hiển thị lựa chọn và thông tin cần thiết; giảm gánh nặng ghi nhớ.
7. **Linh hoạt và hiệu quả — Flexibility and efficiency of use**
   Hỗ trợ cả người mới lẫn người quen bằng mặc định tốt và thao tác nhanh.
8. **Thẩm mỹ và tối giản — Aesthetic and minimalist design**
   Loại bỏ nội dung cạnh tranh với thông tin cốt lõi của nhiệm vụ.
9. **Nhận biết và phục hồi lỗi — Recognize, diagnose, and recover from errors**
   Thông báo bằng ngôn ngữ rõ ràng, chỉ nguyên nhân và hướng khắc phục.
10. **Trợ giúp và tài liệu — Help and documentation**
    Hỗ trợ ngắn gọn, dễ tìm, theo đúng tác vụ người dùng đang làm.

---

## Slide 21 — Một usability study hoàn chỉnh

> Quy trình lặp: **đo → hiểu → cải thiện → kiểm tra lại**.

1. **Xác định:** người dùng và mục tiêu.
2. **Thiết kế:** kịch bản, task và câu hỏi.
3. **Pilot:** kiểm tra wording và dữ liệu.
4. **Chạy test:** quan sát và thu response.
5. **Phân tích:** định lượng và định tính.
6. **Cải thiện:** ưu tiên rồi retest.

Pilot không phải “test cho có”: nó bảo vệ study khỏi URL lỗi, wording thiên lệch và dữ liệu không ghi nhận được.

---

## Slide 22 — Ta thu thập bằng chứng gì?

Một chỉ số đơn lẻ chỉ cho biết một phần câu chuyện.

### What — Điều gì đã xảy ra?

- Kết quả task.
- Đường đi.
- Thời gian và số bước.
- Click và heatmap.

### Where — Vấn đề xảy ra ở đâu?

- Trang hoặc bước.
- Vùng click.
- Direct hoặc indirect.
- Give up hoặc bounce.

### Why — Vì sao người dùng gặp khó khăn?

- Rating.
- Câu trả lời mở.
- Nhận xét khi test.
- Recording nếu có.

### Triangulation — Ghép tín hiệu

Path và heatmap cho biết hành vi; câu trả lời giải thích nguyên nhân.

---

## Slide 23 — Heuristic Evaluation ≠ Usability Testing

Hai phương pháp bổ sung cho nhau vì chúng tạo ra hai loại bằng chứng khác nhau.

| Heuristic Evaluation | Usability Testing |
|---|---|
| Chuyên gia kiểm tra | Người dùng thực hiện |
| Dựa trên nguyên tắc | Dựa trên hành vi |
| Nhanh, chủ động | Thấy vấn đề thực tế |
| Bao quát nhiều màn hình | Biết mức độ và đường đi |
| Đề xuất rủi ro tiềm ẩn | Nghe ngôn ngữ của người dùng |

> Đánh giá trước bằng heuristic → kiểm chứng với người dùng → ưu tiên bằng dữ liệu.

---

## Slide 24 — Maze

### Maze là gì?

Maze là một nền tảng kiểm tra và nghiên cứu trải nghiệm người dùng (UX) tự động hóa.

### Tính năng chính

- **Prototype testing:** test trên prototype trang web, ví dụ Figma, giúp kiểm thử ở giai đoạn sớm.
- **Website testing:** test trên web đã có mã nguồn trước khi deploy.
- **Báo cáo tự động:** đo lường các chỉ số như tỷ lệ hoàn thành tác vụ, thời gian làm bài và số lần nhấp chuột sai.
- **Kết hợp định lượng và định tính:** thu thập cả số liệu thống kê lẫn câu trả lời khảo sát từ người tham gia.

---

## Slide 25 — Nguồn lý thuyết & tài liệu công cụ

### Nielsen Norman Group

- [10 Usability Heuristics for User Interface Design](https://www.nngroup.com/articles/ten-usability-heuristics/)
- [Usability Testing 101](https://www.nngroup.com/articles/usability-testing-101/)

### Maze

- [Website Testing](https://maze.co/features/live-website-testing/)
- [Website Test: Setting Success Paths](https://help.maze.co/articles/3802260279-website-test-setting-success-paths-in-a-website-test)
- [Click Heatmaps in Maze](https://help.maze.co/articles/9190398044-a-guide-to-click-heatmaps-in-maze)

### Tài liệu nội bộ nhóm

- `Tool_Survey_Proposal.md`
- `DeepStudyHandsOn.md`
- `User_Guide.md`
