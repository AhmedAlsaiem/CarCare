import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; // Import intl package
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/tecnical_state/tecniacl_cubit.dart';
import 'package:splash_app/technical/technical_home/presentation/view/technical_home_view_body.dart';
import 'package:splash_app/technical/technical_home/presentation/widget/accept_or_cancal_button.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({
    required this.name,
    required this.distance,
    required this.date,
    required this.price,
    required this.batteryType,
    required this.tiresize,
    required this.typeOfFuel,
    required this.typeOfoil,
    required this.winchType,
    required this.id,
    super.key,
  });

  final String name;
  final double distance;
  final String date;
  final double price;
  final int id;
  final String typeOfFuel;
  final String typeOfoil;
  final String tiresize;
  final String batteryType;
  final String winchType;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    // Parse and format the date
    DateTime dateTime = DateTime.parse(widget.date);
    String formattedDate =
        DateFormat("yyyy-MM-dd hh:mm a").format(dateTime); // AM/PM format

    return Column(
      children: [
        Container(
       //   color:  ColorsManager.red,
       //  height:160,
height:  AppHeight.h122,
          width: context.screenWidth,
          decoration: BoxDecoration(
            color: ColorsManager.orderColor,
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             

               Text(
                      '  ${widget.name}',
                      maxLines: 1,
                      style: StylesManager.textStylewmedium20maincolor,
                    ),
              Text(
                '  ${widget.distance.toStringAsFixed(1)} km ',
                style: StylesManager.textStylewmedium20maincolor
                 //   .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                '  $formattedDate', // Updated date format
                style: StylesManager.textStylewmedium20maincolor
                 //   .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
               
                Text(
                  '  ${widget.batteryType}${widget.typeOfoil}${widget.tiresize}${widget.typeOfFuel}${widget.winchType}  ',
                  maxLines: 1,
                  style: StylesManager.textStylewmedium20maincolor,
                )
                ,
                 Text(
                  '  ${(widget.price * .8).toStringAsFixed(2)} EGP ',
                  style: StylesManager.textStylewmedium20maincolor
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ]),
            ],
          ),
        ),
        SizedBox(height: AppHeight.h10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Appwidth.w8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AcceptOrCancalButton(
                background: ColorsManager.white,
                color: ColorsManager.mainColor,
                text: 'Accept',
                onpressed: () {
                  BlocProvider.of<TecniaclCubit>(context).acceptOrder(
                    orderId: widget.id,
                    context: context,
                    onOrderAccepted: () {
                      // Find TechnicalHomeViewBody and turn off the switch
                      final technicalState = context.findAncestorStateOfType<
                          TechnicalHomeViewBodyState>();
                      technicalState?.setSwitchValue(false);
                    },
                  );
                  customShowSnackBar(context, 'Order Accepted Successfully');
                },
              ),
              AcceptOrCancalButton(
                background: ColorsManager.cancalColor,
                color: ColorsManager.white,
                text: 'Cancel',
                onpressed: () {
                  BlocProvider.of<TecniaclCubit>(context).cancalOrder(
                      orderId: widget.id,
                      context: context,
                      onOrderCancled: () {
                        final technicalState = context.findAncestorStateOfType<
                            TechnicalHomeViewBodyState>();
                        technicalState?.setSwitchValue(false);
                      });
          
                  customShowSnackBar(context, 'Order Cancal Successfully');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
