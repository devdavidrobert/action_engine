import 'package:action_engine/constants/app_colors.dart';
import 'package:action_engine/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final double btnHeight;
  final double btnWidth;

  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.buttonText,
    required this.btnHeight,
    required this.btnWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: btnHeight,
      width: btnWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            AppColors.buttonBg,
          ),
          foregroundColor: WidgetStateProperty.all<Color>(
            AppColors.buttonTxt,
          ), // Text color
          textStyle: WidgetStateProperty.all<TextStyle>(
            AppFonts.montserratRegular.copyWith(
              color: AppColors.buttonTxt,
            ),
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}

//Alternative button
class CustomElevatedButton2 extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final double btnHeight;
  final double btnWidth;

  const CustomElevatedButton2({
    super.key,
    this.onPressed,
    required this.buttonText,
    required this.btnHeight,
    required this.btnWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: btnHeight,
      width: btnWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          side: WidgetStateProperty.all<BorderSide>(
            const BorderSide(
              color: AppColors.button2Border,
            ),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            AppColors.buttonBg2,
          ),
          foregroundColor: WidgetStateProperty.all<Color>(
            AppColors.buttonTxt,
          ), // Text color
          textStyle: WidgetStateProperty.all<TextStyle>(
            AppFonts.montserratRegular.copyWith(
              color: AppColors.buttonTxt2,
            ),
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}

//Cancellation button
class CustomElevatedCancellationButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final double btnHeight;
  final double btnWidth;

  const CustomElevatedCancellationButton({
    super.key,
    this.onPressed,
    required this.buttonText,
    required this.btnHeight,
    required this.btnWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: btnHeight,
      width: btnWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            AppColors.buttonBgCancel,
          ),
          foregroundColor: WidgetStateProperty.all<Color>(
            AppColors.buttonTxt,
          ), // Text color
          textStyle: WidgetStateProperty.all<TextStyle>(
            AppFonts.montserratRegular.copyWith(
              color: AppColors.buttonTxtCancel,
            ),
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}

//Cancellation button
class CustomElevatedDisabledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final double btnHeight;
  final double btnWidth;

  const CustomElevatedDisabledButton({
    super.key,
    this.onPressed,
    required this.buttonText,
    required this.btnHeight,
    required this.btnWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: btnHeight,
      width: btnWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          side: WidgetStateProperty.all<BorderSide>(
            const BorderSide(
              color: AppColors.button2Border,
            ),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            AppColors.buttonBgDisabled,
          ),
          foregroundColor: WidgetStateProperty.all<Color>(
            AppColors.buttonTxtDisabled,
          ), // Text color
          textStyle: WidgetStateProperty.all<TextStyle>(
            AppFonts.montserratRegular.copyWith(
              color: AppColors.buttonTxtCancel,
            ),
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}
