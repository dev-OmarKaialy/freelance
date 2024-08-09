import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/costants/const.dart';
import '../../controllers-onboarding/pinding_post_controller.dart';



class PostScreen extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending post', style: TextStyle(color: Colors.white)),
        backgroundColor: ksecondColor,
        elevation: 0,
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: postController.posts.length,
          itemBuilder: (context, index) {
            final post = postController.posts[index];
            return Card(
              color: Colors.grey,
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(post.imageUrl),
                      ),
                      title: Text(post.name,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(post.content),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.thumb_up), onPressed: () {  },

                        ),
                        Text('${post.likes}'),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(Icons.comment),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _buildActionButton(
                          label: 'Accept',
                          backgroundColor:Colors.white, // تغيير اللون هنا
                          onPressed: () => postController.acceptPost(index),
                        ),
                        SizedBox(width: 10),
                        _buildActionButton(
                          label: 'Reject',
                          backgroundColor: Colors.white, // تغيير اللون هنا
                          onPressed: () => postController.rejectPost(index),
                        ),
                      ],
                    ),
                    if (post.comments.isNotEmpty) ...post.comments.map((comment) => Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(comment, style: TextStyle(color: Colors.grey)),
                    )).toList(),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _buildActionButton({
    required String label,
    required Color backgroundColor,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:ksecondColor,
        foregroundColor:Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
  void _showCommentDialog(BuildContext context, int index) {
    final TextEditingController commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Comment'),
          content: TextField(
            controller: commentController,
            decoration: InputDecoration(hintText: 'Enter your comment'),
          ),
          actions: [


            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // postController.addComment(index, commentController.text);
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}



