import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/functions/correct_service_image_url.dart';
import 'package:splash_app/feature/authentaction/domain/entity/service_entities/service_entitiy.dart';

class ServiceModel extends ServiceEntitiy {
  ServiceModel({
    required super.serviceId,
    required super.title,
    required super.subTitle,
    required super.imageUrl,
  });
  factory ServiceModel.fomJson({required Map<String, dynamic> jsonData}) {
    return ServiceModel(
      serviceId: jsonData[ApiKey.id],
      title: jsonData[ApiKey.serviceName],
      subTitle: jsonData[ApiKey.serviceDescription],
      imageUrl: correctServiceImageUrl(imageUrl: jsonData[ApiKey.imageUrl]),
    );
  }
}
