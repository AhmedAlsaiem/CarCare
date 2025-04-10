import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/widgets/custom_text_button.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';
import 'package:splash_app/feature/user_profile/domain/entities/user_profile_entity.dart';
import 'package:splash_app/feature/user_profile/presentation/manager/cubit/change_profile_ListTile_to_text_form_field_cubit.dart/change_profile_field_cubit.dart';
import 'package:splash_app/feature/user_profile/presentation/manager/cubit/user_Profile_cubit/user_profile_cubit.dart';
import 'package:splash_app/feature/user_profile/presentation/manager/cubit/user_Profile_cubit/user_profile_state.dart';
import 'package:splash_app/feature/user_profile/presentation/view/widgets/list_tile_profile.dart';

import '../../../../../core/utils/app_size.dart';
import '../../manager/cubit/change_profile_ListTile_to_text_form_field_cubit.dart/chage_profile_field_state.dart';

class CustomUserProfileButtomSection extends StatelessWidget {
  const CustomUserProfileButtomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.mainColor,
      child: Container(
        width: double.infinity,
        height: context.screenHeight * 0.6789,
        decoration: const BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.s28),
                topRight: Radius.circular(AppSize.s28))),
        child: Padding(
          padding: const EdgeInsets.only(top: AppSize.s30),
          child: BlocListener<UserProfileCubit, UserProfileState>(
            listener: (context, state) {
              handleUpdateUserProfileState(state, context);
            },
            child: BlocBuilder<UserProfileCubit, UserProfileState>(
              builder: (context, state) {
                if (state is UserProfileIsLoadingState) {
                  return const CustomCircularProgressIndicator();
                } else if (state is UserProfileSucessState) {
                  UserProfileEntity user = state.user;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ListTileProfile(
                              controller: context
                                  .read<UserProfileCubit>()
                                  .editUserNameController,
                              title: user.userName,
                              icon: AssetsManager.profile,
                              onTap: () {}),
                          const SizedBox(height: AppSize.s8),
                          ListTileProfile(
                              controller: context
                                  .read<UserProfileCubit>()
                                  .editEmailController,
                              title: user.email,
                              icon: AssetsManager.emailIcon,
                              onTap: () {}),
                          const SizedBox(height: AppSize.s8),
                          ListTileProfile(
                              title: user.phoneNumber,
                              controller: context
                                  .read<UserProfileCubit>()
                                  .editPhoneNumberController,
                              icon: AssetsManager.passwordIcon,
                              onTap: () {}),
                          const SizedBox(height: AppSize.s8),
                        ],
                      ),
                      BlocBuilder<ChangeProfileFieldCubit,
                          ChangeProfileFieldState>(
                        builder: (context, state) {
                          if (state is TextFormFieldState) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: AppSize.s20),
                              child: CustomButton(
                                  onPressed: () {
                                       BlocProvider.of<UserProfileCubit>(context)
                                        .updateCurrentUser();
                                    BlocProvider.of<ChangeProfileFieldCubit>(
                                            context)
                                        .changListTileState(value: true);
                                  },
                                  bottonName: StringsManager.edit),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

void handleUpdateUserProfileState(
    UserProfileState state, BuildContext context) {
  if (state is UpdateUserProfileIsLoadingState) {
    const CustomCircularProgressIndicator();
  } else if (state is UpdateUserProfileSucessState) {
    BlocProvider.of<UserProfileCubit>(context).getCurrentUser();
  } else if (state is UpdateUserProfileFailedState) {
    customShowSnackBar(context, state.errorMassage);
  }
}
