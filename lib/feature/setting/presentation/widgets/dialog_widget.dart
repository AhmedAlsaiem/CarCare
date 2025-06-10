import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';

void showConfirmationDialog({
  required BuildContext context,
  required String title,
  required String desc,
  required String snackbarText,
  required VoidCallback onConfirm,
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.scale,
    title: title,
    btnCancelColor: ColorsManager.mainColor,
    desc: desc,
    btnCancelOnPress: () {},
    btnOkOnPress: onConfirm,
    btnCancelText: StringsManager.cancle,
    btnOkText: StringsManager.yes,
    barrierColor: Colors.grey.withAlpha(50),
    btnOkColor: const Color.fromARGB(255, 203, 34, 21),
  ).show();
}
