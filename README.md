# 📘 Toàn bộ kiến thức căn bản Flutter — Complete Guide

> Dự án mẫu để học Flutter từ zero đến hero với các ví dụ thực tế về widgets, layout, state management, navigation, và animation.

---

## 📋 Mục lục

- [1. Khái niệm nền tảng Flutter](#1-khái-niệm-nền-tảng-flutter)
- [2. Các Widget cơ bản](#2-các-widget-cơ-bản)
- [3. Layout System](#3-layout-system)
- [4. Style Management](#4-style-management)
- [5. Navigation & Routing](#5-navigation--routing)
- [6. State Management](#6-state-management)
- [7. Responsive UI](#7-responsive-ui)
- [8. Animation](#8-animation)
- [9. Widget Reference](#9-widget-reference)
- [10. Quick Start](#10-quick-start)

---

## 1. Khái niệm nền tảng Flutter

### Flutter là gì?

- **Framework UI** đa nền tảng (iOS, Android, Web, Desktop) từ một codebase duy nhất
- Viết bằng **Dart**, compile native (không dùng WebView hay bridge)
- **Mọi thứ đều là Widget** — từ layout, styling đến animation

### Cách hoạt động

```
Dart code → Flutter Engine (C++) → Skia (render) → Native (iOS/Android)
```

- Không dùng native components → UI nhất quán trên mọi platform
- Hot Reload ⚡ để thấy thay đổi ngay lập tức

### Cấu trúc project

```
basic_flutter/
├── lib/
│   ├── main.dart          # Entry point
│   ├── pages/             # Các trang
│   └── widgets/           # Custom widgets
├── pubspec.yaml           # Dependency & assets
├── android/, ios/         # Native code
└── test/                  # Unit tests
```

### main.dart — Entry point

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Khởi chạy app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Root widget
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(), // Trang đầu tiên
    );
  }
}
```

### Widget Tree

Flutter xây UI bằng cây widget lồng nhau:

```
MaterialApp
  └─ Scaffold
      ├─ AppBar
      └─ Body
          └─ Column
              ├─ Text
              └─ Button
```

Khi state thay đổi → rebuild widget tree (chỉ phần cần thiết).

### Hot Reload ⚡

- Nhấn `r` trong terminal hoặc ⚡ icon trong IDE
- Cập nhật UI ngay lập tức mà không mất state
- **Hot Restart** (`R`): reset toàn bộ state

---

## 2. Các Widget cơ bản

### 🏗️ Widget khung & bố cục

#### **MaterialApp** — Root widget

```dart
MaterialApp(
  title: 'My App',
  theme: ThemeData(primarySwatch: Colors.purple),
  home: HomePage(),
  routes: {'/second': (context) => SecondPage()}, // Named routes
)
```

#### **Scaffold** — Khung giao diện

```dart
Scaffold(
  appBar: AppBar(title: Text('Title')),
  drawer: Drawer(...), // Menu trượt
  body: Center(child: Text('Body')),
  floatingActionButton: FloatingActionButton(...),
  bottomNavigationBar: BottomNavigationBar(...),
)
```

#### **Container** — Hộp đa năng (như `<div>`)

```dart
Container(
  width: 200,
  height: 100,
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.symmetric(vertical: 8),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black26)],
  ),
  child: Text('Hello'),
)
```

#### **Center** — Căn giữa

```dart
Center(child: Text('Centered'))
```

#### **Row** — Bố trí ngang (như `flex-direction: row`)

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween, // space-between
  crossAxisAlignment: CrossAxisAlignment.center, // align-items: center
  children: [
    Icon(Icons.star),
    Text('Rating'),
    Text('5.0'),
  ],
)
```

#### **Column** — Bố trí dọc (như `flex-direction: column`)

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Title'),
    Text('Subtitle'),
  ],
)
```

#### **Stack** — Xếp chồng (như `position: absolute`)

```dart
Stack(
  children: [
    Container(width: 200, height: 200, color: Colors.blue),
    Positioned(top: 10, right: 10, child: Icon(Icons.close)),
  ],
)
```

#### **Expanded** — Chiếm không gian còn lại (như `flex: 1`)

```dart
Row(
  children: [
    Container(width: 50, color: Colors.red),
    Expanded(child: Container(color: Colors.blue)), // Chiếm hết
  ],
)
```

#### **Padding** — Khoảng cách trong

```dart
Padding(
  padding: EdgeInsets.all(16),
  child: Text('Padded'),
)
```

#### **SizedBox** — Tạo khoảng trống hoặc fix size

```dart
SizedBox(height: 20), // Spacing
SizedBox(width: 100, height: 100, child: Image.network('...')),
```

---

### 🎨 Widget hiển thị

#### **Text** — Hiển thị văn bản

```dart
Text(
  'Hello Flutter',
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.purple,
  ),
  textAlign: TextAlign.center,
)
```

#### **Image** — Hiển thị hình ảnh

```dart
Image.network('https://picsum.photos/200'), // Từ URL
Image.asset('assets/logo.png'), // Từ assets (khai báo trong pubspec.yaml)
```

#### **Icon** — Icon Material

```dart
Icon(Icons.home, size: 32, color: Colors.blue)
```

#### **Card** — Thẻ có shadow

```dart
Card(
  elevation: 4,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Card content'),
  ),
)
```

#### **ListTile** — Item trong list

```dart
ListTile(
  leading: CircleAvatar(child: Icon(Icons.person)),
  title: Text('John Doe'),
  subtitle: Text('Developer'),
  trailing: Icon(Icons.arrow_forward),
  onTap: () => print('Tapped'),
)
```

#### **Divider** — Đường phân cách

```dart
Divider(thickness: 1, color: Colors.grey)
```

#### **CircleAvatar** — Avatar tròn

```dart
CircleAvatar(
  radius: 30,
  backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
)
```

---

### 🖊️ Widget nhập liệu

#### **TextField** — Input text

```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Username',
    hintText: 'Enter your name',
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.person),
  ),
  onChanged: (value) => print(value),
)
```

#### **Button** — Các loại nút

```dart
ElevatedButton(onPressed: () {}, child: Text('Elevated')),
OutlinedButton(onPressed: () {}, child: Text('Outlined')),
TextButton(onPressed: () {}, child: Text('Text')),
IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
```

#### **Switch** — Công tắc

```dart
bool _value = true;
Switch(
  value: _value,
  onChanged: (v) => setState(() => _value = v),
)
```

#### **Checkbox**

```dart
bool _checked = false;
Checkbox(
  value: _checked,
  onChanged: (v) => setState(() => _checked = v ?? false),
)
```

#### **Radio**

```dart
int _groupValue = 1;
Radio<int>(
  value: 1,
  groupValue: _groupValue,
  onChanged: (v) => setState(() => _groupValue = v!),
)
```

#### **Slider**

```dart
double _value = 50;
Slider(
  value: _value,
  min: 0,
  max: 100,
  divisions: 10,
  label: _value.round().toString(),
  onChanged: (v) => setState(() => _value = v),
)
```

#### **DropdownButton**

```dart
String _selected = 'Option 1';
DropdownButton<String>(
  value: _selected,
  items: ['Option 1', 'Option 2'].map((e) =>
    DropdownMenuItem(value: e, child: Text(e))
  ).toList(),
  onChanged: (v) => setState(() => _selected = v!),
)
```

---

### 📜 Widget cuộn

#### **ListView** — Danh sách cuộn dọc

```dart
// ListView đơn giản
ListView(
  children: [
    ListTile(title: Text('Item 1')),
    ListTile(title: Text('Item 2')),
  ],
)

// ListView.builder — dùng cho danh sách lớn
ListView.builder(
  itemCount: 100,
  itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
)

// ListView.separated — có separator
ListView.separated(
  itemCount: 10,
  itemBuilder: (_, i) => ListTile(title: Text('Item $i')),
  separatorBuilder: (_, __) => Divider(),
)
```

#### **GridView** — Lưới

```dart
GridView.count(
  crossAxisCount: 3, // 3 cột
  children: List.generate(9, (i) =>
    Container(color: Colors.blue[100 * (i % 9)]),
  ),
)
```

#### **SingleChildScrollView** — Cuộn một widget

```dart
SingleChildScrollView(
  child: Column(children: [...]),
)
```

---

### 👆 Widget tương tác

#### **InkWell** — Hiệu ứng ripple khi tap

```dart
InkWell(
  onTap: () => print('Tapped'),
  child: Container(
    padding: EdgeInsets.all(16),
    child: Text('Tap me'),
  ),
)
```

#### **GestureDetector** — Phát hiện nhiều gesture

```dart
GestureDetector(
  onTap: () => print('Tap'),
  onDoubleTap: () => print('Double tap'),
  onLongPress: () => print('Long press'),
  child: Container(width: 100, height: 100, color: Colors.blue),
)
```

---

### 🔮 Widget logic

#### **FutureBuilder** — Hiển thị dữ liệu async

```dart
FutureBuilder<String>(
  future: fetchData(), // Future<String>
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }
    if (snapshot.hasError) return Text('Error: ${snapshot.error}');
    return Text('Data: ${snapshot.data}');
  },
)
```

#### **StreamBuilder** — Lắng nghe stream

```dart
StreamBuilder<int>(
  stream: Stream.periodic(Duration(seconds: 1), (i) => i),
  builder: (context, snapshot) {
    return Text('Count: ${snapshot.data ?? 0}');
  },
)
```

#### **LayoutBuilder** — Layout dựa trên constraints

```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth > 600) {
      return DesktopLayout();
    }
    return MobileLayout();
  },
)
```

#### **MediaQuery** — Thông tin màn hình

```dart
double screenWidth = MediaQuery.of(context).size.width;
double screenHeight = MediaQuery.of(context).size.height;
bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
```

---

### 🎬 Animation cơ bản

#### **AnimatedContainer** — Implicit animation

```dart
bool _expanded = false;
AnimatedContainer(
  duration: Duration(milliseconds: 300),
  width: _expanded ? 200 : 100,
  height: _expanded ? 200 : 100,
  color: _expanded ? Colors.blue : Colors.red,
)
```

#### **AnimatedOpacity**

```dart
AnimatedOpacity(
  opacity: _visible ? 1.0 : 0.0,
  duration: Duration(milliseconds: 500),
  child: Text('Fade in/out'),
)
```

#### **Hero** — Transition giữa 2 trang

```dart
// Page 1
Hero(tag: 'imageHero', child: Image.network('...'))

// Page 2
Hero(tag: 'imageHero', child: Image.network('...'))
// Khi navigate, image sẽ bay giữa 2 trang
```

---

## 3. Layout System

### So sánh với CSS Flexbox

| Flutter | CSS Flexbox |
|---------|-------------|
| `Row` | `flex-direction: row` |
| `Column` | `flex-direction: column` |
| `mainAxisAlignment` | `justify-content` |
| `crossAxisAlignment` | `align-items` |
| `Expanded` | `flex: 1` |

### Ví dụ layout phức tạp

```dart
Column(
  children: [
    Container(height: 100, color: Colors.red), // Header
    Expanded( // Body chiếm hết
      child: Row(
        children: [
          Container(width: 80, color: Colors.blue), // Sidebar
          Expanded(child: Container(color: Colors.white)), // Content
        ],
      ),
    ),
    Container(height: 60, color: Colors.green), // Footer
  ],
)
```

### Các thuộc tính quan trọng

#### MainAxisAlignment (trục chính)
- `start` — Căn đầu
- `end` — Căn cuối
- `center` — Căn giữa
- `spaceBetween` — Khoảng cách đều giữa các item
- `spaceAround` — Khoảng cách đều xung quanh item
- `spaceEvenly` — Khoảng cách đều hoàn toàn

#### CrossAxisAlignment (trục phụ)
- `start` — Căn đầu
- `end` — Căn cuối
- `center` — Căn giữa
- `stretch` — Kéo dài hết trục phụ
- `baseline` — Căn theo baseline (text)

---

## 4. Style Management

### Color

```dart
Colors.blue
Colors.blue[400]
Color(0xFF42A5F5)
Color.fromRGBO(66, 165, 245, 1.0)
```

### ThemeData — Theme toàn app

```dart
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.purple,
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 18),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
      ),
    ),
  ),
)
```

### BoxDecoration — Style Container

```dart
BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(12),
  border: Border.all(color: Colors.grey, width: 2),
  gradient: LinearGradient(
    colors: [Colors.blue, Colors.purple],
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  ],
)
```

### TextStyle

```dart
TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold, // w100-w900
  fontStyle: FontStyle.italic,
  color: Colors.black,
  letterSpacing: 1.2,
  wordSpacing: 2.0,
  height: 1.5, // line-height
  decoration: TextDecoration.underline,
  decorationColor: Colors.red,
)
```

---

## 5. Navigation & Routing

### Push/Pop — Điều hướng cơ bản

```dart
// Mở trang mới
Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => SecondPage()),
);

// Quay lại
Navigator.pop(context);

// Quay lại với data
Navigator.pop(context, 'result');

// Nhận data
final result = await Navigator.push(...);
print(result); // 'result'
```

### Named Routes

```dart
// main.dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (_) => HomePage(),
    '/second': (_) => SecondPage(),
    '/detail': (_) => DetailPage(),
  },
)

// Navigate
Navigator.pushNamed(context, '/second');

// Navigate với arguments
Navigator.pushNamed(
  context,
  '/detail',
  arguments: {'id': 123},
);

// Nhận arguments
final args = ModalRoute.of(context)!.settings.arguments as Map;
```

### Drawer — Menu trượt

```dart
Scaffold(
  drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text('Menu', style: TextStyle(color: Colors.white)),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.pop(context); // Đóng drawer
            Navigator.pushNamed(context, '/');
          },
        ),
      ],
    ),
  ),
)
```

### BottomNavigationBar

```dart
int _currentIndex = 0;

Scaffold(
  body: [HomePage(), SearchPage(), ProfilePage()][_currentIndex],
  bottomNavigationBar: BottomNavigationBar(
    currentIndex: _currentIndex,
    onTap: (i) => setState(() => _currentIndex = i),
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ],
  ),
)
```

### TabBar

```dart
DefaultTabController(
  length: 3,
  child: Scaffold(
    appBar: AppBar(
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.home), text: 'Home'),
          Tab(icon: Icon(Icons.search), text: 'Search'),
          Tab(icon: Icon(Icons.person), text: 'Profile'),
        ],
      ),
    ),
    body: TabBarView(
      children: [HomePage(), SearchPage(), ProfilePage()],
    ),
  ),
)
```

---

## 6. State Management

### StatelessWidget vs StatefulWidget

| StatelessWidget | StatefulWidget |
|-----------------|----------------|
| Không thay đổi | Có thể thay đổi |
| `build()` gọi 1 lần | `build()` gọi lại khi `setState()` |
| Ví dụ: Text, Icon | Ví dụ: Checkbox, TextField |

### StatefulWidget Example

```dart
class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  void _increment() {
    setState(() { // Cập nhật UI
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $_count'),
        ElevatedButton(onPressed: _increment, child: Text('+')),
      ],
    );
  }
}
```

### Lifecycle Methods

```dart
class _MyState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();
    // Gọi 1 lần khi widget được tạo
    // Khởi tạo controller, listener, fetch data
  }

  @override
  void didUpdateWidget(MyWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Gọi khi widget cha rebuild với config mới
  }

  @override
  void dispose() {
    super.dispose();
    // Gọi khi widget bị xóa
    // Cleanup: dispose controller, cancel subscription
  }

  @override
  Widget build(BuildContext context) {
    // Render UI
    return Container();
  }
}
```

### TextEditingController

```dart
class _MyState extends State<MyWidget> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print('Text changed: ${_controller.text}');
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Quan trọng!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(controller: _controller);
  }
}
```

---

## 7. Responsive UI

### MediaQuery

```dart
double width = MediaQuery.of(context).size.width;
double height = MediaQuery.of(context).size.height;

// Responsive layout
Widget build(BuildContext context) {
  if (width > 600) {
    return Row(children: [Sidebar(), Content()]); // Desktop
  }
  return Column(children: [Content()]); // Mobile
}
```

### LayoutBuilder

```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth > 600) {
      return GridView.count(crossAxisCount: 4); // Desktop
    }
    return GridView.count(crossAxisCount: 2); // Mobile
  },
)
```

### Breakpoints phổ biến

```dart
// Mobile: < 600px
// Tablet: 600px - 1024px
// Desktop: > 1024px

double width = MediaQuery.of(context).size.width;

if (width < 600) {
  // Mobile layout
} else if (width < 1024) {
  // Tablet layout
} else {
  // Desktop layout
}
```

---

## 8. Animation

### Implicit Animation (tự động)

Các widget có prefix `Animated` — Flutter tự động animate khi giá trị thay đổi:

```dart
// AnimatedContainer
AnimatedContainer(
  duration: Duration(milliseconds: 300),
  curve: Curves.easeInOut,
  width: _expanded ? 200 : 100,
  height: _expanded ? 200 : 100,
  color: _expanded ? Colors.blue : Colors.red,
)

// AnimatedOpacity
AnimatedOpacity(
  opacity: _visible ? 1.0 : 0.0,
  duration: Duration(milliseconds: 500),
  child: Text('Fade'),
)

// AnimatedPadding
AnimatedPadding(
  duration: Duration(milliseconds: 300),
  padding: EdgeInsets.all(_expanded ? 32 : 16),
  child: Container(...),
)

// AnimatedPositioned (trong Stack)
AnimatedPositioned(
  duration: Duration(milliseconds: 300),
  top: _moved ? 100 : 0,
  left: _moved ? 100 : 0,
  child: Container(...),
)
```

### Explicit Animation (thủ công)

Dùng `AnimationController` để kiểm soát chi tiết:

```dart
class _MyState extends State<MyWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    
    _controller.repeat(reverse: true); // Lặp lại
    // Hoặc: _controller.forward(); // Chạy 1 lần
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Text('Fade'),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

### Các Transition widgets

```dart
FadeTransition(opacity: animation, child: ...)
ScaleTransition(scale: animation, child: ...)
RotationTransition(turns: animation, child: ...)
SlideTransition(position: animation, child: ...)
SizeTransition(sizeFactor: animation, child: ...)
```

### Hero Animation

Animate widget giữa 2 trang:

```dart
// Page 1
Hero(
  tag: 'hero-image',
  child: Image.network('https://example.com/image.jpg'),
)

// Page 2
Hero(
  tag: 'hero-image', // Same tag!
  child: Image.network('https://example.com/image.jpg'),
)
```

### Curves (easing functions)

```dart
Curves.linear
Curves.easeIn
Curves.easeOut
Curves.easeInOut
Curves.bounceIn
Curves.bounceOut
Curves.elasticIn
Curves.elasticOut
```

---

## 9. Widget Reference

### ✅ Must-know (20 widgets cốt lõi)

| Widget | Mô tả | Ví dụ |
|--------|-------|-------|
| MaterialApp | Root widget | `MaterialApp(home: HomePage())` |
| Scaffold | Khung UI | `Scaffold(appBar: ..., body: ...)` |
| Text | Văn bản | `Text('Hello')` |
| Icon | Icon | `Icon(Icons.home)` |
| Image | Hình ảnh | `Image.network('url')` |
| Container | Hộp đa năng | `Container(width: 100, color: Colors.blue)` |
| Center | Căn giữa | `Center(child: Text('Hi'))` |
| Row | Bố trí ngang | `Row(children: [...])` |
| Column | Bố trí dọc | `Column(children: [...])` |
| Stack | Xếp chồng | `Stack(children: [...])` |
| Expanded | Chiếm không gian | `Expanded(child: ...)` |
| SizedBox | Spacing/size | `SizedBox(height: 20)` |
| Padding | Khoảng cách trong | `Padding(padding: EdgeInsets.all(16))` |
| ListView | Danh sách cuộn | `ListView.builder(...)` |
| GridView | Lưới | `GridView.count(crossAxisCount: 2)` |
| TextField | Input | `TextField(decoration: ...)` |
| ElevatedButton | Nút nổi | `ElevatedButton(onPressed: () {})` |
| AppBar | Thanh trên | `AppBar(title: Text('Title'))` |
| Drawer | Menu trượt | `Drawer(child: ListView(...))` |
| BottomNavigationBar | Thanh dưới | `BottomNavigationBar(items: [...])` |

### 📚 Should-know (10 widgets bổ sung)

| Widget | Mô tả |
|--------|-------|
| Card | Thẻ có shadow |
| ListTile | Item list chuẩn |
| Switch | Công tắc |
| Checkbox | Hộp kiểm |
| Slider | Thanh trượt |
| InkWell | Tap với ripple |
| GestureDetector | Phát hiện gesture |
| FutureBuilder | Async data |
| StreamBuilder | Stream data |
| AnimatedContainer | Animation đơn giản |

### 🎯 Advanced (5 widgets nâng cao)

| Widget | Mô tả |
|--------|-------|
| Hero | Transition giữa trang |
| MediaQuery | Thông tin màn hình |
| LayoutBuilder | Layout responsive |
| CustomPaint | Vẽ custom |
| AnimationController | Animation phức tạp |

---

## 10. Quick Start

### Yêu cầu

- Flutter SDK (≥ 3.0.0)
- Dart SDK (kèm Flutter)
- Android Studio / Xcode (cho simulator)
- VS Code + extension Dart & Flutter

Kiểm tra môi trường:

```bash
flutter doctor
```

### Cài đặt & chạy

```bash
# 1. Cài phụ thuộc
flutter pub get

# 2. Chạy app (chọn thiết bị trước)
flutter run

# 3. Hot Reload
# Nhấn 'r' trong terminal hoặc ⚡ trong IDE

# 4. Hot Restart (reset state)
# Nhấn 'R' trong terminal
```

### Lệnh hay dùng

```bash
# Kiểm tra lỗi
flutter analyze

# Chạy test
flutter test

# Build APK (Android)
flutter build apk

# Build iOS
flutter build ios

# Làm sạch build cache
flutter clean

# Upgrade Flutter
flutter upgrade

# Xem devices
flutter devices

# Xem logs
flutter logs
```

### VS Code Settings (khắc phục format on save)

Tạo `.vscode/settings.json`:

```json
{
  "editor.formatOnSave": true,
  "[dart]": {
    "editor.defaultFormatter": "Dart-Code.dart-code",
    "editor.formatOnSave": true
  },
  "prettier.disableLanguages": ["dart"],
  "dart.enableSdkFormatter": true
}
```

---

## 💡 Mẹo học hiệu quả

### 1. Thực hành ngay
- Code theo từng ví dụ trong README
- Thay đổi và Hot Reload để thấy kết quả

### 2. Widget Inspector
- Bật trong DevTools để debug UI
- Xem widget tree và properties

### 3. So sánh với CSS
- Row = flexbox row
- Column = flexbox column
- Expanded = flex: 1
- Stack = position: absolute

### 4. Đọc docs
- Flutter docs: https://docs.flutter.dev/
- Widget catalog: https://docs.flutter.dev/development/ui/widgets
- API reference: https://api.flutter.dev/

### 5. Debug tips
- Dùng `print()` để log
- Dùng `debugPrint()` cho log dài
- Dùng `assert()` để check điều kiện trong dev
- Dùng Flutter DevTools để inspect

### 6. Common errors

**Scaffold.of() error:**
```dart
// ❌ Sai
Scaffold.of(context).openDrawer()

// ✅ Đúng
Builder(builder: (context) {
  return IconButton(
    onPressed: () => Scaffold.of(context).openDrawer(),
    icon: Icon(Icons.menu),
  );
})
```

**setState() error:**
```dart
// ❌ Sai: setState ngoài State
class MyWidget extends StatelessWidget {
  void update() {
    setState(() {}); // Error!
  }
}

// ✅ Đúng: setState trong State
class _MyState extends State<MyWidget> {
  void update() {
    setState(() {}); // OK
  }
}
```

---

## 🎯 Lộ trình học (8 tuần)

### Week 1: Layout Basics
- MaterialApp, Scaffold
- Row, Column, Container
- Padding, Center, SizedBox
- **Practice**: Tạo layout đơn giản

### Week 2: Display & Input
- Text, Image, Icon
- TextField, Button (3 loại)
- **Practice**: Form đăng nhập

### Week 3: Lists & Cards
- ListView, GridView
- Card, ListTile
- **Practice**: Danh sách sản phẩm

### Week 4: Navigation
- Navigator.push/pop
- Drawer, BottomNavigationBar
- **Practice**: Multi-page app

### Week 5: State Management
- StatefulWidget, setState
- TextEditingController
- **Practice**: Counter app, Todo app

### Week 6: Responsive UI
- MediaQuery
- LayoutBuilder
- **Practice**: Responsive layout

### Week 7: Animation
- AnimatedContainer
- Hero animation
- **Practice**: Animated UI

### Week 8: Advanced
- FutureBuilder, StreamBuilder
- Custom widgets
- **Practice**: Mini project (News app, Weather app)

---

## 📚 Tài liệu tham khảo

### Official
- [Flutter Docs](https://docs.flutter.dev/)
- [Dart Docs](https://dart.dev/guides)
- [Widget Catalog](https://docs.flutter.dev/development/ui/widgets)
- [Codelabs](https://docs.flutter.dev/get-started/codelab)

### Community
- [Flutter YouTube](https://www.youtube.com/@flutterdev)
- [Flutter Reddit](https://www.reddit.com/r/FlutterDev/)
- [Flutter Community](https://flutter.dev/community)

### Packages
- [pub.dev](https://pub.dev/) — Package repository
- [FlutterFire](https://firebase.flutter.dev/) — Firebase cho Flutter

---

## 🎓 Project trong repo này

### BasicFlutterPage
Demo các widget cơ bản: Text, Button, TextField, Switch, Checkbox, Slider, ListView, GridView, Card, Stack.

### SecondPage (Complete Demo)
Trang đầy đủ với 3 tabs:
- **Widgets Tab**: Layout, Input, Animation
- **Lists Tab**: Horizontal + Vertical ListView
- **Grid Tab**: GridView, FutureBuilder, StreamBuilder, Responsive info

Chạy app và khám phá từng tính năng!

---

## 🚀 Bắt đầu ngay

```bash
# Clone repo (nếu cần)
git clone <repo-url>

# Cài dependency
flutter pub get

# Chạy app
flutter run
```

Chúc bạn học tốt Flutter! 💙

---

**Made with ❤️ by Flutter Learners**
