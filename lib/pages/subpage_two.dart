// lib/pages/subpage_two.dart

import 'package:flutter/material.dart';

class SubPageTwo extends StatelessWidget {
  const SubPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2: Network & BottomSheet')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 7. Widget: Image from Network
            const Text(
              'Image from Network:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://picsum.photos/id/237/200/150', // Free placeholder image
                width: 200,
                height: 150,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 50),
              ),
            ),
            const SizedBox(height: 30),

            // 7. Widget: BottomSheet Modal (triggered by button)
            ElevatedButton(
              onPressed: () {
                _showMyBottomSheet(context);
              },
              child: const Text('Show BottomSheet Modal'),
            ),
          ],
        ),
      ),
    );
  }

  void _showMyBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 250,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'This is a BottomSheet Modal!',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                const Icon(Icons.info_outline, size: 40, color: Colors.green),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Close'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}