import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(height: 100),
           Padding(
             padding: const EdgeInsets.only(left: 18),
             child: Text('Welcome Back',style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.w700,fontSize: 30,color: Color(0xFF212121),letterSpacing: 0.1),),
           ),
           Padding(
             padding: const EdgeInsets.only(left: 19),
             child: Text('Sign in with your mobile number',style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.w400,fontSize:16,letterSpacing: 0.1,color:Color(0xFF9B9B9B) ),),
           ),
           SizedBox(height: 31),
           Column(
             children: [
               Center(
                 child: Container(
                   height: 60,
                   width: 327,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(100),
                     color:Color(0xFF528AFF).withOpacity(0.08),
                     border:Border.all(color: Color(0xFF528AFF),width: 1.5),
                   ),
                   alignment: Alignment.topLeft,
                   child: Padding(
                     padding: const EdgeInsets.all(15),
                     child: Text('+91 9999 9999 99',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,fontStyle: FontStyle.normal,letterSpacing: 0.1),),
                   ),
                 ),
               ),
               SizedBox(height: 24),
               Container(
                 width: 327,
                 height: 48.571,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(100),
                   color:Color(0xFF528AFF).withOpacity(0.08),
                 ),
                 child: Row(
                   children: [
                     SizedBox(width: 8.97),
                     SvgPicture.asset('lib/assets/Whatsapp.svg',width:  25.921,height:   24.762),
                     SizedBox(width: 7.99),
                     Column(
                       children: [
                         SizedBox(height: 6.67),
                         Padding(
                           padding: const EdgeInsets.only(right: 90),
                           child: Text('Get instant updates',style: TextStyle(fontStyle: FontStyle.normal,fontSize: 14,fontWeight: FontWeight.w700)),
                         ),
                         Text('From Kera Cars on your whatsapp',style: TextStyle(fontStyle: FontStyle.normal,fontSize: 14,fontWeight: FontWeight.w400))
                       ],
                     ),
                     SizedBox(width: 30),
                     SvgPicture.asset('lib/assets/Check_circle.svg',width: 21.933,height: 20.952,)

                   ],
                 ),
               ),
               SizedBox(
                 height: 50.43,
               ),
               Column(
                 children: [
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
                         SvgPicture.asset('lib/Assets/Caret_Right_SM.svg',color: Color(0xFFFFFFFF),width: 24,height: 28,)
                       ],
                     ),
                   ),
                   SizedBox(height: 32),
                   RichText(text: TextSpan(
                     text: 'Don’t have an account?',
                     style: TextStyle(color: Color(0xFF212121)),
                     children: [
                       TextSpan(
                        text: 'Sign up',
                          style: TextStyle(color: Color(0xFF528AFF)),
                       )
                     ]
                   )),
                   SizedBox(height: 164),
                   Container(
                     width: 328,
                     height: 1,
                     color: Color(0xFFFF9B9B9B),
                   ),
                   SizedBox(height: 16),
                   Text('Kera Cars Privacy Policy and Terms & Conditions',style: TextStyle(fontSize: 12,fontStyle: FontStyle.normal,fontWeight: FontWeight.w400,color: Color(0xFF212121)),),
                   SizedBox(height: 8),
                   RichText(text: TextSpan(
                     text: 'Kera Cars NBFC’s ',
                     style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,letterSpacing: 0.1,color: Color(0xFF212121)),
                       children:[
                         TextSpan(
                           text: 'Terms of Use ',
                           style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,fontStyle: FontStyle.normal,letterSpacing: 0.1,color: Color(0xFF212121)),
                           children: [
                             TextSpan(
                               text: 'and',
                               style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,letterSpacing: 0.1,color: Color(0xFF212121)),
                             )
                           ]
                         )
                       ]

                   )),
                   Text('TU CIBIL terms of use', style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,fontStyle: FontStyle.normal,letterSpacing: 0.1,color: Color(0xFF212121)))
                 ],
               )
             ],
           )
         ],
       ),
     ),
    );
  }
}