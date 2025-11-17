// lib/pages/subpage_one.dart

import 'package:flutter/material.dart';

class SubPageOne extends StatelessWidget {
  const SubPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1: Asset & Icon')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 7. Widget: Image from Asset
            // IMPORTANT: Make sure you have an image in your assets/ folder
            // and the path is correctly added in pubspec.yaml.
            // Example path: 'assets/sample_asset.jpg'
            const Text(
              'Image from Asset:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              height: 150,
              width: 150,
              color: Colors.grey[200],
              child: const Center(
                child: Text('Add Asset Image Here', textAlign: TextAlign.center),
                // Replace with actual Image.asset when ready:
                // Image.asset('assets/sample_asset.jpg', fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 30),

            // 7. Widget: Icon
            const Text(
              'Icon Widget:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Icon(
                Icons.thumb_up_alt_outlined,
                size: 50,
                color: Colors.blue
            ),
            const SizedBox(height: 20),
            const Text('Asset and Icon demo complete.'),
          ],
        ),
      ),
    );
  }
}