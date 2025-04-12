import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/technical/technical_setting/presentation/views/profile_tecnical_view_body.dart';

class ProfileTecnicalView extends StatefulWidget {
  const ProfileTecnicalView({super.key});

  @override
  State<ProfileTecnicalView> createState() => _ProfileTecnicalViewState();
}

class _ProfileTecnicalViewState extends State<ProfileTecnicalView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: ColorsManager.white),
        title: Text(
          'Your Profile',
          style: StylesManager.textStyleBold20.copyWith(color: ColorsManager.white),
        ),
      ),
   
      floatingActionButton: FloatingActionButton(onPressed: (){
        NavigatorManager.pushWithReplacement(context: context, route: AppRoutes.updateProfile   );
      },
        backgroundColor: ColorsManager.mainColor,
        child: const Icon(Icons.edit ,  size:  34 ,color:  ColorsManager.white,),),
      
      body:const   ProfileTecnicalViewBody(),
    );
  }
}
