
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/post.dart';

class PostWidget extends StatefulWidget {
  final Post post;
  final Function onDelete;
  final Function onReport;

  PostWidget({required this.post, required this.onDelete, required this.onReport});

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.post.authorProfilePicUrl),
              ),
              title: Text(widget.post.authorName),
              trailing: IconButton(
                icon: Icon(Icons.report),
                onPressed: () {
                  widget.onReport(widget.post);
                },
              ),
            ),
            Text(widget.post.content),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton.icon(
                  icon: Icon(Icons.thumb_up),
                  label: Text('${widget.post.likes}'),
                  onPressed: () {
                    setState(() {
                      widget.post.likes += 1;
                    });
                  },
                ),
                TextButton.icon(
                  icon: Icon(Icons.comment),
                  label: Text('${widget.post.comments.length}'),
                  onPressed: () {
                    _showCommentDialog(context);
                  },
                ),
                TextButton.icon(
                  icon: Icon(Icons.edit),
                  label: Text('edit'.tr),
                  onPressed: () {
                    _showEditPostDialog(context);
                  },
                ),
                TextButton.icon(
                  icon: Icon(Icons.delete),
                  label: Text('delete'.tr),
                  onPressed: () {
                    _showDeleteConfirmationDialog(context);
                  },
                ),
              ],
            ),
            ...widget.post.comments.map((comment) => _buildComment(comment)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildComment(Comment comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(comment.authorProfilePicUrl),
            radius: 15,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(comment.authorName, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(comment.content),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_up, size: 20),
                      onPressed: () {
                        setState(() {
                          comment.likes += 1;
                        });
                      },
                    ),
                    Text('${comment.likes}'),
                    IconButton(
                      icon: Icon(Icons.edit, size: 20),
                      onPressed: () {
                        _showEditCommentDialog(context, comment);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, size: 20),
                      onPressed: () {
                        setState(() {
                          widget.post.comments.remove(comment);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCommentDialog(BuildContext context) {
    final TextEditingController _commentController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('add_comment'.tr),
          content: TextField(
            controller: _commentController,
            decoration: InputDecoration(hintText: 'enter_comment'.tr),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('cancel'.tr),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  widget.post.comments.add(Comment(
                    id: DateTime.now().toString(),
                    content: _commentController.text,
                    authorName: 'current_user'.tr,
                    authorProfilePicUrl: 'https://example.com/profile.jpg',
                  ));
                });
                Navigator.of(context).pop();
              },
              child: Text('add'.tr),
            ),
          ],
        );
      },
    );
  }

  void _showEditPostDialog(BuildContext context) {
    final TextEditingController _postController = TextEditingController(text: widget.post.content);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('edit_post'.tr),
          content: TextField(
            controller: _postController,
            decoration: InputDecoration(hintText: 'enter_new_content'.tr),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('cancel'.tr),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  widget.post.content = _postController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('save'.tr),
            ),
          ],
        );
      },
    );
  }

  void _showEditCommentDialog(BuildContext context, Comment comment) {
    final TextEditingController _commentController = TextEditingController(text: comment.content);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('edit_comment'.tr),
          content: TextField(
            controller: _commentController,
            decoration: InputDecoration(hintText: 'enter_new_content'.tr),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('cancel'.tr),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  comment.content = _commentController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('save'.tr),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('confirm_delete'.tr),
          content: Text('sure_delete'.tr),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('cancel'.tr),
            ),
            TextButton(
              onPressed: () {
                widget.onDelete(widget.post);
                Navigator.of(context).pop();
              },
              child: Text('delete'.tr),
            ),
          ],
        );
      },
    );
  }
}

