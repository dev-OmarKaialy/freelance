import 'package:dartz/dartz.dart';
import 'package:project1company/core/error/failures.dart';
import 'package:project1company/core/unified_api/handling_exception_manager.dart';
import 'package:project1company/data/company/register/post/postdatasource.dart';
import 'package:project1company/data/company/register/post/postmodel.dart';
import 'package:project1company/data/customer/post/postDatasource.dart';
import 'package:project1company/data/customer/post/search_model.dart';

class Postrepo with HandlingExceptionManager {
  Future<Either<Failure, PostModel>> addPost(
      String title, String contet, String file) async {
    return wrapHandling(tryCall: () async {
      return Right(await Postdatasource().addPost(title, contet, file));
    });
  }

  Future<Either<Failure, PostModel>> updatePost(String title, int id) async {
    return wrapHandling(tryCall: () async {
      return Right(await Postdatasource().updatePost(title, id));
    });
  }

  Future<Either<Failure, SearchModel>> search() async {
    return wrapHandling(tryCall: () async {
      return Right(await SearchDataSource().search());
    });
  }
}
