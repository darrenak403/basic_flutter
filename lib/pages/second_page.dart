import 'package:basic_flutter/pages/basic_flutter_page.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  // State variables
  int _bottomIndex = 0;
  bool _switchVal = true;
  bool _checkboxVal = false;
  double _sliderVal = 50;
  String _selectedDropdown = 'Option 1';
  int _radioValue = 1;
  final TextEditingController _textController = TextEditingController();
  bool _isExpanded = false;
  bool _isVisible = true;
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _textController.dispose();
    _animController.dispose();
    super.dispose();
  }

  void _showSnack(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), duration: const Duration(seconds: 2)),
    );
  }

  Future<String> _fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Data loaded successfully!';
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  // Body content cho từng tab
  Widget _buildHomeTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _sectionTitle('🎨 Layout Widgets'),

        // Row example
        Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Row - Bố trí ngang:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.star, color: Colors.orange, size: 32),
                    Icon(Icons.favorite, color: Colors.red, size: 32),
                    Icon(Icons.thumb_up, color: Colors.blue, size: 32),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Stack example
        Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Stack - Xếp chồng:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 150,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.purple],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      const Positioned(
                        top: 10,
                        left: 10,
                        child: Icon(Icons.cloud, color: Colors.white, size: 40),
                      ),
                      const Positioned(
                        bottom: 10,
                        right: 10,
                        child: Text(
                          'Overlay Text',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        _sectionTitle('🖼️ Display Widgets'),

        // Image & Card
        Card(
          elevation: 3,
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://picsum.photos/seed/flutter2/400/200',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, size: 64),
                ),
              ),
              ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: const Text('ListTile với Avatar'),
                subtitle: const Text('Subtitle text here'),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () => _showSnack('More options'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        _sectionTitle('📝 Input Widgets'),

        // TextField
        TextField(
          controller: _textController,
          decoration: const InputDecoration(
            labelText: 'Enter text',
            hintText: 'Type something...',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.edit),
          ),
          onChanged: (value) => setState(() {}),
        ),
        const SizedBox(height: 8),
        Text('Bạn đã nhập: ${_textController.text}'),
        const SizedBox(height: 12),

        // Buttons
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ElevatedButton.icon(
              onPressed: () => _showSnack('Elevated Button'),
              icon: const Icon(Icons.send),
              label: const Text('Elevated'),
            ),
            OutlinedButton(
              onPressed: () => _showSnack('Outlined Button'),
              child: const Text('Outlined'),
            ),
            TextButton(
              onPressed: () => _showSnack('Text Button'),
              child: const Text('Text'),
            ),
            IconButton(
              onPressed: () => _showSnack('Icon Button'),
              icon: const Icon(Icons.favorite, color: Colors.red),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Switch & Checkbox
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Switch'),
                  value: _switchVal,
                  onChanged: (v) => setState(() => _switchVal = v),
                ),
                CheckboxListTile(
                  title: const Text('Checkbox'),
                  value: _checkboxVal,
                  onChanged: (v) => setState(() => _checkboxVal = v ?? false),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Slider
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Slider: ${_sliderVal.round()}'),
                Slider(
                  value: _sliderVal,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: _sliderVal.round().toString(),
                  onChanged: (v) => setState(() => _sliderVal = v),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Radio
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Radio Buttons:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                RadioListTile<int>(
                  title: const Text('Option 1'),
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (v) => setState(() => _radioValue = v!),
                ),
                RadioListTile<int>(
                  title: const Text('Option 2'),
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: (v) => setState(() => _radioValue = v!),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Dropdown
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: DropdownButtonFormField<String>(
              value: _selectedDropdown,
              decoration: const InputDecoration(
                labelText: 'Dropdown',
                border: OutlineInputBorder(),
              ),
              items: [
                'Option 1',
                'Option 2',
                'Option 3',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => _selectedDropdown = v!),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildListTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle('📜 Horizontal ListView'),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, i) => InkWell(
                    onTap: () => _showSnack('Tapped item ${i + 1}'),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.primaries[i % Colors.primaries.length],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Item ${i + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _sectionTitle('📋 Vertical ListView'),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 20,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, i) => ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.primaries[i % Colors.primaries.length],
                child: Text('${i + 1}'),
              ),
              title: Text('List Item ${i + 1}'),
              subtitle: Text('Subtitle for item ${i + 1}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _showSnack('Tapped list item ${i + 1}'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _sectionTitle('🎯 GridView'),
        SizedBox(
          height: 300,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: 12,
            itemBuilder: (context, i) => GestureDetector(
              onTap: () => _showSnack('Grid item ${i + 1}'),
              onLongPress: () => _showSnack('Long pressed ${i + 1}'),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.primaries[i % Colors.primaries.length],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    '${i + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        _sectionTitle('🎬 Animations'),

        // AnimatedContainer
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const Text(
                  'AnimatedContainer:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _isExpanded ? 200 : 100,
                    height: _isExpanded ? 200 : 100,
                    decoration: BoxDecoration(
                      color: _isExpanded ? Colors.blue : Colors.red,
                      borderRadius: BorderRadius.circular(
                        _isExpanded ? 100 : 12,
                      ),
                    ),
                    child: const Icon(
                      Icons.touch_app,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => setState(() => _isExpanded = !_isExpanded),
                  child: Text(_isExpanded ? 'Collapse' : 'Expand'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // AnimatedOpacity
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const Text(
                  'AnimatedOpacity:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Fade In/Out',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => setState(() => _isVisible = !_isVisible),
                  child: Text(_isVisible ? 'Hide' : 'Show'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // FadeTransition with AnimationController
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const Text(
                  'FadeTransition (explicit):',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                FadeTransition(
                  opacity: _animController,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Pulsing',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        _sectionTitle('🔮 Async Widgets'),

        // FutureBuilder
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'FutureBuilder:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                FutureBuilder<String>(
                  future: _fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 8),
                            Text('Loading...'),
                          ],
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    return Text(
                      snapshot.data ?? 'No data',
                      style: const TextStyle(color: Colors.green, fontSize: 16),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // StreamBuilder
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'StreamBuilder (timer):',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                StreamBuilder<int>(
                  stream: Stream.periodic(const Duration(seconds: 1), (i) => i),
                  builder: (context, snapshot) {
                    return Text(
                      'Count: ${snapshot.data ?? 0}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // MediaQuery & LayoutBuilder
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '📱 Responsive Info:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Screen width: ${MediaQuery.of(context).size.width.toStringAsFixed(1)}',
                ),
                Text(
                  'Screen height: ${MediaQuery.of(context).size.height.toStringAsFixed(1)}',
                ),
                const SizedBox(height: 8),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Text(
                      'Container width: ${constraints.maxWidth.toStringAsFixed(1)}',
                      style: const TextStyle(color: Colors.blue),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      _buildHomeTab(),
      _buildListTab(),
      _buildGridTab(),
    ];

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
              leading: const Icon(Icons.arrow_back),
              title: const Text('Basic Flutter Page'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BasicFlutterPage(),
                  ),
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
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: const Text(
          'Flutter Complete Demo',
          style: TextStyle(color: Colors.white),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu, color: Colors.white),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () => _showSnack('Search pressed'),
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () => _showSnack('More pressed'),
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: _pages[_bottomIndex],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showSnack('FAB pressed!'),
        icon: const Icon(Icons.add),
        label: const Text('Add'),
        backgroundColor: Colors.deepPurple,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomIndex,
        onTap: (i) => setState(() => _bottomIndex = i),
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.widgets), label: 'Widgets'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Lists'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Grid'),
        ],
      ),
    );
  }
}
