class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> j) => Post(
      id: j['id'],
      title: j['title'],
      body: j['body']
  );
}