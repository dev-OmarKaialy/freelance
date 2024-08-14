import 'package:dartz/dartz.dart';
import 'package:project1company/core/error/failures.dart';
import 'package:project1company/core/unified_api/handling_exception_manager.dart';
import 'package:project1company/data/customer/profile/ProfileDatasource.dart';
import 'package:project1company/data/customer/profile/profileModel.dart';

class Profilerepo with HandlingExceptionManager {
  Future<Either<Failure, ProfileModel>> update_service() async {
    return wrapHandling(tryCall: () async {
      return Right(await Profiledatasource().update_service());
    });
  }

  Future<Either<Failure, ProfileModel>> showProfile(int? id) async {
    return wrapHandling(tryCall: () async {
      return Right(await Profiledatasource().view_profile(id));
    });
  }
}
