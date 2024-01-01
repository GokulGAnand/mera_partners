
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_tile/timeline_tile.dart';


class kera extends StatelessWidget {
  const kera({super.key});

  Widget yourCustomTimelineWidget({
    required String title,
    // required Color indicatorColor,
    required String svgAssetPath,
    bool isFirstTimeline = false,
  }) {
     return TimelineTile(

      indicatorStyle: IndicatorStyle(
        color: isFirstTimeline ? const Color(0xFF00FF00) : const Color(0x00345599),
        // color: indicatorColor,
      ),
      alignment: TimelineAlign.manual,
      lineXY: 0.1,

      endChild: Container(
        constraints: const BoxConstraints(
         minWidth: 60
        ),
      // Adjust the color as needed
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
          Row(
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
                      const Text('New Delhi',style: TextStyle(color: Color(0xFF528AFF),fontSize: 10,fontWeight: FontWeight.w700),),
                      const SizedBox(width: 10),
                      SvgPicture.asset('lib/Assets/Map_Pin.svg',height: 16,width: 16),
                    ],
                  ),
                ),
              const Spacer(),
              const SizedBox(width: 10),
              SvgPicture.asset('lib/Assets/Search_Magnifying_Glass.svg',height: 24,width: 24),
              const SizedBox(width: 16),
              SvgPicture.asset('lib/Assets/Bell.svg',height: 24,width: 24)
            ],
          ),
      ),
      body: Column(
        children: [
          Container(
            width: 392,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0x00345599).withOpacity(0.35))
            ),
            child: const Row(
              children: [
                SizedBox(width: 17),
                Text('User Status:',style: TextStyle(color: Color(0xFF000000),fontSize: 14,fontWeight: FontWeight.w400,fontStyle:FontStyle.normal)),
                SizedBox(width:5),
                Text('Unapproved',style: TextStyle(color: Color(0xFF528AFF),fontSize:14,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal))
              ],
            ),
          ),
          Container(
            child: const Column(
              children: [
                SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.only(right: 120),
                  child: Text('Upload these documents to complete',style: TextStyle(color: Color(0xFF000000),fontSize: 14,fontWeight: FontWeight.w400,letterSpacing: 0.1)),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 72),
                  child: Text('registration and access all the features of the',style: TextStyle(color: Color(0xFF000000),fontSize: 14,fontWeight: FontWeight.w400,letterSpacing: 0.1)),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 330),
                  child: Text('app.',style: TextStyle(color: Color(0xFF000000),fontSize: 14,fontWeight: FontWeight.w400,letterSpacing: 0.1)),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: yourCustomTimelineWidget(
              title: 'PAN Card',
              svgAssetPath: 'lib/assets/Check.svg',
              isFirstTimeline: true


            ),
          ),
          // Timeline 2
          yourCustomTimelineWidget(
            title: 'ADDRESS PROOF',
            svgAssetPath: 'lib/Assets/Ellipse 235.svg',



          ),
          yourCustomTimelineWidget(
              title: 'DEALERSHIP PROOF',
              svgAssetPath: 'lib/Assets/Ellipse 235.svg'

          ),
          yourCustomTimelineWidget(
              title: 'SELFIE',
              svgAssetPath: 'lib/Assets/Ellipse 235.svg'

          ),
          yourCustomTimelineWidget(
              title: 'BUSINESS PROOF',
              svgAssetPath: 'lib/Assets/Ellipse 235.svg'

          ),



        ]
      ),
    );
  }
}
