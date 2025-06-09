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
  int lastIndex = 0;
  @override
  void initState() {
    requestAllOrders();
    super.initState();
  }

  Future<void> requestAllOrders() async {
    context.read<ServiceRequestCubit>().index = 1;
    context.read<ServiceRequestCubit>().orderList.clear();

    ordersList.addAll(await BlocProvider.of<ServiceRequestCubit>(context)
        .getAllOrdersForSepcificUser());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorsManager.mainColor,
      onRefresh: requestAllOrders,
      child: NotificationListener(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            if (lastIndex == 0) {
              lastIndex = ordersList.length;
            } else {
              lastIndex = context.read<ServiceRequestCubit>().orderList.length;
            }
            context.read<ServiceRequestCubit>().getAllOrdersForSepcificUser();
          }
          return true;
        },
        child: BlocBuilder<ServiceRequestCubit, ServiceRequestState>(
          builder: (context, state) {
            if (state is GetAllOrdersSucessState) {
              print('^^^^^^^^^^^^^^6ff ${state.orderList.length}');
              return Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.s20,
                  left: AppSize.s16,
                  right: AppSize.s16,
                ),
                child: CustomorderListViewBuilder(
                  ordersList: state.orderList,
                  lastIndex: lastIndex,
                ),
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
        ),
      ),
    );
  }
}
