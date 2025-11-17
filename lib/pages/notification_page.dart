import 'package:flutter/material.dart';

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