import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class userscreen extends StatefulWidget {
  const userscreen({super.key});

  @override
  State<userscreen> createState() => _userscreenState();
}

class _userscreenState extends State<userscreen> {
  TextEditingController a= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
          SvgPicture.asset('lib/Assets/Caret_Left_SM.svg',height: 24,width: 24,color:  const Color(0xFF528AFF),),
            const Text('Welcome',style: TextStyle(fontSize: 16,fontStyle: FontStyle.normal,fontWeight: FontWeight.w400,color: Color(0xFF212121),letterSpacing: 0.1),),
            const SizedBox(width: 5),
            const Text('Username',style: TextStyle(fontSize: 16,fontStyle: FontStyle.normal,fontWeight: FontWeight.w700,color: Color(0xFF212121),letterSpacing: 0.1),)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: SvgPicture.asset('lib/Assets/Ellipse 235.svg',height: 88,width: 89,)),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 120),
              child: Row(
                children: [
                  const Text('Divye Chandna',style: TextStyle(fontSize: 20,fontStyle:FontStyle.normal,fontWeight: FontWeight.w700,letterSpacing: 0.1,color: Color(0xFF212121)),),
                  SvgPicture.asset('lib/Assets/Wavy_Check.svg'),
                ],
              ),
            ),
            const Text('Change Profile picture',style: TextStyle(fontSize: 12,fontStyle: FontStyle.normal,fontWeight: FontWeight.w400,color: Color(0xFF528AFF)),),
            const SizedBox(height: 60),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 220),
                  child: Text('Your name :',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,letterSpacing: 0.1)),
                ),
                SizedBox(
                  height: 46,
                  width: 328,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey,
                        ),
                      ),
                      hintText: "User Name ",hintStyle: const TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Color(0xFF528AFF),letterSpacing: 0.1),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 200),
                  child: Text('Phone number:',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,letterSpacing: 0.1)),
                ),
                SizedBox(
                  height: 46,
                  width: 328,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey,
                        ),
                      ),
                      hintText: "+91 9999999999 ",hintStyle: const TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Color(0xFF528AFF),letterSpacing: 0.1),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(right: 225),
                  child: Text('Your email :',style: TextStyle(fontSize: 18,fontStyle: FontStyle.normal,fontWeight: FontWeight.w400,letterSpacing: 0.1)),
                ),
                SizedBox(
                  height: 46,
                  width: 328,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey,
                        ),
                      ),
                      hintText: "samplemail@keracars.com",hintStyle: const TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Color(0xFF528AFF),letterSpacing: 0.1),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        
                    ),
                  ),
                ),
                const SizedBox(height: 69),
                Container(
                  height: 46,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color(0xFF528AFF),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: const Center(
                    child: Text('SAVE',style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,fontWeight: FontWeight.w700,color: Color(0xFFFFFFFF))),
                  ),
                )

        
        
              ],
            )
        
          ],
        
        ),
      ),



    );
  }
}
