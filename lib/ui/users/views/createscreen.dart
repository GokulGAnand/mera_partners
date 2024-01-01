import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class create extends StatelessWidget {
  const create({super.key});

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
          SizedBox(height: 57),
          Padding(
            padding: const EdgeInsets.only(right: 70),
            child: Text('Create New Account',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,fontStyle: FontStyle.normal,letterSpacing: 0.1,color: Color(0xFF212121))),
          ),
          Padding(
            padding: const EdgeInsets.only(right:165),
            child: Text('Enter details to continue',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,letterSpacing: 0.1,color: Color(0xFF9B9B9B))),
          ),
          SizedBox(height: 32),
          Center(
            child: Container(
              height: 60,
              width: 327,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color:Color(0xFF528AFF).withOpacity(0.08),
                border:Border.all(color: Color(0xFF528AFF),width: 1.5),
              ),
              child: Row(
                children: [
                  SizedBox(width: 15),
                  SvgPicture.asset('lib/assets/user_2.svg',width: 24,height: 24),
                  SizedBox(width: 12),
                  Text('ProtoSample',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal,color: Color(0xFF212121)))
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 60,
            width: 327,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color:Color(0xFF528AFF).withOpacity(0.08),
              border:Border.all(color: Color(0xFF528AFF),width: 1.5),
            ),
            child: Row(
              children: [
                SizedBox(width: 15),
                SvgPicture.asset('lib/assets/Phone_call.svg',width: 24,height: 24),
                SizedBox(width: 12),
                Text('9999999999',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal,color: Color(0xFF212121)))
              ],
            ),
          ),
          SizedBox(height: 38),
          Container(
            width: 250,
            height: 54,
            decoration: BoxDecoration(
                color: Color(0xFF528AFF),
                borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              children: [
                SizedBox(width: 80),
                Text('Get OTP',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal,letterSpacing: 0.1,color: Color(0xFFFFFFFF)),),
                SvgPicture.asset('lib/Assets/Caret_Right_SM.svg',color: Color(0xFFFFFFFF),width: 24,height: 28)
              ],
            ),
          ),
          SizedBox(height: 32),
          RichText(text: TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,fontWeight: FontWeight.w400,letterSpacing: 0.1,color: Color(0xFF212121)),
              children: [
                TextSpan(
                  text: 'Sign in',
                  style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,fontWeight: FontWeight.w700,letterSpacing: 0.1,color: Color(0xFF528AFF)),
                )
              ]
          )),
        ],
      ),


    );
  }
}
