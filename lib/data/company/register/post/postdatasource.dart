import 'package:project1company/core/unified_api/api_variables.dart';
import 'package:project1company/core/unified_api/multi_post_api.dart';
import 'package:project1company/core/unified_api/post_api.dart';
import 'package:project1company/data/company/register/post/postmodel.dart';

class Postdatasource {
  Future<PostModel> addPost(String title, String content, String file) async {
    final postApi = MultiPostApi(
        uri: ApiVariables().Post_1(),
        files: {'file': file},
        body: {'body': content, 'title': title},
        fromJson: postModelFromJson);
    return await postApi.callRequest();
  }

  Future<PostModel> updatePost(String content, int id) async {
    final postApi = PostApi(
        uri: ApiVariables().updatePost(id),
        body: {'title': content},
        fromJson: postModelFromJson);
    return await postApi.callRequest();
  }
}
