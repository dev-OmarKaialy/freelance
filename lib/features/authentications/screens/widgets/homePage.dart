// file: home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1company/features/authentications/modules/post.dart';
import 'package:project1company/features/authentications/screens/widgets/post_page.dart';

import 'package:project1company/features/authentications/screens/widgets/reports_page.dart';
import 'package:project1company/utils/theme/theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();

    fetchPosts();
  }




  void fetchPosts() {

    setState(() {
      posts = [
        Post(
          id: '1',
          content: 'sample_post_content'.tr,
          authorName: 'author_name'.tr,
          authorProfilePicUrl: 'https://example.com/profile.jpg',
          likes: 0,
          comments: [],
        ),
      ];
    });
  }

  void addPost(String content) {
    setState(() {
      posts.add(Post(
        id: DateTime.now().toString(),
        content: content,
        authorName: 'current_user'.tr,
        authorProfilePicUrl: 'https://example.com/profile.jpg',
        likes: 0,
        comments: [],
      ));
    });
  }

  void deletePost(Post post) {
    setState(() {
      posts.remove(post);
    });
  }

  void reportPost(Post post) {
    Get.to(() => ReportPage(post: post));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'.tr),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostWidget(
            post: posts[index],
            onDelete: deletePost,
            onReport: reportPost,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Get.dialog(AddPostDialog());
          if (result != null && result is String && result.isNotEmpty) {
            addPost(result);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddPostDialog extends StatelessWidget {
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Post'.tr),
      content: TextField(
        controller: _postController,
        decoration: InputDecoration(
          hintText: 'Enter post content'.tr,
        ),
        maxLines: 5,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'.tr),
        ),
        TextButton(
          onPressed: () {
            if (_postController.text.isNotEmpty) {
              Navigator.pop(context, _postController.text);
            }
          },
          child: Text('Publish'.tr),
        ),
      ],
    );
  }
}
