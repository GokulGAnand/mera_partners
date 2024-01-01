import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import "package:flutter_animate/flutter_animate.dart";

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 285, left: 74),
        child: Column(
          children: [
            Container(
              child: Expanded(
                  child: Image.asset('lib/Assets/splash_logo.png',
                      width: 226, height: 139)),
            ),
            SizedBox(height: 24),
            Text(
              'Your Certified Car Companion, \n            From TeamTech',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFFFF212121)),
            ),
            SizedBox(height: 211),


             Expanded(
               flex: 1,
               child:        Stack(
                 children: [
                   SvgPicture.asset('lib/Assets/circle_1.svg')
                       .animate(
                     autoPlay: true,
                     onPlay: (controller) => controller.repeat(),
                   )
                       .rotate(duration: const Duration(milliseconds: 1200),),
                   SvgPicture.asset('lib/Assets/circle_2.svg')
                       .animate(
                     autoPlay: true,
                     onPlay: (controller) => controller.repeat(),
                   ).rotate(
                       duration: Duration(milliseconds: 1200), begin: 1, end: 0),
                   SvgPicture.asset('lib/Assets/circle_3.svg')
                       .animate(
                     autoPlay: true,
                     onPlay: (controller) => controller.repeat(),
                   )
                       .rotate(
                     duration: Duration(milliseconds: 1200), ),

                 ],

               ),
             )


          ],
        ),
      ),

    );
  }
}
