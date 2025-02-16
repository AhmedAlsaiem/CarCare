import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/setting/presentation/widgets/dialog_widget.dart';

class MyCarItem extends StatelessWidget {
  const MyCarItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: Appwidth.w16, right: Appwidth.w16 , bottom: AppHeight.h16),
      child: Card(
        color: Colors.grey[190],
        elevation: .5,
        child: Row(
          children: [
            const Icon(
              Icons.car_rental_outlined,
              size: 40,
              color: ColorsManager.mainColor,
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .61,
              child: ListTile(
                title: Text('158-ن خ ن',
                    style: StylesManager.textStyleBold20black),
                subtitle: Text('BYD F3.black',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: StylesManager.textStyleRegular14
                        .copyWith(color: ColorsManager.balck)),
              ),
            ),
            IconButton(
                onPressed: () {
                  showConfirmationDialog(
                    context: context,
                    title: 'Delete Car',
                    desc: 'Are you sure you want to Delete Car?',
                    snackbarText: 'Delete Car successfully!',
                    onConfirm: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: ColorsManager.mainColor,
                          content: Text('Delete Car successfully!'),
                        ),
                      );
                      // NavigatorManager.pushWithReplacement(
                      //   context: context,
                      //   route: AppRoutes.loginView,
                      // );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  size: 34,
                  color: ColorsManager.mainColor,
                ))
          ],
        ),
      ),
    );
  }
}
