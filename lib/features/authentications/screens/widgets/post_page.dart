import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1company/core/extensions/widget_extensions.dart';
import 'package:project1company/core/utils/toaster.dart';
import 'package:project1company/data/company/register/unlikepost/unlikerepo.dart';
import 'package:project1company/data/customer/post/postRepo.dart';
import 'package:project1company/features/authentications/screens/widgets/profile_show.dart';

import '../../modules/post.dart';

class PostWidget extends StatefulWidget {
  final Post post;
  final Function onDelete;
  final Function onReport;

  const PostWidget(
      {super.key,
      required this.post,
      required this.onDelete,
      required this.onReport});

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final ValueNotifier isLiked = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.post.authorProfilePicUrl),
              ).onTap(() {
                Get.to(ProfileShow(
                  id: widget.post.id,
                ));
              }),
              title: Text(widget.post.authorName),
              trailing: IconButton(
                icon: const Icon(Icons.report),
                onPressed: () {
                  widget.onReport(widget.post);
                },
              ),
            ),
            Text(widget.post.content),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                ValueListenableBuilder(
                    valueListenable: isLiked,
                    builder: (context, value, _) {
                      return TextButton.icon(
                        icon: Icon(value
                            ? Icons.thumb_up
                            : Icons.thumb_up_off_alt_outlined),
                        label: Text('${widget.post.likes}'),
                        onPressed: () async {
                          Toaster.showLoading();
                          if (value) {
                            isLiked.value = false;
                            await Unlikerepo().like(widget.post.id);
                          } else {
                            isLiked.value = true;
                            await Unlikerepo().unlike(widget.post.id);
                          }
                          setState(() {
                            widget.post.likes =
                                widget.post.likes + (value ? -1 : 1);
                          });
                          Toaster.closeLoading();
                        },
                      );
                    }),
                TextButton.icon(
                  icon: const Icon(Icons.comment),
                  label: Text('${widget.post.comments.length}'),
                  onPressed: () {
                    _showCommentDialog(context);
                  },
                ),
                TextButton.icon(
                  icon: const Icon(Icons.edit),
                  label: Text('edit'.tr),
                  onPressed: () {
                    _showEditPostDialog(context);
                  },
                ),
                TextButton.icon(
                  icon: const Icon(Icons.delete),
                  label: Text('delete'.tr),
                  onPressed: () {
                    _showDeleteConfirmationDialog(context);
                  },
                ),
              ],
            ),
            ...widget.post.comments
                .map((comment) => _buildComment(comment))
                .toList(),
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
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(comment.authorName,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(comment.content),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up, size: 20),
                      onPressed: () {
                        setState(() {
                          comment.likes += 1;
                        });
                      },
                    ),
                    Text('${comment.likes}'),
                    IconButton(
                      icon: const Icon(Icons.edit, size: 20),
                      onPressed: () {
                        _showEditCommentDialog(context, comment);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, size: 20),
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
    final TextEditingController commentController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('add_comment'.tr),
          content: TextField(
            controller: commentController,
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
                    content: commentController.text,
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
    final TextEditingController postController =
        TextEditingController(text: widget.post.content);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('edit_post'.tr),
          content: TextField(
            controller: postController,
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
              onPressed: () async {
                final r = await Postrepo()
                    .updatePost(postController.text, widget.post.id);
                r.fold((l) {
                  Toaster.closeLoading();
                  Toaster.showToast(l.message);
                }, (r) {
                  Toaster.closeLoading();
                  Toaster.showToast('Successfully Edited', isError: false);
                  setState(() {
                    widget.post.content = postController.text;
                  });
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
    final TextEditingController commentController =
        TextEditingController(text: comment.content);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('edit_comment'.tr),
          content: TextField(
            controller: commentController,
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
                  comment.content = commentController.text;
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
