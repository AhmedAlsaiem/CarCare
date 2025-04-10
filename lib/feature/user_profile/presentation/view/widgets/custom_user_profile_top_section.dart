
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/custom_svg_button_navigation_bar_item.dart';

import '../../manager/cubit/user_Profile_cubit/user_profile_cubit.dart';
import '../../manager/cubit/user_Profile_cubit/user_profile_state.dart';

class CustomUserProfiletopSection extends StatelessWidget {
  const CustomUserProfiletopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.mainColor,
      height: context.screenHeight * 0.2,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(AssetsManager.userBatteries),
                backgroundColor: ColorsManager.babyBlue,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: ColorsManager.babyBlue,
                child: CustomSvgButtonNavigationBarIcon(
                    imagePath: AssetsManager.cameraIcon,
                    color: ColorsManager.mainColor),
              ),
            ],
          ),
          const SizedBox(height: 5),
          BlocBuilder<UserProfileCubit, UserProfileState>(
            builder: (context, state) {
              if (state is UserProfileSucessState) {
                return Text(
                  state.user.userName,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  style: StylesManager.textStyleSemiBold18
                      .copyWith(color: ColorsManager.babyBlue),
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
