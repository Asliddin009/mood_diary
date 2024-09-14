import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.onPressed,
    required this.text,
    required this.loading,
    super.key,
    this.buttonStyle,
    this.height = 50,
    this.width = 350,
    this.isDisabled = false,
  });
  final bool isDisabled;
  final VoidCallback onPressed;
  final String text;
  final ButtonStyle? buttonStyle;
  final double height;
  final double width;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: buttonStyle ??
              ButtonStyle(
                backgroundColor: isDisabled
                    ? WidgetStateProperty.all(Colors.grey)
                    : WidgetStateProperty.all(Colors.orange),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
          child: loading
              ? const Padding(
                  padding: EdgeInsets.all(5),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
