import 'package:project1company/core/unified_api/api_variables.dart';
import 'package:project1company/core/unified_api/post_api.dart';
import 'package:project1company/data/company/register/addoffer/addoffermodel.dart';

class Addofferdatasource {
  Future<AddOfferModel> addoffer() async {
    final postApi = PostApi(
        uri: ApiVariables().Addoffer(),
        body: {},
        fromJson: addOfferModelFromJson);
    return await postApi.callRequest();
  }
}
