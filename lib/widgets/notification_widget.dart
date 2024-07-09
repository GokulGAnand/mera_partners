import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mera_partners/utils/images.dart';
import 'package:mera_partners/utils/styles.dart';
import '../utils/colors.dart';
import '../utils/dimens.dart';

class NotificationWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final Color titleColor;
  final Color subtitleColor;

   const NotificationWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.titleColor = MyColors.grey,
    this.subtitleColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0,8,8,8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (image.isNotEmpty && (image.startsWith('http') || image.startsWith('https')))
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: MyColors.lightBlue,
                borderRadius: BorderRadius.circular(35),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            )
          else if (title.isNotEmpty || subtitle.isNotEmpty)
            CircleAvatar(
              radius: 20,
              child: SvgPicture.asset(MyImages.notification1),
            ),
          if (title.isNotEmpty || subtitle.isNotEmpty) ...[
            const SizedBox(width: Dimens.standard_8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: MyStyles.grey12400,
                  ),
                  SizedBox(height: Dimens.standard_4),
                  Text(
                    subtitle,
                    style: MyStyles.greyShade14500,
                  ),
                ],
              ),
            ),
          ],
        ],
      )
    );
  }
}
