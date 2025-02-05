class ServiceEntitiy {
  final int serviceId;
  final String title;
  final String subTitle;
  final String imageUrl;

  ServiceEntitiy({
    required this.imageUrl,
    required this.serviceId,
    required this.title,
    required this.subTitle,
  });
  List<Object?> get props => [
        serviceId,
        title,
        subTitle,
      ];
}
