import 'package:dartz/dartz.dart';
import 'package:project1company/core/error/failures.dart';
import 'package:project1company/core/unified_api/handling_exception_manager.dart';
import 'package:project1company/data/company/register/addlinktopost/addlinkdatasource.dart';
import 'package:project1company/data/company/register/addlinktopost/addlinkmodel.dart';

class Addlinlrepo with HandlingExceptionManager {
  Future<Either<Failure, AddLinktopostModel>> addlink() async {
    return wrapHandling(tryCall: () async {
      return Right(await Addlinkdatasource().addlink());
    });
  }
}
