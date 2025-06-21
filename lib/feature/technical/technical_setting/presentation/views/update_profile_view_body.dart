import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/widgets/custom_text_button.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_text_form_field.dart';
import 'package:splash_app/feature/technical/technical_setting/domain/entity/profile_tecnical_entity.dart';
import 'package:splash_app/feature/technical/technical_setting/presentation/manger/tecnical_profile/tecnical_profile_cubit.dart';
import 'package:splash_app/feature/technical/technical_setting/presentation/manger/tecnical_profile/tecnical_profile_state.dart';
import 'package:splash_app/feature/technical/technical_setting/presentation/manger/update_profile/update_profile_cubit.dart';
import 'package:splash_app/feature/technical/technical_setting/presentation/manger/update_profile/update_profile_state.dart';
import 'package:splash_app/feature/technical/technical_setting/presentation/widget/handle_state.dart';



class UpdateProfileViewBody extends StatefulWidget {
  const UpdateProfileViewBody({super.key});

  @override
  State<UpdateProfileViewBody> createState() => _UpdateProfileViewBodyState();
}
class _UpdateProfileViewBodyState extends State<UpdateProfileViewBody> {
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _nationalIdController;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TecnicalProfileCubit>(context).getTecicalProfile();
    
    // Initialize controllers with empty values, they'll be updated when data loads
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _nationalIdController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _nationalIdController.dispose();
    super.dispose();
  }

  void _initializeControllers(ProfileTecnicalEntity entity) {
    _phoneController.text = entity.phoneNumber;
    _emailController.text = entity.email;
    _nameController.text = entity.fullName;
    _nationalIdController.text = entity.nationalId;
    
    // Also update the cubit's controllers
    context.read<UpdateProfileCubit>().phoneNumber.text = entity.phoneNumber;
    context.read<UpdateProfileCubit>().email.text = entity.email;
    context.read<UpdateProfileCubit>().name.text = entity.fullName;
    context.read<UpdateProfileCubit>().nationalId.text = entity.nationalId;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocListener<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          handleState(state, context);
        },
        child: BlocBuilder<TecnicalProfileCubit, TecnicalProfileState>(
          builder: (context, state) {
            if (state is IsLoadingTecnicalProfileState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainColor,
                ),
              );
            } else if (state is SuccessTecnicalProfileState) {
              // Initialize controllers with the loaded data
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _initializeControllers(state.tecnicalEntity);
              });

              return ListView(
                children: [
                  CustomTextFormField(
                    controller: _phoneController,
                    textInputType: TextInputType.number,
                    label: StringsManager.phoneNumber,
                    icon: const Icon(Icons.phone_android_rounded),
                    onchange: (value) {
                      context.read<UpdateProfileCubit>().phoneNumber.text = 
                          value.isEmpty ? state.tecnicalEntity.phoneNumber : value;
                    },
                  ),
                  const SizedBox(height: AppSize.s14),
                  CustomTextFormField(
                    controller: _emailController,
                    label: StringsManager.email,
                    icon: const Icon(Icons.email_outlined),
                    onchange: (value) {
                      context.read<UpdateProfileCubit>().email.text = 
                          value.isEmpty ? state.tecnicalEntity.email : value;
                    },
                  ),
                  const SizedBox(height: AppSize.s14),
                  CustomTextFormField(
                    controller: _nameController,
                    label: StringsManager.userName,
                    icon: const Icon(Icons.person_3_outlined),
                    onchange: (value) {
                      context.read<UpdateProfileCubit>().name.text = 
                          value.isEmpty ? state.tecnicalEntity.fullName : value;
                    },
                  ),
                  const SizedBox(height: AppSize.s14),
                  CustomTextFormField(
                    controller: _nationalIdController,
                    textInputType: TextInputType.number,
                    label: StringsManager.nationalId,
                    icon: const Icon(Icons.person_3_outlined),
                    onchange: (value) {
                      context.read<UpdateProfileCubit>().nationalId.text = 
                          value.isEmpty ? state.tecnicalEntity.nationalId : value;
                    },
                  ),
                  const SizedBox(height: AppSize.s14),
                  const SizedBox(height: AppSize.s50),
                  CustomButton(
                    bottonName: 'Update',
                    onPressed: () {
                      BlocProvider.of<UpdateProfileCubit>(context).updateProfile();
                      //  BlocProvider.of<TecnicalProfileCubit>(context).getTecicalProfile();


                    },
                  ),
                ],
              );
            } else if (state is FaliureTecnicalProfileState) {
              return const Center(child: Text('Error loading profile.'));
            } else {
              return const Center(child: Text('Waiting for profile data...'));
            }
          },
        ),
      ),
    );
  }
}