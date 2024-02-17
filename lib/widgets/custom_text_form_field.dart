import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.labelText,
    this.isPwdType = false,
    required this.controller,
    this.maxLines = 1,
    this.minLines = 1,
    this.isEnabled = true,
    this.isReadonly = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.keyboardType = TextInputType.text,
    this.inputFormatter,
    this.prefixIcon,
    this.suffixIcon,
    this.isLast = false,
    this.showSuffix = false,
    this.inputAction = TextInputAction.next,
    this.onChange,
    this.helperText,
    required this.validator,
    this.onSave,
    this.onClick,
    this.fillColor,
    this.borderColor,
    this.labelColor,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.formKey,
    this.cursorColor,
    this.hintTextColor,
    this.labelHeight,
    this.showCursor = true,
    this.focusNode,
    this.labelStyle,
    this.topPadding,
  });

  final String? labelText;
  final bool isPwdType;
  final bool isEnabled;
  final bool isReadonly;
  final String? helperText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final int maxLines;
  final int minLines;
  final bool showSuffix;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final bool isLast;
  final inputFormatter;
  final textCapitalization;
  final TextInputAction inputAction;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  final void Function(String?)? onSave;
  final Widget? prefixIcon;
  final Color? fillColor;
  final Color? borderColor;
  final Color? labelColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? cursorColor;
  final Color? hintTextColor;
  final bool showCursor;
  final double? labelHeight;
  final double? topPadding;
  final void focusNode;

  final Key? formKey;

  final VoidCallback? onClick;

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.showSuffix
            ? const Positioned(
                bottom: 13,
                right: 12,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(
                    Icons.search,
                    color: MyColors.grey,
                  ),
                ),
              )
            : Container(),
        TextFormField(
          key: widget.key,
          style: const TextStyle(color: MyColors.black, fontSize: 16, fontWeight: FontWeight.w400),
          inputFormatters: widget.inputFormatter,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          cursorColor: widget.cursorColor,
          showCursor: widget.showCursor,
          obscureText: widget.isPwdType,
          obscuringCharacter: '*',
          enabled: widget.isEnabled,
          readOnly: widget.isReadonly,
          textCapitalization: widget.textCapitalization,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          textInputAction: widget.inputAction,
          focusNode: myFocusNode,
          onChanged: widget.onChange,
          validator: widget.validator,
          onSaved: widget.onSave,
          onTap: widget.onClick,
          decoration: InputDecoration(
            helperStyle: const TextStyle(color: MyColors.black),
            contentPadding: EdgeInsets.fromLTRB(16.0, widget.topPadding ?? 18.0, 0.0, 18.0),
            hintText: widget.helperText,
            labelText: widget.labelText,
            filled: true,
            fillColor: widget.fillColor ?? MyColors.white,
            hintStyle: TextStyle(color: widget.hintTextColor ?? MyColors.greyMedium, fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400
                // fontSize:10,
                ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.grey),
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            focusColor: MyColors.red,
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: widget.focusedBorderColor ?? MyColors.grey, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: widget.enabledBorderColor ?? MyColors.grey),
            ),
            labelStyle: widget.labelStyle ?? TextStyle(height: widget.labelHeight ?? 0.5, color: widget.labelColor ?? MyColors.blue, fontSize: 15, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}
