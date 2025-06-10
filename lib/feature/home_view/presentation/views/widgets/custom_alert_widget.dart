import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/contact/presentation/manager/contact_cubit/contact_cubit.dart';
import 'package:splash_app/feature/contact/presentation/manager/contact_cubit/contact_state.dart';

class CustomAlertIconWidget extends StatefulWidget {
  const CustomAlertIconWidget({
    super.key,
  });

  @override
  State<CustomAlertIconWidget> createState() => _CustomAlertIconWidgetState();
}

class _CustomAlertIconWidgetState extends State<CustomAlertIconWidget> {
  @override
  void initState() {
    BlocProvider.of<ContactCubit>(context).getAllContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigatorManager.pushName(
            context: context, route: AppRoutes.contactView);
      },
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: AppSize.s30,
            backgroundColor: ColorsManager.brightGrey,
            child: SvgPicture.asset(
              alignment: Alignment.center,
              fit: BoxFit.cover,
              AssetsManager.notificationOnIcon,
              colorFilter: const ColorFilter.mode(
                ColorsManager.darkgreen,
                BlendMode.srcIn,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: AppSize.s10,
              backgroundColor: ColorsManager.blueGrey,
              child: Center(
                child: BlocBuilder<ContactCubit, ContactState>(
                  builder: (context, state) {
                    if (state is SuccessContactState) {
                      return Text(
                        state.contectList.length.toString(),
                        textAlign: TextAlign.center,
                        style: StylesManager.textStyleRegular12
                            .copyWith(color: ColorsManager.white),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
