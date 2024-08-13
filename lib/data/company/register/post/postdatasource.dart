import 'package:project1company/core/unified_api/api_variables.dart';
import 'package:project1company/core/unified_api/post_api.dart';
import 'package:project1company/data/company/register/post/postmodel.dart';

class Postdatasource {
  Future<PostModel> Post() async {
    final postApi = PostApi(
        uri: ApiVariables().Post_1(), body: {}, fromJson: postModelFromJson);
    return await postApi.callRequest();
  }
}
