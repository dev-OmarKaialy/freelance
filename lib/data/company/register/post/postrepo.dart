import 'package:dartz/dartz.dart';
import 'package:project1company/core/error/failures.dart';
import 'package:project1company/core/unified_api/handling_exception_manager.dart';
import 'package:project1company/data/company/register/post/postdatasource.dart';
import 'package:project1company/data/company/register/post/postmodel.dart';

class Postrepo with HandlingExceptionManager {
  Future<Either<Failure, PostModel>> Post(title, content, file) async {
    return wrapHandling(tryCall: () async {
      return Right(await Postdatasource().addPost(title, content, file));
    });
  }
}
