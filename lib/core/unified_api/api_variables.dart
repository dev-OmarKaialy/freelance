import 'dart:developer';

import '../extensions/log_colors_extension.dart';

class ApiVariables {
  /////////////
  ///General///
  /////////////
  final _scheme = 'http';
  final _host = '192.168.43.127';
  // final _port = 5000;

  Uri _mainUri({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      // port: _port,
      path: path,
      queryParameters: queryParameters,
    );
    log(uri.toString().logMagenta);
    return uri;
  }

  Uri _customerUri({required String path, Map<String, String>? params}) =>
      _mainUri(path: 'customer/$path', queryParameters: params);

  Uri _companyUri({required String path, Map<String, String>? params}) =>
      _mainUri(path: 'company/$path', queryParameters: params);

  //Uri forgetPassword() => _companyUri(path: 'forgotPassword');
  //Uri resetPassword() => _companyUri(path: 'resetPassword');
  //Uri indexWorkers(Map<String, String> params) =>
  //  _companyUri(path: 'workers', params: params);
  //Uri getWorker(String id) => _companyUri(path: 'worker/$id');
  //Uri reportTypes() => _companyUri(path: 'reportTypes');
  //Uri reportWorker() => _companyUri(path: 'report');
  //Uri requests() => _companyUri(path: 'requests');
  //Uri sendRequest() => _companyUri(path: 'request');
  //Uri cancelRequest(String id) => _companyUri(path: 'request/$id');
  //Uri singleRequests(String id) => _companyUri(path: 'request/$id');
  //Uri jobCategories() => _mainUri(path: 'jobCategories');
  //Uri profile() => _companyUri(path: 'profile');
  //Uri shopCategories() => _companyUri(path: 'shopCategories');
  //Uri shops() => _companyUri(path: 'shops');
  Uri login() => _companyUri(path: 'login');
  Uri register() => _companyUri(path: 'register');
  Uri Addoffer() => _companyUri(path: 'add-offer');
  Uri Post_1() => _companyUri(path: 'post');
  Uri add_link_to_post() => _companyUri(path: 'addLikeToPost');
  Uri Unlike() => _companyUri(path: 'unlikePost');
  Uri login_c() => _customerUri(path: 'path');
  Uri register_c() => _customerUri(path: 'register');
  Uri Post() => _customerUri(path: 'customer/post');
  Uri addservice() => _customerUri(path: 'customer/service');
  Uri deleteservice(String id) =>
      _customerUri(path: 'customer/deleteService/$id');
  Uri viewprofile(String id) =>
      _customerUri(path: 'customer/viewProfile/Customer/$id');
  Uri updateprofile() => _customerUri(path: 'customer/updateProfile/');
}
