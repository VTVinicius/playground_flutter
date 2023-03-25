import 'package:flutter/material.dart';
import 'package:playground_flutter/uikit/theme/app_colors.dart';

class OptionsCustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final String text;

  OptionsCustomButton({
    required this.onPressed,
    this.buttonColor = AppColors.greenFeatures,
    this.textColor = AppColors.greenFeaturesDark,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
