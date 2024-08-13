import 'package:dartz/dartz.dart';
import 'package:project1company/core/error/failures.dart';
import 'package:project1company/core/unified_api/handling_exception_manager.dart';
import 'package:project1company/data/customer/register/registerdata.dart';
import 'package:project1company/data/customer/register/registermodel.dart';

class Registerrepo with HandlingExceptionManager {
  Future<Either<Failure, RegisterModel>> register() async {
    return wrapHandling(tryCall: () async {
      return Right(await registerdatasource().register());
    });
  }
}
