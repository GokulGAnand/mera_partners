import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class sthre extends StatelessWidget {
  const sthre ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 360),
            child: SvgPicture.asset('lib/Assets/Caret_Left_SM.svg',height: 24,width: 24),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
              height: 218,
              width: 327,
              child: SvgPicture.asset('lib/assets/Car rental-cuate 2.svg')
          ),
          Text('Detailed Inspection \n           Reports',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,fontStyle: FontStyle.normal,color:Color(0xFF000000) ),),
          SizedBox(height: 10),
          Text('Explore our verified inspection reports for \n                  added peace of mind',style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,fontWeight: FontWeight.w500,color:Color(0xFF000000)),),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 153),
            child: Row(
              children: [
                SizedBox(height: 153),
                SvgPicture.asset('lib/assets/Rectangle 1.svg'),
                SizedBox(width: 5),
                SvgPicture.asset('lib/assets/Rectangle 2.svg'),
                SizedBox(width: 5),
                SvgPicture.asset('lib/assets/Rectangle 1.svg'),
                SizedBox(width: 5),
                SvgPicture.asset('lib/assets/Rectangle 1.svg')
              ],
            ),
          ),
          SizedBox(height: 59),
          Column(
            children: [
              Container(
                width: 250,
                height: 52,
                decoration: BoxDecoration(
                    color: Color(0xFF528AFF),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 100),
                    Text('Next',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal,letterSpacing: 0.1,color: Color(0xFFFFFFFF)),),
                    SvgPicture.asset('lib/Assets/Caret_Right_SM.svg',color: Color(0xFFFFFFFF),width: 24,height: 28,)
                  ],
                ),
              ),
            ],
          )
        ],

      ),
    );
  }
}
