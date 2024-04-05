import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../widgets/liked_cars_widget.dart';

class LikedCars extends StatelessWidget {
  const LikedCars({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Expanded(
          child: GridView.builder(
              itemCount: 3,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 22,
                mainAxisSpacing: 18,
                mainAxisExtent: 315,
              ),
              itemBuilder: (context, index) {
               return const LikedCarsWidget(
                 bidAmount: '650000',
                 id: '73423642 ',
                 imageUrl: '',
                 model: '110 PS RXZ 4X2 AMT',
                 name: '2016 Duster',
                 status: 'Live',
               );
              }),
        ),
      ],
    );
  }
}
