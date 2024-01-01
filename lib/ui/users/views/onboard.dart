import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboardscreen extends StatefulWidget {
  const Onboardscreen({super.key});

  @override
  State<Onboardscreen> createState() => _OnboardscreenState();
}

class _OnboardscreenState extends State<Onboardscreen> {
  int currentpage=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        // reverse: true,
        physics: const BouncingScrollPhysics(),
        // pageSnapping: false,
        onPageChanged: (index){
          setState(() {
            currentpage=index;
          });
          // row();
        },
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('lib/Assets/4400906_2328124.svg'),
              const Text('Find hotel',style: TextStyle(fontSize: 30)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
                child: Text('look around best hotel around  \n  the city and book them easily ',textAlign: TextAlign.center,),
              ),
              const Row()
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('lib/Assets/4795514_2387778.svg'),
              const Text('Lets travel',style: TextStyle(fontSize: 30)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
                child: Text('All set just pack up dood and  \nmake some mood',textAlign: TextAlign.center,),
              ),
              const Row()

            ],
          ),
        ],
      ),


    );
  }
  Widget row(){
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Add the first icon
        currentpage == 0 ? const Icon(Icons.circle, size: 10, color: Colors.green) : const Icon(Icons.circle_outlined),
        currentpage == 1 ? const Icon(Icons.circle, size: 10, color: Colors.purple) : const Icon(Icons.circle_outlined),


      ],);
  }
}

