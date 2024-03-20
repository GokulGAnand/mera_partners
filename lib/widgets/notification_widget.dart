import 'package:flutter/material.dart';

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
    this.titleColor = Colors.grey,
    this.subtitleColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(image ?? ''),
          ),
          const SizedBox(width:Dimens.standard_8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: titleColor,
                  ),
                ),
                SizedBox(height: Dimens.standard_4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: subtitleColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
