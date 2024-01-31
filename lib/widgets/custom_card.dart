import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/dimens.dart';

class CustomCard extends StatelessWidget{

  const CustomCard({super.key, required this.label,required this.icon, required this.onPressed});

  final String label;
  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
            color: MyColors.blue,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // const SizedBox(height: 15,),
              Container(
                width: Dimens.standard_72,
                height: Dimens.standard_72,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColors.white
                ),
                child: Center(child: SvgPicture.asset(icon)),
              ),
              const SizedBox(height: 17,),
              Text(label,textAlign: TextAlign.center,style: MyStyles.cardTitleStyle,),

            ],
          ),
        ),
      ),
    );
  }

}