// import 'package:flutter/material.dart';
// import 'dart:math';
// import '../utils/colors.dart';
// import '../utils/images.dart';
//
// class CustomLoader extends StatefulWidget {
//   final Color? color1;
//
//   const CustomLoader({super.key, this.color1 = MyColors.kPrimaryColor});
//
//   @override
//   ColorLoader2State createState() => ColorLoader2State();
// }
//
// class ColorLoader2State extends State<CustomLoader> with TickerProviderStateMixin {
//   Animation<double>? animation1;
//   AnimationController? controller1;
//
//   @override
//   void initState() {
//     super.initState();
//
//     controller1 = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this);
//
//     animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller1!, curve: const Interval(0.0, 1.0, curve: Curves.linear)));
//
//     controller1!.repeat();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Stack(
//         children: <Widget>[
//           CircleAvatar(
//               radius: 25,
//               backgroundColor: MyColors.white,
//               child: Image.asset(
//                 MyImages.logo,
//                 width: 40,
//                 height: 40,
//               )),
//           RotationTransition(
//             turns: animation1!,
//             child: CustomPaint(
//               painter: Arc1Painter(widget.color1!),
//               child: const SizedBox(
//                 width: 50.0,
//                 height: 50.0,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     controller1!.dispose();
//     super.dispose();
//   }
// }
//
// class Arc1Painter extends CustomPainter {
//   final Color color;
//
//   Arc1Painter(this.color);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint p1 = Paint()
//       ..color = color
//       ..strokeWidth = 4.0
//       ..strokeCap = StrokeCap.round
//       ..style = PaintingStyle.stroke;
//
//     Rect rect1 = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
//
//     canvas.drawArc(rect1, 0.0, 0.3 * pi, false, p1);
//     canvas.drawArc(rect1, 0.6 * pi, 0.3 * pi, false, p1);
//     canvas.drawArc(rect1, 1.3 * pi, 0.3 * pi, false, p1);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(MyColors.kPrimaryColor),
      ),
    );
  }
}
