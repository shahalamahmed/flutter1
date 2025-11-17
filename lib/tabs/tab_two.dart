import 'package:flutter/material.dart';

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