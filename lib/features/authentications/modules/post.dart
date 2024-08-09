import 'package:flutter/cupertino.dart';

class Post {
  String id;
  String content;
  String authorName;
  String authorProfilePicUrl;
  int likes;
  List<Comment> comments;

  Post({
    required this.id,
    required this.content,
    required this.authorName,
    required this.authorProfilePicUrl,
    this.likes = 0,
    this.comments = const [],
  });
}

class Comment {
  String id;
  String content;
  String authorName;
  String authorProfilePicUrl;
  int likes;

  Comment({
    required this.id,
    required this.content,
    required this.authorName,
    required this.authorProfilePicUrl,
    this.likes = 0,
  });
}

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  void addPost(Post post) {
    _posts.add(post);
    notifyListeners(); }

  void deletePost(Post post) {
    _posts.remove(post);
    notifyListeners();
  }
}
