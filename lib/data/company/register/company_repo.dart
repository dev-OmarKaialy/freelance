import 'package:dartz/dartz.dart';
import 'package:project1company/core/error/failures.dart';
import 'package:project1company/core/unified_api/handling_exception_manager.dart';
import 'package:project1company/data/company/register/company-data.dart';
import 'package:project1company/data/customer/register/registermodel.dart';

class CompanyRepo with HandlingExceptionManager {
  Future<Either<Failure, RegisterModel>> postregister() async {
    return wrapHandling(tryCall: () async {
      return Right(await companydata().postregister());
    });
  }

  Future<Either<Failure, RegisterModel>> postlogin() async {
    return wrapHandling(tryCall: () async {
      return Right(await companydata().postlogin());
    });
  }
}
