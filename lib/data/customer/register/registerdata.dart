import 'package:project1company/core/unified_api/api_variables.dart';
import 'package:project1company/core/unified_api/post_api.dart';
import 'package:project1company/data/customer/register/registermodel.dart';

class registerdatasource {
  Future<RegisterModel> register() async {
    final postApi = PostApi(
        uri: ApiVariables().register(),
        body: {},
        fromJson: registerModelFromJson);
    return await postApi.callRequest();
  }

  Future<RegisterModel> login() async {
    final postApi = PostApi(
        uri: ApiVariables().login(), body: {}, fromJson: registerModelFromJson);
    return await postApi.callRequest();
  }
}
