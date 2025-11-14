import 'package:basic_flutter/pages/second_page.dart';
import 'package:flutter/material.dart';

class BasicFlutterPage extends StatefulWidget {
  const BasicFlutterPage({super.key});

  @override
  State<BasicFlutterPage> createState() => _BasicFlutterPageState();
}

class _BasicFlutterPageState extends State<BasicFlutterPage> {
  bool _switchVal = true;
  bool _checkboxVal = false;
  double _sliderVal = 40;
  final TextEditingController _controller = TextEditingController();
  int _bottomIndex = 0;

  void _showSnack(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purple[300]!],
                ),
              ),
              accountName: const Text('Flutter Learner'),
              accountEmail: const Text('flutter@example.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Colors.deepPurple),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_forward),
              title: const Text('Second Page'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('About'),
                    content: const Text(
                      'Trang này demo toàn bộ kiến thức căn bản Flutter:\n\n'
                      '• Layout widgets\n'
                      '• Input widgets\n'
                      '• Lists & Grids\n'
                      '• Animations\n'
                      '• Async widgets\n'
                      '• Responsive design',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                _showSnack('Settings opened');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: const Text(
          'Basic Widgets',
          style: TextStyle(color: Colors.white),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(color: Colors.white, Icons.menu),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () => _showSnack('Pressed settings'),
            icon: const Icon(color: Colors.white, Icons.settings),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.(
        onPressed: () => _showSnack('FAB pressed'),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomIndex,
        onTap: (i) => setState(() => _bottomIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Grid'),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle('Text & Style'),
              const Text(
                'Hello Flutter',
                style: TextStyle(fontSize: 20, color: Colors.deepPurple),
              ),
              const SizedBox(height: 12),

              sectionTitle('Row'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.star, color: Colors.orange),
                  Icon(Icons.favorite, color: Colors.red),
                  Icon(Icons.thumb_up, color: Colors.blue),
                ],
              ),
              const SizedBox(height: 8),

              sectionTitle('Column & Container'),
              Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: const [
                    Text('A Container with padding'),
                    SizedBox(height: 8),
                    Icon(Icons.widgets, size: 36, color: Colors.deepPurple),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              sectionTitle('Image'),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/seed/flutter/400/200',
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),

              sectionTitle('Buttons'),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _showSnack('Elevated'),
                    child: const Text('Elevated'),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: () => _showSnack('Outlined'),
                    child: const Text('Outlined'),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () => _showSnack('Text'),
                    child: const Text('Text'),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              sectionTitle('TextField'),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter text',
                ),
                onSubmitted: (v) => _showSnack('Submitted: $v'),
              ),
              const SizedBox(height: 8),
              Text('You typed: ${_controller.text}'),
              const SizedBox(height: 8),

              sectionTitle('Switch / Checkbox / Slider'),
              Row(
                children: [
                  const Text('Switch:'),
                  Switch(
                    value: _switchVal,
                    onChanged: (v) => setState(() => _switchVal = v),
                  ),
                  const SizedBox(width: 12),
                  const Text('Checkbox:'),
                  Checkbox(
                    value: _checkboxVal,
                    onChanged: (v) => setState(() => _checkboxVal = v ?? false),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Slider:'),
                  Expanded(
                    child: Slider(
                      value: _sliderVal,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      label: _sliderVal.round().toString(),
                      onChanged: (v) => setState(() => _sliderVal = v),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              sectionTitle('Card & ListTile'),
              Card(
                elevation: 3,
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: const Text('ListTile title'),
                  subtitle: const Text('Subtitle text'),
                  trailing: IconButton(
                    onPressed: () => _showSnack('Message'),
                    icon: const Icon(Icons.message),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              sectionTitle('Horizontal ListView'),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, i) => Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[(i + 1) * 100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Item ${i + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              sectionTitle('GridView (fixed count)'),
              SizedBox(
                height: 160,
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: List.generate(
                    6,
                    (i) => Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[(i + 1) * 100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'G${i + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              sectionTitle('Stack'),
              SizedBox(
                height: 120,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const Positioned(
                      bottom: 8,
                      right: 8,
                      child: Icon(Icons.place, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
