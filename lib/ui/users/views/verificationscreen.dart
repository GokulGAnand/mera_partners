import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class verification extends StatelessWidget {
  const verification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 360),
            child: SvgPicture.asset('lib/Assets/Caret_Left_SM.svg',
                height: 24, width: 24),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('OTP Verification',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.1,
                  color: Color(0xFF212121))),
          Row(
            children: [
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: RichText(
                    text: TextSpan(
                  text: 'We have sent a ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.1,
                      color: Color(0xFF9B9B9B)),
                  children: [
                    TextSpan(
                      text: 'One Time Password',
                      style: TextStyle(color: Color(0xFF528AFF)),
                    ),
                  ],
                )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(' to your mobile number 999****999',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.1,
                    color: Color(0xFF9B9B9B))),
          ),
          SizedBox(height: 12),
          Text('Edit number',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.1,
                  color: Color(0xFF528AFF))),
          Row(
            children: [
              Container(
                height: 62,
                width: 61.893,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10000),
                 color: Color(0x528AFF).withOpacity(0.08)
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
