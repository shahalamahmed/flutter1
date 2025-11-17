import 'package:flutter/material.dart';
import 'tabs/tab_one.dart';
import 'tabs/tab_two.dart';
import 'tabs/tab_three.dart';
import 'tabs/tab_four.dart';
import 'pages/notification_page.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  int _currentIndex = 0;

  // Shared state between Tab-1 and Tab-2
  String _dropdownValue = 'Option A';
  String _radioValue = 'Radio 1';
  String _inputValue = 'Dummy text';

  // Update callbacks
  void _updateDropdown(String v) => setState(() => _dropdownValue = v);
  void _updateRadio(String v) => setState(() => _radioValue = v);
  void _updateInput(String v) => setState(() => _inputValue = v);

  @override
  Widget build(BuildContext context) {
    final pages = [
      TabOne(
        dropdownValue: _dropdownValue,
        radioValue: _radioValue,
        inputValue: _inputValue,
        onDropdownChanged: _updateDropdown,
        onRadioChanged: _updateRadio,
        onInputChanged: _updateInput,
      ),
      TabTwo(
        dropdownValueProvider: () => _dropdownValue,
        radioValueProvider: () => _radioValue,
        inputValueProvider: () => _inputValue,
      ),
      const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: TabThree(),
        ),
      ),
      const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: TabFour(),
        ),
      ),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
          elevation: 2,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              tooltip: 'Notifications',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NotificationPage()),
                );
              },
            )
          ],
        ),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey[600],
          showUnselectedLabels: true,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.tune), label: "Form"),
            BottomNavigationBarItem(icon: Icon(Icons.preview), label: "Preview"),
            BottomNavigationBarItem(icon: Icon(Icons.cloud_download), label: "API"),
            BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Pages"),
          ],
        ),
      ),
    );
  }
}
