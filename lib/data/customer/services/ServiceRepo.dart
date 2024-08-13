import 'package:dartz/dartz.dart';
import 'package:project1company/core/error/failures.dart';
import 'package:project1company/core/unified_api/handling_exception_manager.dart';
import 'package:project1company/data/customer/services/ServiceDatasource.dart';
import 'package:project1company/data/customer/services/ServiceModel.dart';

class Servicerepo with HandlingExceptionManager {
  Future<Either<Failure, ServiceModel>> add_service() async {
    return wrapHandling(tryCall: () async {
      return Right(await Servicedatasource().add_service());
    });
  }
}
