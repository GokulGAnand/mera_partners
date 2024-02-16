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
      title: Text(title ?? '',style: MyStyles.cardTitleStyleBlue),
      actions: [
        TextButton(onPressed: cancelFun, child: const Text(MyStrings.cancel),),
        TextButton(onPressed: okFun, child: const Text(MyStrings.ok),),
      ],
    );
  }
}

