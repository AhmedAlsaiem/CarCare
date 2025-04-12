import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/feature/feadback_app/presentation/widget/rating_type_widget.dart';

class FeadbackOpation extends StatelessWidget {
  const FeadbackOpation({super.key});
  // BuildContext context;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          RatingTypeWidget(
            text: 'New Rate',
            ontap: () {
              Navigator.pushNamed(context, AppRoutes.newFeadback);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const NewFeadback()));

              // NavigatorManager.pushName(
              //     context: context, route: AppRoutes.newFeadback);
            },
          ),
          RatingTypeWidget(
            text: 'Get My Rate',
            ontap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const MyFeadback()));

              NavigatorManager.pushName(
              context: context,
              rootNavigator: true, 
              route: AppRoutes.myFeadback);
            },
          ),
          RatingTypeWidget(
            text: 'Update My Rate',
            ontap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const UpdateFeadback()));

              NavigatorManager.pushName(
                rootNavigator: true,
              context: context
              , route: AppRoutes.updateFeadback);
            },
          ),
          RatingTypeWidget(
            text: 'Get Rating App',
            ontap: () {
           

              NavigatorManager.pushName(
                rootNavigator: true,
              context: context
              , route: AppRoutes.getappFeadback);
            },
          ),
        ],
      ),

      /// child: RatingTypeWidget(),
    );
  }
}
