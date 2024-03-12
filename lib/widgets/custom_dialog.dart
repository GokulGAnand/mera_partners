import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String? title;
  final VoidCallback? okFun;
  final VoidCallback? cancelFun;
  const CustomDialog({super.key, this.title, this.okFun, this.cancelFun});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? '',style: MyStyles.pageTitleStyle,),
      actions: [
        TextButton(onPressed: okFun, child: Text(MyStrings.cont.toUpperCase()),),
        TextButton(onPressed: cancelFun, child: Text(MyStrings.cancel.toUpperCase(),style: const TextStyle(color: MyColors.grey),),),
      ],
    );
  }
}

