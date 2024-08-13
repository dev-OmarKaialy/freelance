import 'package:dartz/dartz.dart';
import 'package:project1company/core/error/failures.dart';
import 'package:project1company/core/unified_api/handling_exception_manager.dart';
import 'package:project1company/data/company/register/unlikepost/unlikedatasource.dart';
import 'package:project1company/data/company/register/unlikepost/unlikemodel.dart';

class Unlikerepo with HandlingExceptionManager {
  Future<Either<Failure, UnLikePostModel>> unlike() async {
    return wrapHandling(tryCall: () async {
      return Right(await Unlikedatasource().unlike());
    });
  }
}
