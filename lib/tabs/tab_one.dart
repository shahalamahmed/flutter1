import 'package:flutter/material.dart';

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
          // Dropdown
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

          // Radio Buttons
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

          // Text Field and Buttons
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