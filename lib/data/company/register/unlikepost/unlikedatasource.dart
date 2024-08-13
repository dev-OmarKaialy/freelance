import 'package:project1company/core/unified_api/api_variables.dart';
import 'package:project1company/core/unified_api/post_api.dart';
import 'package:project1company/data/company/register/unlikepost/unlikemodel.dart';

class Unlikedatasource {
  Future<UnLikePostModel> unlike() async {
    final postApi = PostApi(
        uri: ApiVariables().Unlike(),
        body: {},
        fromJson: unLikePostModelFromJson);
    return await postApi.callRequest();
  }
}
