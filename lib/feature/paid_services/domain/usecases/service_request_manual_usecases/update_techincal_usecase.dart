import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';
import 'package:splash_app/feature/paid_services/domain/repo/service_request_manual_repo.dart';

class UpdateTechincalUsecase {
  ServiceRequestManualRepo repo;
  UpdateTechincalUsecase({required this.repo});
  Future<Either<ErrorModel, ServiceRequestEntity>> excute({
    required int serviceTypeId,
    required String techId,
    required String orderId,
  }) {
    return repo.updateTechincal(
      serviceTypeId: serviceTypeId,
      techId: techId,
      orderId: orderId,
    );
  }
}
