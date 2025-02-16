import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

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
    desc: desc,
    btnCancelOnPress: () {},
    btnOkOnPress: onConfirm,
    btnCancelText: 'Cancel',
    btnOkText: 'Yes',
  ).show();
}