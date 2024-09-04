import 'package:action_engine/constants/app_fonts.dart';
import 'package:action_engine/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Center(
            child: Text(
          'An error occurred',
          style: AppFonts.montserratBoldHeader,
        )),
        content: SizedBox(
            height: 20.0,
            child: Center(
                child: Text(
              text,
              style: AppFonts.montserratRegular,
            ))),
        actions: [
          CustomElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            buttonText: 'OK',
            btnHeight: 40,
            btnWidth: 300,
          ),
        ],
      );
    },
  );
}
