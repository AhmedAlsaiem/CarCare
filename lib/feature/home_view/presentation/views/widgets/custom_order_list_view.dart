import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/custom_car_item_skeltonizer_loading.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/service_request_manual_cubit/service_request_manual_cubit.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/service_request_manual_cubit/service_request_manual_state.dart';

import 'custom_order_list_view_builder.dart';

class CustomOrderListView extends StatefulWidget {
  const CustomOrderListView({
    super.key,
  });

  @override
  State<CustomOrderListView> createState() => _CustomOrderListViewState();
}

class _CustomOrderListViewState extends State<CustomOrderListView> {
  List<ServiceRequestEntity> ordersList = [];
  @override
  void initState() {
    requestAllOrders();
    super.initState();
  }

  Future<void> requestAllOrders() async {
    ordersList.addAll(await BlocProvider.of<ServiceRequestCubit>(context)
        .getAllOrdersForSepcificUser());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceRequestCubit, ServiceRequestState>(
      builder: (context, state) {
        if (state is ServiceRequestSucessState) {
          return Padding(
            padding: const EdgeInsets.only(
              top: AppSize.s30,
              left: AppSize.s16,
              right: AppSize.s16,
            ),
            child: CustomorderListViewBuilder(ordersList: ordersList),
          );
        } else if (state is ServiceRequestIsLoadinState) {
          return const CustomCarItemSkeltonizerLoading();
        } else if (state is ServiceRequestFailedState) {
          return Center(
            child: Text(
              state.error.errorMessage,
              style: StylesManager.textStyleRegular14.copyWith(
                color: ColorsManager.balck,
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
