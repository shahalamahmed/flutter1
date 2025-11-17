import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';
import '../pages/post_detail_page.dart';

class TabThree extends StatefulWidget {
  const TabThree({super.key});
  @override
  State<TabThree> createState() => _TabThreeState();
}

class _TabThreeState extends State<TabThree> {
  late Future<List<Post>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPosts();
  }

  Future<List<Post>> fetchPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      final List data = jsonDecode(resp.body);
      // take first 15 for brevity
      return data.map((e) => Post.fromJson(e)).take(15).toList();
    } else {
      throw Exception('Failed to load posts (status ${resp.statusCode})');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: _postsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final posts = snapshot.data!;
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: posts.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final p = posts[index];
              return ListTile(
                title: Text(p.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: Text(p.body, maxLines: 2, overflow: TextOverflow.ellipsis),
                leading: CircleAvatar(child: Text(p.id.toString())),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PostDetailPage(post: p)));
                },
              );
            },
          );
        }
      },
    );
  }
}