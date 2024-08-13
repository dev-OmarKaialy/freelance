import 'package:project1company/core/unified_api/api_variables.dart';
import 'package:project1company/core/unified_api/get_api.dart';
import 'package:project1company/core/unified_api/post_api.dart';
import 'package:project1company/data/customer/profile/profileModel.dart';

class Profiledatasource {
  Future<ProfileModel> view_profile() async {
    final getApi = GetApi(
        uri: ApiVariables().viewprofile('0'),
        body: {},
        fromJson: profileModelFromJson);
    return await getApi.callRequest();
  }

  Future<ProfileModel> update_service() async {
    final postApi = PostApi(
        uri: ApiVariables().updateprofile(),
        body: {},
        fromJson: profileModelFromJson);
    return await postApi.callRequest();
  }
}
