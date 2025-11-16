import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: const HomeActivity(),
    );
  }
}

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
    // Pages use current state so Tab-2 always shows latest values
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
          child: Text("Tab 3 - API (coming soon)", style: TextStyle(fontSize: 18)),
        ),
      ),
      const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text("Tab 4 - Pages (coming soon)", style: TextStyle(fontSize: 18)),
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

/// ---------------- Tab 1 ----------------
/// Form UI with nicer design
class TabOne extends StatefulWidget {
  final String dropdownValue;
  final String radioValue;
  final String inputValue;
  final ValueChanged<String> onDropdownChanged;
  final ValueChanged<String> onRadioChanged;
  final ValueChanged<String> onInputChanged;

  const TabOne({
    super.key,
    required this.dropdownValue,
    required this.radioValue,
    required this.inputValue,
    required this.onDropdownChanged,
    required this.onRadioChanged,
    required this.onInputChanged,
  });

  @override
  State<TabOne> createState() => _TabOneState();
}

class _TabOneState extends State<TabOne> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.inputValue);
    _controller.addListener(() {
      widget.onInputChanged(_controller.text);
    });
  }

  @override
  void didUpdateWidget(covariant TabOne oldWidget) {
    super.didUpdateWidget(oldWidget);
    // keep controller in sync if parent value changed externally
    if (oldWidget.inputValue != widget.inputValue && widget.inputValue != _controller.text) {
      _controller.text = widget.inputValue;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildCard({required Widget child}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(padding: const EdgeInsets.all(16), child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 12),
          _buildCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Choose an option', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: widget.dropdownValue,
                      isExpanded: true,
                      items: const [
                        DropdownMenuItem(value: 'Option A', child: Text('Option A')),
                        DropdownMenuItem(value: 'Option B', child: Text('Option B')),
                        DropdownMenuItem(value: 'Option C', child: Text('Option C')),
                      ],
                      onChanged: (v) {
                        if (v != null) widget.onDropdownChanged(v);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          _buildCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Pick one (radio)', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Radio<String>(
                          value: 'Radio 1',
                          groupValue: widget.radioValue,
                          onChanged: (v) {
                            if (v != null) widget.onRadioChanged(v);
                          },
                        ),
                        title: const Text('Radio 1'),
                        onTap: () => widget.onRadioChanged('Radio 1'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Radio<String>(
                          value: 'Radio 2',
                          groupValue: widget.radioValue,
                          onChanged: (v) {
                            if (v != null) widget.onRadioChanged(v);
                          },
                        ),
                        title: const Text('Radio 2'),
                        onTap: () => widget.onRadioChanged('Radio 2'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          _buildCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Input text', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Enter text here',
                    prefixIcon: const Icon(Icons.edit),
                    hintText: 'Type something...',
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // quick reset to dummy values
                        widget.onDropdownChanged('Option A');
                        widget.onRadioChanged('Radio 1');
                        widget.onInputChanged('Dummy text');
                        // reflect in controller immediately
                        _controller.text = 'Dummy text';
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Reset to default values')));
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Reset'),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton.icon(
                      onPressed: () {
                        // quick tip
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Tip'),
                            content: const Text('Change values here and switch to Preview tab to see them.'),
                            actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
                          ),
                        );
                      },
                      icon: const Icon(Icons.info_outline),
                      label: const Text('Help'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

/// ---------------- Tab 2 ----------------
class TabTwo extends StatelessWidget {
  final String Function() dropdownValueProvider;
  final String Function() radioValueProvider;
  final String Function() inputValueProvider;

  const TabTwo({
    super.key,
    required this.dropdownValueProvider,
    required this.radioValueProvider,
    required this.inputValueProvider,
  });

  @override
  Widget build(BuildContext context) {
    final dd = dropdownValueProvider();
    final rv = radioValueProvider();
    final iv = inputValueProvider();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Preview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Row(children: [const Icon(Icons.list_alt), const SizedBox(width: 8), Text('Dropdown: $dd')]),
                const SizedBox(height: 8),
                Row(children: [const Icon(Icons.radio_button_checked), const SizedBox(width: 8), Text('Radio: $rv')]),
                const SizedBox(height: 8),
                Row(children: [const Icon(Icons.text_fields), const SizedBox(width: 8), Expanded(child: Text('Input: $iv'))]),
              ]),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Current values'),
                  content: Text('Dropdown: $dd\nRadio: $rv\nInput: $iv'),
                  actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
                ),
              );
            },
            child: const Text('Show values'),
          ),
        ],
      ),
    );
  }
}

/// ---------------- Notification Page ----------------
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Welcome to the app!"),
            subtitle: Text("Thanks for trying the demo."),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("App Info"),
            subtitle: Text("This is a sample notification page."),
          ),
        ],
      ),
    );
  }
}
