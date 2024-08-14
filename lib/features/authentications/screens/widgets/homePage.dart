// file: home_page.dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1company/data/customer/post/postRepo.dart';
import 'package:project1company/features/authentications/modules/post.dart';
import 'package:project1company/features/authentications/screens/widgets/post_page.dart';
import 'package:project1company/features/authentications/screens/widgets/reports_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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

  bool isLoading = false;
  bool isError = false;
  void fetchPosts() async {
    isLoading = true;
    setState(() {});
    final r = await Postrepo().search();
    r.fold((l) {
      isError = true;
    }, (r) {
      isError = false;
      posts = r.posts?.map((e) {
            return Post(
                id: e.id ?? 1,
                content: e.body ?? '',
                authorName: e.postableType?.name ?? '',
                authorProfilePicUrl: e.photo ?? '',
                date: e.createdAt?.toString().substring(0, 10) ?? '2024/2/12');
          }).toList() ??
          [];
    });
    isLoading = false;
    setState(() {});
  }

  void addPost(String title, String content, String file) async {
    await Postrepo().addPost(title, content, file);
    setState(() {
      posts.add(Post(
        id: Random().nextInt(1000),
        date: DateTime.now().toString(),
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
        leading: const SizedBox(),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : isError
              ? Center(
                  child: IconButton.filled(
                      onPressed: () {
                        fetchPosts();
                      },
                      icon: const Icon(Icons.refresh)),
                )
              : ListView.builder(
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
          if (result != null && result is Map && result.isNotEmpty) {
            addPost(result['body'], result['title'], result['file']);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddPostDialog extends StatelessWidget {
  final TextEditingController _postController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  AddPostDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Post'.tr),
      content: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'Enter post title'.tr,
            ),
            maxLines: 5,
          ),
          TextField(
            controller: _postController,
            decoration: InputDecoration(
              hintText: 'Enter post content'.tr,
            ),
            maxLines: 5,
          ),
        ],
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
              Navigator.pop(context, {
                'body': _postController.text,
                'title': _titleController.text,
                'file':
                    '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'
              });
            }
          },
          child: Text('Publish'.tr),
        ),
      ],
    );
  }
}
