import 'package:project1company/core/unified_api/api_variables.dart';
import 'package:project1company/core/unified_api/post_api.dart';
import 'package:project1company/data/customer/register/registermodel.dart';

class Companydata {
  Future<RegisterModel> postregister(body) async {
    final postApi = PostApi(
        uri: ApiVariables().register(),
        body: body,
        fromJson: registerModelFromJson);
    return await postApi.callRequest();
  }

  Future<RegisterModel> postlogin(body) async {
    final postApi = PostApi(
        uri: ApiVariables().login(),
        body: body,
        fromJson: registerModelFromJson);
    return await postApi.callRequest();
  }
}
