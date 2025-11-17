// lib/tabs/tab_four.dart

import 'package:flutter/material.dart';
import '../pages/subpage_one.dart';
import '../pages/subpage_two.dart';
import '../pages/subpage_three.dart';

class TabFour extends StatelessWidget {
  const TabFour({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildPageTile(
          context,
          title: 'Page 1: Asset Image & Icon',
          subtitle: 'Demonstrates Image from Asset and Icon widget.',
          icon: Icons.image,
          page: const SubPageOne(),
        ),
        _buildPageTile(
          context,
          title: 'Page 2: Network Image & BottomSheet',
          subtitle: 'Demonstrates Image from Network and BottomSheet Modal.',
          icon: Icons.cloud,
          page: const SubPageTwo(),
        ),
        _buildPageTile(
          context,
          title: 'Page 3: Animation Widget',
          subtitle: 'Demonstrates a simple animation widget.',
          icon: Icons.animation,
          page: const SubPageThree(),
        ),
      ],
    );
  }

  Widget _buildPageTile(BuildContext context, {required String title, required String subtitle, required IconData icon, required Widget page}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}