import 'package:basic_flutter/pages/basic_flutter_page.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  void _showSnack(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Người dùng'),
              accountEmail: Text('you@example.com'),
              currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // đóng drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_forward),
              title: const Text('Basic Flutter Page'),
              onTap: () {
                Navigator.pop(context); // đóng drawer trước
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BasicFlutterPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                _showSnack('Opened settings from drawer');
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
      body: const Center(child: Text('This is the second page')),
    );
  }
}
