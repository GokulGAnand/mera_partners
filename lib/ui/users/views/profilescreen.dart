import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class profscreen extends StatelessWidget {
  const profscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              'lib/Assets/Caret_Left_SM.svg',
              height: 24,
              width: 24,
              color: const Color(0xFF528AFF),
            ),
            const Text(
              'Welcome',
              style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF212121),
                  letterSpacing: 0.1),
            ),
            const SizedBox(width: 5),
            const Text(
              'Username',
              style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF212121),
                  letterSpacing: 0.1),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Center(
              child: SvgPicture.asset('lib/Assets/Ellipse 235.svg',
                  height: 88, width: 89)),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: Row(
              children: [
                const SizedBox(width: 20),
                const Text(
                  'User Name',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                      color: Color(0xFF212121)),
                ),
                SvgPicture.asset(
                  'lib/Assets/Wavy_Check.svg',
                  height: 18,
                  width: 17.945,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 160),
                child: Text('Edit Profile',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 0.1,
                        color: Color(0xFF528AFF))),
              )
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Container(
                  height: 48,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFFF2F2F2)),
                  child: Row(
                    children: [
                      Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: const Color(0xFF528AFF), width: 6),
                        ),
                        child: const Center(
                            child: Text(
                          '3',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.1,
                              fontStyle: FontStyle.normal),
                        )),
                      ),
                      const Text('    Participated \n      Auctions')
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                Container(
                  height: 48,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFFF2F2F2)),
                  child: Row(
                    children: [
                      Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: const Color(0xFF528AFF), width: 6),
                        ),
                        child: const Center(
                            child: Text(
                          '2',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.1,
                              fontStyle: FontStyle.normal),
                        )),
                      ),
                      const Text('      Auctions\n          Won')
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 20),
              const Text('Payment Methods',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF000000))),
              const SizedBox(width: 158),
              SvgPicture.asset('lib/Assets/Caret_Right_SM.svg',
                  height: 18, width: 18),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 20),
              Container(
                width: 328,
                height: 1,
                color: const Color(0xFFD9D9D9),
              )
            ],
          ),
          const SizedBox(height: 8.57),
          Row(
            children: [
              const SizedBox(width: 20),
              const Text('Wallet & Transaction',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF000000))),
              const SizedBox(width: 140),
              SvgPicture.asset('lib/Assets/Caret_Right_SM.svg',
                  height: 18, width: 18),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 20),
              Container(
                width: 328,
                height: 1,
                color: const Color(0xFFD9D9D9),
              )
            ],
          ),
          const SizedBox(height: 8.57),
          Row(
            children: [
              const SizedBox(width: 20),
              const Text('Settings',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF000000))),
              const SizedBox(width: 230),
              SvgPicture.asset('lib/Assets/Caret_Right_SM.svg',
                  height: 18, width: 18),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 20),
              Container(
                width: 328,
                height: 1,
                color: const Color(0xFFD9D9D9),
              )
            ],
          ),
          const SizedBox(height: 8.57),
          Row(
            children: [
              const SizedBox(width: 20),
              const Text('Your Activity',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF000000))),
              const SizedBox(width: 197),
              SvgPicture.asset('lib/Assets/Caret_Right_SM.svg',
                  height: 18, width: 18),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 20),
              Container(
                width: 328,
                height: 1,
                color: const Color(0xFFD9D9D9),
              )
            ],
          ),
          const SizedBox(height: 8.57),
          Row(
            children: [
              const SizedBox(width: 20),
              const Text('Registration State Preferences',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF000000))),
              const SizedBox(width: 70),
              SvgPicture.asset('lib/Assets/Caret_Right_SM.svg',
                  height: 18, width: 18),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 20),
              Container(
                width: 328,
                height: 1,
                color: const Color(0xFFD9D9D9),
              )
            ],
          ),
          const SizedBox(height: 8.57),
          Row(
            children: [
              const SizedBox(width: 20),
              const Text('RC Transfer Statement',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF000000))),
              const SizedBox(width: 125),
              SvgPicture.asset('lib/Assets/Caret_Right_SM.svg',
                  height: 18, width: 18),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 20),
              Container(
                width: 328,
                height: 1,
                color: const Color(0xFFD9D9D9),
              )
            ],
          ),
          const SizedBox(height: 8.57),
          Row(
            children: [
              const SizedBox(width: 20),
              const Text('Logout',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF000000))),
              const SizedBox(width: 240),
              SvgPicture.asset('lib/Assets/Caret_Right_SM.svg',
                  height: 18, width: 18),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 20),
              Container(
                width: 328,
                height: 1,
                color: const Color(0xFFD9D9D9),
              )
            ],
          ),
          const SizedBox(height: 8.57),
          Row(
            children: [
              const SizedBox(width: 20),
              const Text('Help & Support',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF528AFF))),
              const SizedBox(width: 180),
              SvgPicture.asset('lib/Assets/Caret_Right_SM.svg',
                  height: 18, width: 18),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 20),
              Container(
                width: 328,
                height: 1,
                color: const Color(0xFFD9D9D9),
              )
            ],
          ),
        ],
      ),
    );
  }
}
