import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; // Import intl package
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/tecnical_state/tecniacl_cubit.dart';
import 'package:splash_app/technical/technical_home/presentation/widget/accept_or_cancal_button.dart';

class OrederDetailsInComplateOrder extends StatelessWidget {
  const OrederDetailsInComplateOrder({
    required this.name,
    required this.distance,
    required this.date,
    required this.price,
    required this.bussinsState,
    required this.id,
    required this.batteryType,
    required this.tiresize,
    required this.typeOfFuel,
    required this.typeOfoil,
    required this.winchType,
    super.key,
  });

  final String name;
  final double distance;
  final String bussinsState;

  final String date;
  final double price;
  final int id;
  final String typeOfFuel;
  final String typeOfoil;
  final String tiresize;
  final String batteryType;
  final String winchType;
  @override
  Widget build(BuildContext context) {
    // Parse and format the date
    DateTime dateTime = DateTime.parse(date);
    String formattedDate =
        DateFormat("yyyy-MM-dd hh:mm a").format(dateTime); // AM/PM format

    return Column(
      children: [
        Container(
          height: AppHeight.h122,
          width: context.screenWidth,
          decoration: BoxDecoration(
            color: ColorsManager.orderColor,
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '  $name',
                maxLines: 1,
                style: StylesManager.textStylewmedium20maincolor,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  '  $bussinsState  ', // Updated date format
                  style: StylesManager.textStylewmedium20maincolor,
                ),
                Text(
                  '  ${distance.toStringAsFixed(1)} km  ',
                  style: StylesManager.textStylewmedium20maincolor,
                ),
              ]),
              Text(
                '  $formattedDate  ', // Updated date format
                style: StylesManager.textStylewmedium20maincolor,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  '  $batteryType$typeOfoil$tiresize$typeOfFuel$winchType ',
                  maxLines: 1,
                  style: StylesManager.textStylewmedium20maincolor,
                ),
                Text(
                  '  ${(price * .8).toStringAsFixed(2)} EGP  ',
                  style: StylesManager.textStylewmedium20maincolor
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ]),
            ],
          ),
        ),
        SizedBox(height: AppHeight.h6),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Appwidth.w8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AcceptOrCancalButton(
                background: ColorsManager.white,
                color: ColorsManager.mainColor,
                text: 'complate',
                onpressed: () {
                  BlocProvider.of<TecniaclCubit>(context)
                      .complateOrder(orderId: id, context: context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
