import 'package:evaluator_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/colors.dart';

/// ignore: must_be_immutable
class CustomDropDown extends StatelessWidget {
  CustomDropDown( {
    super.key,
    this.hintText,
    this.disabledHint,
    this.value,
    this.label,
    this.items,
    required this.onChanged,
    required this.validator,
    this.onSave,
    this.onClick,
    this.formKey,
  });

  final String? hintText;
  final String? disabledHint;
  var value;
  final String? label;
  final List<DropdownMenuItem>? items;
  final void Function(dynamic)? onChanged;
  final String? Function(dynamic)? validator;
  final void Function(String?)? onSave;
  final VoidCallback? onClick;
  Key? formKey;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: Text(
        hintText!,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: MyColors.blue, overflow: TextOverflow.ellipsis, fontSize: 16, fontWeight: FontWeight.w400),
      ),
      value: value,
      isExpanded: true,
      items: items,
      onChanged: onChanged,
      icon: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8.0, 17, 8),
        child: SvgPicture.asset(MyImages.arrowDown),
      ),
      style: const TextStyle(fontSize: 16, fontFamily: 'Inter', color: MyColors.black, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w400),
      validator: validator,
      disabledHint: disabledHint == null ? null : Text(disabledHint!, overflow: TextOverflow.ellipsis),
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: MyColors.kPrimaryColor, width: 2),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 18.0, 0.0, 18.0),
        label: label == null ? null : Text(label!, style: const TextStyle(color: MyColors.blue, overflow: TextOverflow.ellipsis, fontSize: 16, fontWeight: FontWeight.w400)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
