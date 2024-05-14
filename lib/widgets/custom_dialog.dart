import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final TextStyle? titleStyle;
  final VoidCallback? okFun;
  final VoidCallback? cancelFun;
  const CustomDialog({super.key, this.title, this.okFun, this.cancelFun, this.content, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
      //buttonPadding: EdgeInsets.fromLTRB(0, 10, 27, 0),
      actionsPadding: EdgeInsets.fromLTRB(0, 20, 30, 2),

      title: Text(title ?? '',style: titleStyle ?? MyStyles.pageTitleStyle,),
      content: Text(content ?? '',style: MyStyles.pageTitleStyle,),
      actions: [
        TextButton(onPressed: okFun, child: Text(MyStrings.cont.toUpperCase()),),
        TextButton(onPressed: cancelFun, child: Text(MyStrings.cancel.toUpperCase(),style: const TextStyle(color: MyColors.grey),),),
      ],
    );
  }
}

