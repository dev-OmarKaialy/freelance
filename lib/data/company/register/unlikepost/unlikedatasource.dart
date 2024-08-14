import 'package:project1company/core/unified_api/api_variables.dart';
import 'package:project1company/core/unified_api/post_api.dart';
import 'package:project1company/data/company/register/unlikepost/unlikemodel.dart';

class Unlikedatasource {
  Future<UnLikePostModel> unlike(int id) async {
    final postApi = PostApi(
        uri: ApiVariables().Unlike(),
        body: {'post_id': id},
        fromJson: unLikePostModelFromJson);
    return await postApi.callRequest();
  }

  Future<UnLikePostModel> like(int id) async {
    final postApi = PostApi(
        uri: ApiVariables().add_link_to_post(),
        body: {'post_id': id},
        fromJson: unLikePostModelFromJson);
    return await postApi.callRequest();
  }
}
