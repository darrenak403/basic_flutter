# basic_flutter

Bản mẫu nhỏ để học Flutter — chứa ví dụ các widget cơ bản, Drawer, navigation và một vài tương tác đơn giản.

## Mục tiêu

- Giúp bạn làm quen với cấu trúc project Flutter.
- Hiểu khác biệt giữa StatelessWidget và StatefulWidget.
- Thực hành các widget cơ bản: Text, Row, Column, Container, Image, Buttons, TextField, Switch, Checkbox, Slider, ListView, GridView, Card, Stack, AppBar, Drawer, BottomNavigationBar.

## Yêu cầu

- Flutter SDK (tối thiểu theo phiên bản hiện tại trên máy bạn)
- Dart SDK (kèm Flutter)
- Android Studio / Xcode (nếu chạy trên thiết bị thật hoặc simulator)
- VS Code (hoặc IDE khác) + extension Dart & Flutter

Chạy lệnh kiểm tra môi trường:

```bash
flutter doctor
```

## Chạy dự án

1. Cài phụ thuộc:

```bash
flutter pub get
```

2. Chạy app (chọn thiết bị/emulator trước):

```bash
flutter run
```

3. Dùng Hot Reload khi chỉnh UI:

- Trong terminal nhấn `r`, hoặc bấm nút Hot Reload trong IDE.

## Cấu trúc thư mục (quan trọng)

- lib/ : mã nguồn chính
  - main.dart : entry point
  - pages/ : các trang (BasicFlutterPage, SecondPage, ...)
- pubspec.yaml : khai báo dependency, assets, tên package

## Khái niệm nhanh (dễ hiểu)

- Widget: mọi thứ trong Flutter đều là widget (giao diện được mô tả bằng cây widget).
- StatelessWidget: widget tĩnh, không lưu trạng thái nội bộ.
- StatefulWidget: có State đi kèm, dùng khi UI thay đổi theo thời gian.
  - Gọi setState(() { ... }) để cập nhật UI khi thay đổi dữ liệu.
- build(BuildContext): hàm trả về cây widget; được gọi lại khi cần render lại UI.
- Scaffold: khung giao diện cơ bản (AppBar, Drawer, body, FAB, BottomNavigationBar).
- Drawer: menu trượt từ trái — thêm bằng thuộc tính `drawer:` của Scaffold.
- Navigation:
  - Mở trang mới: `Navigator.push(context, MaterialPageRoute(builder: (_) => SecondPage()))`
  - Quay lại: `Navigator.pop(context)`
- pubspec.yaml: thêm dependency và assets, chạy `flutter pub get` sau khi chỉnh.

## Mẹo học nhanh

- Thử thay đổi Text/Color/Size rồi Hot Reload để thấy kết quả ngay.
- Nếu gặp lỗi liên quan context khi dùng `Scaffold.of(context)`, dùng `Builder` để lấy context "dưới" Scaffold hoặc dùng GlobalKey.
- Đặt `editor.defaultFormatter` cho Dart trong VS Code nếu format on save làm hỏng cấu trúc (dùng `Dart-Code.dart-code`).

## Lệnh hay dùng

- flutter analyze — kiểm tra lint và lỗi
- flutter test — chạy unit test
- flutter build apk — build APK release
- flutter build ios — build cho iOS (cần macOS + Xcode)

## Tài liệu tham khảo

- Flutter docs: https://docs.flutter.dev/
- Flutter codelabs: https://docs.flutter.dev/get-started/codelab

Chúc bạn học tốt — sửa, chạy, và experiment nhiều để hiểu rõ hơn.
