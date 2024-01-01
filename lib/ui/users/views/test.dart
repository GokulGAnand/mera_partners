import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timeline_tile/timeline_tile.dart';

class jj extends StatelessWidget {
  const jj({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: 27,
              width: 97,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0x528AFF1F).withOpacity(0.12),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Text(
                    'New Delhi',
                    style: TextStyle(
                        color: Color(0xFF528AFF),
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset('lib/Assets/Map_Pin.svg',
                      height: 16, width: 16),
                ],
              ),
            ),
            const Spacer(),
            const SizedBox(width: 10),
            SvgPicture.asset('lib/Assets/Search_Magnifying_Glass.svg',
                height: 24, width: 24),
            const SizedBox(width: 16),
            SvgPicture.asset('lib/Assets/Bell.svg', height: 24, width: 24)
          ],
        ),
      ),
      body: Column(children: [
        Container(
          width: 392,
          height: 45,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0x00345599).withOpacity(0.35))),
          child: const Row(
            children: [
              SizedBox(width: 17),
              Text('User Status:',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal)),
              SizedBox(width: 5),
              Text('Unapproved',
                  style: TextStyle(
                      color: Color(0xFF528AFF),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal))
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.only(right: 120),
                child: Text('Upload these documents to complete',
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.1)),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 72),
                child: Text('registration and access all the features of the',
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.1)),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 330),
                child: Text('app.',
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.1)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23),
                child: TimelineTile(
                  isFirst: true,
                  beforeLineStyle: const LineStyle(color: Colors.green),
                  indicatorStyle: IndicatorStyle(
                      width: 24,
                      height: 24,
                      color: Colors.green,
                      iconStyle: IconStyle(
                          iconData: Icons.check, color: Colors.white)),
                  endChild: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('PAN Card',
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 14,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.1)),
                          ],
                        ),
                        const SizedBox(width: 70),
                        Container(
                          height: 27,
                          width: 88,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF53BE00).withOpacity(0.12)),
                          child: const Center(
                              child: Text(
                            'UPLOADED',
                            style: TextStyle(
                                color: Color(0xFF53BE00),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.1),
                          )),
                        ),
                        SvgPicture.asset(
                          'lib/Assets/Check2.svg',
                          width: 16,
                          height: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23),
                child: TimelineTile(
                  endChild: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('ADDRESS PROOF',
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 14,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.1)),
                            const SizedBox(width: 4),
                            SvgPicture.asset('lib/Assets/Info.svg',
                                height: 16, width: 16)
                          ],
                        ),
                        Container(
                          height: 27,
                          width: 88,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF528AFF).withOpacity(0.12)),
                          child: const Center(
                              child: Text(
                            'UPLOADED',
                            style: TextStyle(
                                color: Color(0xFF528AFF),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.1),
                          )),
                        ),
                        SvgPicture.asset('lib/Assets/Clock.svg')
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23),
                child: TimelineTile(
                  endChild: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('DEALERSHIP PROOF',
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 14,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.1))
                          ],
                        ),
                        Container(
                          height: 27,
                          width: 88,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF528AFF).withOpacity(0.12)),
                          child: const Center(
                              child: Text(
                            'UPLOADED',
                            style: TextStyle(
                                color: Color(0xFF528AFF),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.1),
                          )),
                        ),
                        SvgPicture.asset('lib/Assets/Clock.svg')
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23),
                child: TimelineTile(
                  endChild: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('SELFIE',
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 14,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.1))
                          ],
                        ),
                        const SizedBox(width: 70),
                        Container(
                          height: 27,
                          width: 88,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF528AFF).withOpacity(0.12)),
                          child: const Center(
                              child: Text(
                            'UPLOADED',
                            style: TextStyle(
                                color: Color(0xFF528AFF),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.1),
                          )),
                        ),
                        SvgPicture.asset('lib/Assets/Clock.svg')
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23),
                child: TimelineTile(
                  isLast: true,
                  endChild: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('BUSINESS PROOF',
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 14,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.1)),
                            const SizedBox(width: 4),
                            SvgPicture.asset('lib/Assets/Info.svg',
                                height: 16, width: 16)
                          ],
                        ),
                        Container(
                          height: 27,
                          width: 88,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF528AFF).withOpacity(0.12)),
                          child: const Center(
                              child: Text(
                            'UPLOADED',
                            style: TextStyle(
                                color: Color(0xFF528AFF),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.1),
                          )),
                        ),
                        SvgPicture.asset('lib/Assets/Clock.svg')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
