// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:try_firbs/helpers/myApplication.dart';

// class Splash extends StatefulWidget {
//   const Splash({super.key});

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 3), () {
//       myApplication.navigateToReplace(const OnBoarding(), context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Center(
//           child: Lottie.asset(
//             onBording4,
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             fit: BoxFit.cover,
//           ),
//         ),
//         Scaffold(
//             backgroundColor: Colors.transparent,
//             body: Center(
//               child: Image.asset(
//                 logo111,
//                 height: 350,
//               ),
//             )),
//       ],
//     );
//   }
// }
