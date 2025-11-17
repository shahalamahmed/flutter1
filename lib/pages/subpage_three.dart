// lib/pages/subpage_three.dart

import 'package:flutter/material.dart';

class SubPageThree extends StatefulWidget {
  const SubPageThree({super.key});

  @override
  State<SubPageThree> createState() => _SubPageThreeState();
}

class _SubPageThreeState extends State<SubPageThree> {
  double _size = 100.0;
  bool _isLarge = false;
  Color _color = Colors.red;

  void _toggleAnimation() {
    setState(() {
      _isLarge = !_isLarge;
      _size = _isLarge ? 200.0 : 100.0;
      _color = _isLarge ? Colors.blue : Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 3: Animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 7. Widget: Animation (using AnimatedContainer)
            AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.fastOutSlowIn,
              width: _size,
              height: _size,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_isLarge ? 50 : 10),
                boxShadow: [
                  BoxShadow(
                    color: _color.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                'Size: ${_size.toInt()}',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _toggleAnimation,
              child: const Text('Toggle Animation'),
            ),
            const SizedBox(height: 20),
            const Text('Uses AnimatedContainer for smooth transition.', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}