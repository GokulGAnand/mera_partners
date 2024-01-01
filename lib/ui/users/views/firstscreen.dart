import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class firstscreen extends StatelessWidget {
  const firstscreen({super.key});



  @override
  Widget build(BuildContext context) {
    TextEditingController a= TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: PreferredSize(preferredSize:  const Size.fromHeight(100),
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: SvgPicture.asset('lib/Assets/Vector.svg',height: 15.8,width: 19.36)),
                Container(
                  child:  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 180),
                            child: Row(
                              children: [
                                SvgPicture.asset('lib/Assets/frame.svg'),
                                const Text('Other',style: TextStyle(fontSize: 19)),
                              ],
                            ),
                          ),
                          const Text("sarjapur marathahalli road, kaikondrahalli,…",style: TextStyle(fontSize: 13)),
                        ],

                      ),

                    ],
                  ),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.account_circle_sharp,size: 36)
              ],
            ),

          ),



        ),

      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            Container(
              height: 46,
              width: 356,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 1),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: TextField(
                controller: a,
                decoration:  const InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: 'Search for groceries and more',
                    contentPadding:EdgeInsets.only(left: 16,right: 12,top: 12.5,bottom: 12.5),
                    border: InputBorder.none,
                    suffixIcon:Icon(Icons.search)
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SvgPicture.asset('lib/Assets/instamart.svg'),
                const SizedBox(width: 120),
                const Text('Delivering in',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400)),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 260),
                SvgPicture.asset('lib/Assets/charging.svg'),
               const Text('12 Mins', style: TextStyle(
                   color: Color(0xFF9E1E62),fontSize: 16,fontWeight: FontWeight.w700)),
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            Container(
              height: 1,
              width: 358,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color(0x009e1e62).withOpacity(0.05),
                  const Color(0x009e1e62).withOpacity(0.3)
                ])
              ),
            ),
            const SizedBox(
              height: 31.94,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Column(
                        children: [
                          Text('Late night needs? Our Delivery ',style: TextStyle(color: Color(0xFF1B1E24),fontSize: 13,fontWeight: FontWeight.w200)),
                          Text('Partners have you covered all night.',style: TextStyle(color: Color(0xFF1B1E24),fontSize: 13,fontWeight: FontWeight.w200))
                        ],
                      ),
                      Image.asset('lib/Assets/fb48a1715001322042273e733f25817c.png',width: 144,height: 101.09)
                    ],
                  )
                ],
              ),
            )
            
          ],
        ),
      ),

    );
  }
}
