import 'package:dartz/dartz.dart';
import 'package:project1company/core/error/failures.dart';
import 'package:project1company/core/unified_api/handling_exception_manager.dart';
import 'package:project1company/data/company/register/addoffer/addofferdatasource.dart';
import 'package:project1company/data/company/register/addoffer/addoffermodel.dart';

class Addofferrepo with HandlingExceptionManager {
  Future<Either<Failure, AddOfferModel>> addoffer() async {
    return wrapHandling(tryCall: () async {
      return Right(await Addofferdatasource().addoffer());
    });
  }
}
