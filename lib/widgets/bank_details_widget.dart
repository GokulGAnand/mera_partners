import 'package:mera_partners/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as clipboard;
import '../utils/colors.dart';
import '../utils/dimens.dart';
import 'custom_toast.dart';

class BankDetailWidget extends StatelessWidget {
  final String? label;
  final String? value;
  const BankDetailWidget({
    super.key,
    this.label,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label',
            style: MyStyles.black12500,
          ),
          SizedBox(height: Dimens.standard_6),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: MyColors.lightBlue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: Dimens.standard_16),
                    Expanded(
                      child: Text('$value',style: MyStyles.pageTitleStyle),
                    ),
                    IconButton(
                      iconSize: 20,
                      onPressed: () {
                        clipboard.Clipboard.setData(clipboard.ClipboardData(text: '$value'));
                        CustomToast.instance.showMsg('Text copied to clipboard');
                      },
                      icon: const Icon(
                        Icons.copy_rounded,
                        color: MyColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
