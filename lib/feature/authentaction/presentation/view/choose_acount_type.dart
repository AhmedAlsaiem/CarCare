import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_logo_auth.dart';

class ChooseAcountType extends StatelessWidget {
  const ChooseAcountType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CustomLogoAuth(
            title: 'Choose Type',
            height: context.screenHeight * 0.2,
          ),
          const SizedBox(
            height: 30,
            width: double.infinity,
          ),
          Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
                color: ColorsManager.mainColor,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'User',
                  textAlign: TextAlign.right,
                  style: StylesManager.textStyleBold24,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 145,
                  width: 200,
                  child: Image.asset(
                    'assets/images/user1.png',
                  ),
                ),
              ],
            ),
          ),
         const SizedBox(
            height: 30,
          ),
          Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
                color: ColorsManager.mainColor,

                //   color: const Color.fromARGB(255, 30, 49, 83),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Service Provider',
                  style: StylesManager.textStyleBold24,
                ),
                SizedBox(
                  height: 150,
                  width: 200,
                  child: Image.asset(
                    'assets/images/service_provider.png',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
         const SizedBox(
            height: 40,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColorsManager.mainColor,
                borderRadius: BorderRadius.circular(12)),
            height: 70,
            width: 350,
            child: Text(
              StringsManager.register,
              style: StylesManager.textStyleMedium26,
            ),
          )
        ],
      ),
    );
  }
}
