import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/dimens.dart';

class CustomElevatedButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String? buttonText;
  final Color? textColor;
  final Color? buttonColor;
  final Color? splashColor;
  final Color? disableColor;
  final double? buttonHeight;
  final double? buttonWidth;
  final Icon? icon;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;

  const CustomElevatedButton({super.key, @required this.onPressed, @required this.buttonText, this.splashColor, this.textColor, this.disableColor, this.buttonColor, this.buttonHeight, this.buttonWidth, this.buttonStyle, this.textStyle, this.icon});

  @override
  _CustomElevatedButtonState createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: widget.buttonWidth ?? size.width * 0.99,
      height: widget.buttonHeight ?? Dimens.standard_53,
      child: ElevatedButton(
        key: widget.key,
        style: widget.buttonStyle ??
            ElevatedButton.styleFrom(
              backgroundColor: MyColors.blue,
              disabledBackgroundColor: widget.disableColor,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            ),
        onPressed: widget.onPressed,
        child: Text(
          widget.buttonText!,
          textAlign: TextAlign.center,
          style: widget.textStyle ?? TextStyle(color: widget.textColor ?? MyColors.white, letterSpacing: Dimens.letterSpacing_34, fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
