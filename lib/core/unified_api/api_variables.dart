import 'dart:developer';

import '../extensions/log_colors_extension.dart';
import '../services/shared_preferences_service.dart';

class ApiVariables {
  /////////////
  ///General///
  /////////////
  final _scheme = 'http';
  final _host = 'localhost';
  // final _port = 5000;

  Uri _mainUri({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      port: 8000,
      path: path,
      queryParameters: queryParameters,
    );
    log(uri.toString().logMagenta);
    return uri;
  }

  Uri _customerUri({required String path, Map<String, String>? params}) =>
      _mainUri(path: 'api/customer/$path', queryParameters: params);

  Uri _companyUri({required String path, Map<String, String>? params}) =>
      _mainUri(path: 'api/company/$path', queryParameters: params);

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
  Uri login() => SharedPreferencesService.isCompany()
      ? _companyUri(path: 'login')
      : _customerUri(path: 'login');
  Uri register() => SharedPreferencesService.isCompany()
      ? _companyUri(path: 'register')
      : _customerUri(path: 'register');
  Uri Addoffer() => SharedPreferencesService.isCompany()
      ? _companyUri(path: 'add-offer')
      : _customerUri(path: 'add-offer');
  Uri add_link_to_post() => SharedPreferencesService.isCompany()
      ? _companyUri(path: 'addLikeToPost')
      : _customerUri(path: 'addLikeToPost');
  Uri updatePost(int id) => SharedPreferencesService.isCompany()
      ? _companyUri(path: 'addLikeToPost')
      : _customerUri(path: 'updatePost/$id');
  Uri Post_1() => SharedPreferencesService.isCompany()
      ? _companyUri(path: 'addLikeToPost')
      : _customerUri(path: 'post');
  Uri Unlike() => SharedPreferencesService.isCompany()
      ? _companyUri(path: 'addLikeToPost')
      : _companyUri(path: 'unlikePost');
  Uri addservice() => SharedPreferencesService.isCompany()
      ? _companyUri(path: 'addLikeToPost')
      : _customerUri(path: 'service');
  Uri deleteservice(String id) => SharedPreferencesService.isCompany()
      ? _companyUri(path: 'addLikeToPost')
      : _customerUri(path: 'deleteService/$id');
  Uri viewprofile(String id) => _customerUri(path: 'viewProfile/Customer/$id');
  Uri updateprofile() => _customerUri(path: 'updateProfile/');
  Uri search() => _customerUri(path: 'search');
}
