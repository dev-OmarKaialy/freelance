import 'package:project1company/core/unified_api/api_variables.dart';
import 'package:project1company/core/unified_api/post_api.dart';
import 'package:project1company/data/company/register/addlinktopost/addlinkmodel.dart';

class Addlinkdatasource {
  Future<AddLinktopostModel> addlink() async {
    final postApi = PostApi(
        uri: ApiVariables().add_link_to_post(),
        body: {},
        fromJson: addLinktopostModelFromJson);
    return await postApi.callRequest();
  }
}
