import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Thirds extends StatelessWidget {
  const Thirds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Padding(
         padding: const EdgeInsets.only(left: 40),
         child: ListView(
           children: [
             const SizedBox(height: 50),
            TimelineTile(
              //first
              isFirst: true,
              beforeLineStyle: const LineStyle(color: Colors.green),
              indicatorStyle: IndicatorStyle(color: Colors.green,width: 24,iconStyle: IconStyle(color: Colors.white,iconData: Icons.check)),

               // endChild: Padding(
               //    padding: const EdgeInsets.symmetric(horizontal: 8.0),
               //    child: Text('hikhk'),
               //  ),

            ),


             TimelineTile(
               indicatorStyle: const IndicatorStyle(color: Colors.grey,width: 24),

               //second
             ),
              TimelineTile(
                indicatorStyle: const IndicatorStyle(color: Colors.grey,width: 24),
                //third
              ),
             TimelineTile(
               indicatorStyle: const IndicatorStyle(color: Colors.grey,width: 24),
               //fourth
             ),
             TimelineTile(
               indicatorStyle: const IndicatorStyle(color: Colors.grey,width: 24),
               isLast: true,
               //fifth
             ),

           ],

         ),
       ),

    );
  }
}
