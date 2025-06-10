
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';

List<ServiceRequestEntity> filterOrdersByCurrentPeriod({
  required List<ServiceRequestEntity> orders,
  required String filterType, 
}) {
  final now = DateTime.now();

  if (!['week', 'month', 'year'].contains(filterType.toLowerCase())) {
    return orders;
  }

  return orders.where((order) {
    final DateTime orderDate = DateTime.parse(order.createdOn);

    switch (filterType.toLowerCase()) {
      case 'week':
        final nowStartOfWeek = now.subtract(Duration(days: now.weekday - 1));
        final nowEndOfWeek = nowStartOfWeek.add(const Duration(days: 6));
        return orderDate
                .isAfter(nowStartOfWeek.subtract(const Duration(seconds: 1))) &&
            orderDate.isBefore(nowEndOfWeek.add(const Duration(days: 1)));
      case 'month':
        return orderDate.year == now.year && orderDate.month == now.month;
      case 'year':
        return orderDate.year == now.year;
      default:
        return false; 
    }
  }).toList();
}