import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/user_profile/presentation/manager/cubit/change_profile_ListTile_to_text_form_field_cubit.dart/chage_profile_field_state.dart';
import 'package:splash_app/feature/user_profile/presentation/manager/cubit/change_profile_ListTile_to_text_form_field_cubit.dart/change_profile_field_cubit.dart';
import 'package:splash_app/feature/user_profile/presentation/view/widgets/custom_svg_icon.dart';
import 'package:splash_app/feature/user_profile/presentation/view/widgets/edit_profile_text_form_field.dart';

class CustomListTileProfile extends StatelessWidget {
  const CustomListTileProfile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.controller,
  });

  final String icon;
  final String title;
  final void Function()? onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeProfileFieldCubit, ChangeProfileFieldState>(
      builder: (context, state) {
        if (state is TextFormFieldState) {
          return EditProfileTextFormField(
              label: title,
              controller: controller,
              icon: icon,
              onchange: (value) {});
        } else {
          return ListTile(
            leading: CustomSvgIcon(
              imagePath: icon,
            ),
            title: Text(
              title,
              maxLines: 1,
              style: StylesManager.textStyleRegular14
                  .copyWith(color: ColorsManager.black),
            ),
            onTap: () {
              BlocProvider.of<ChangeProfileFieldCubit>(context)
                  .changListTileState(value: false);
            },
            trailing: const CustomSvgIcon(
              imagePath: AssetsManager.editProfile,
            ),
          );
        }
      },
    );
  }
}
