// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/functions/handle_business_logic/check_status_for_minutes.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';
import 'package:splash_app/feature/checkout/presentation/views/widgets/cart_info_item.dart';
import 'package:splash_app/feature/checkout/presentation/views/widgets/total_price_widget.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/service_request_manual_cubit/service_request_manual_cubit.dart';

import '../../../../../core/functions/handle_business_logic/cheeck_status_for_automatic.dart';

class OrderDetailViewBody extends StatefulWidget {
  const OrderDetailViewBody({super.key});

  @override
  State<OrderDetailViewBody> createState() => _OrderDetailViewBodyState();
}

class _OrderDetailViewBodyState extends State<OrderDetailViewBody> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    value == true ? handleAllRequestsManualAndAutomatic(context) : null;
    value = false;
    ServiceRequestEntity? requestModel = ServiceRequestCubit.requestEntity;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Positioned(
              top: context.screenHeight * 0.8,
              left: context.screenWidth * 0.2,
              child: Row(
                children: [
                  Text(
                    'Order In Process..........',
                    style: StylesManager.textStyleRegular14
                        .copyWith(color: ColorsManager.darkGrey),
                  ),
                  const SizedBox(width: 20),
                  const CustomCircularProgressIndicatorForOrder(),
                ],
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/car_order _detail_image.png'),
              OrderInfoItem(
                title: 'service Id',
                value: requestModel!.id.toString(),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 5,
              ),
              OrderInfoItem(
                title: 'techincal name',
                value: requestModel.techName,
              ),
              OrderInfoItem(
                title: 'price',
                value: requestModel.servicePrice.toInt().toString(),
              ),
              const SizedBox(
                height: 5,
              ),
              OrderInfoItem(
                title: 'distance',
                value: requestModel.distance.toInt().toString(),
              ),
              const SizedBox(
                height: 5,
              ),
              const OrderInfoItem(
                title: 'discount',
                value: r'0$',
              ),
              const SizedBox(
                height: 5,
              ),
              OrderInfoItem(
                title: 'date',
                value: requestModel.createdOn.substring(0, 10),
              ),
              const SizedBox(
                height: 5,
              ),
              OrderInfoItem(
                title: 'bussiness status',
                value: requestModel.busnissStatus,
              ),
              const SizedBox(
                height: 5,
              ),
              OrderInfoItem(
                title: 'payment status',
                value: requestModel.paymentsSatus,
              ),
              const Divider(
                thickness: 2,
                height: 34,
                color: Color(0xffC7C7C7),
              ),
              TotalPrice(
                  title: 'Total',
                  value: '${requestModel.servicePrice.toInt()}'),
              const SizedBox(
                height: 16,
              ),
              const Expanded(child: SizedBox()),
              // CustomButton(
              //   bottonName: 'payment',
              //   onPressed: () async {

              //   },
              // ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void handleAllRequestsManualAndAutomatic(BuildContext context) async {
  if (BlocProvider.of<ServiceRequestCubit>(context).orderType == 1) {
    await checkStatusForAutomaticMinutes(context);
  } else {
    await checkStatusFor5Minutes(context);
  }
}
