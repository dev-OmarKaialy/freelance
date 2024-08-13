import 'package:project1company/core/unified_api/api_variables.dart';
import 'package:project1company/core/unified_api/get_api.dart';
import 'package:project1company/core/unified_api/post_api.dart';
import 'package:project1company/data/customer/services/ServiceModel.dart';

class Servicedatasource {
  Future<ServiceModel> add_service() async {
    final postApi = PostApi(
        uri: ApiVariables().addservice(),
        body: {},
        fromJson: serviceModelFromJson);
    return await postApi.callRequest();
  }

  Future<ServiceModel> delete_service() async {
    final getApi = GetApi(
        uri: ApiVariables().deleteservice('0'),
        body: {},
        fromJson: serviceModelFromJson);
    return await getApi.callRequest();
  }
}
