import 'package:get/get.dart';

class PostController extends GetxController {

  var posts = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() {
    var fetchedPosts = [
      Post(name: "User1", imageUrl: "https://via.placeholder.com/150", content: "Post content 1"),
      Post(name: "User2", imageUrl: "https://via.placeholder.com/150", content: "Post content 2"),
      Post(name: "User3", imageUrl: "https://via.placeholder.com/150", content: "Post content 3"),
      Post(name: "User4", imageUrl: "https://via.placeholder.com/150", content: "Post content 4"),
      Post(name: "User5", imageUrl: "https://via.placeholder.com/150", content: "Post content 5"),


    ];
    posts.assignAll(fetchedPosts);
  }

  void acceptPost(int index) {
    posts.removeAt(index);
  }

  void rejectPost(int index) {
    posts.removeAt(index);
  }


}
class Post {
  String name;
  String imageUrl;
  String content;
  int likes;
  List<String> comments;

  Post({
    required this.name,
    required this.imageUrl,
    required this.content,
    this.likes = 0,
    this.comments = const [],
  });
}