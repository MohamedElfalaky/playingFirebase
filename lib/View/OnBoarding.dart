// import 'dart:async';
// import 'dart:math';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:voom_task/Shared/Button.dart';
// import 'package:voom_task/View/AppMain.dart';
// import 'package:voom_task/helpers/cache_helper.dart';
// import 'package:voom_task/helpers/my_application.dart';
// import 'package:voom_task/style/icons_file.dart';

// class OnBoarding extends StatefulWidget {
//   const OnBoarding({super.key});

//   @override
//   State<OnBoarding> createState() => _OnBoardingState();
// }

// class _OnBoardingState extends State<OnBoarding> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController otpController = TextEditingController();

//   final controller = PageController(initialPage: 0);
//   int _currentPage = 0;
//   Timer? _timer;
//   int myState = 0;
//   Random random = Random();
//   late int OTP;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
//       if (_currentPage < 2) {
//         _currentPage++;
//       } else {
//         _currentPage = 0;
//       }

//       controller.animateToPage(
//         _currentPage,
//         duration: const Duration(milliseconds: 350),
//         curve: Curves.easeIn,
//       );
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _timer!.cancel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Column(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   color: const Color(0XFFF4F4F4),
//                   height: MediaQuery.of(context).size.height * 0.55,
//                   width: MediaQuery.of(context).size.width * 1,
//                   child: PageView(
//                     controller: controller,
//                     children: [
//                       buildBlur(
//                         child: Column(
//                           // mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 decoration: const BoxDecoration(
//                                   color: Color(0XFFF4F4F4),
//                                 ),
//                                 // color: Color(0XFFFFFFFF),
//                                 child: Center(
//                                   child: Lottie.asset(onBording1),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               decoration: const BoxDecoration(
//                                   color: Color(0xFFFFFFFF),
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(30),
//                                       topRight: Radius.circular(30))),
//                               padding: const EdgeInsets.only(top: 20),
//                               child: Column(
//                                 children: [
//                                   const Text(
//                                     "Find your car",
//                                     style: TextStyle(
//                                         color: Color(0xFFDC8035),
//                                         fontSize: 24,
//                                         fontFamily: "Tajawal"),
//                                   ),
//                                   SizedBox(
//                                     height: MediaQuery.of(context).size.height *
//                                         0.02,
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.symmetric(
//                                         horizontal:
//                                             MediaQuery.of(context).size.width *
//                                                 16 /
//                                                 375),
//                                     child: const Text(
//                                       textAlign: TextAlign.center,
//                                       "Through  VOOM application, you can search for a car, by many different auctions",
//                                       style: TextStyle(
//                                           fontSize: 14, fontFamily: "Tajawal"),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: MediaQuery.of(context).size.height *
//                                         0.02,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       buildBlur(
//                         child: Column(
//                           // mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: const Color(0XFFF4F4F4),
//                                     borderRadius: BorderRadius.circular(30)),
//                                 // color: Color(0XFFFFFFFF),
//                                 child: Center(child: Lottie.asset(onBording2)),
//                               ),
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.02,
//                             ),
//                             Container(
//                               decoration: const BoxDecoration(
//                                   color: Color(0xFFFFFFFF),
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(30),
//                                       topRight: Radius.circular(30))),
//                               padding: const EdgeInsets.only(top: 20),
//                               child: Column(
//                                 children: [
//                                   const Text(
//                                     "Earn your car",
//                                     style: TextStyle(
//                                         fontFamily: "Tajawal",
//                                         color: Color(0xFFDC8035),
//                                         fontSize: 24),
//                                   ),
//                                   SizedBox(
//                                     height: MediaQuery.of(context).size.height *
//                                         0.02,
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.symmetric(
//                                         horizontal:
//                                             MediaQuery.of(context).size.width *
//                                                 16 /
//                                                 375),
//                                     child: const Text(
//                                       textAlign: TextAlign.center,
//                                       "Through  VOOM application, you can guarantee the car you got from the auction",
//                                       style: TextStyle(
//                                           fontSize: 14, fontFamily: "Tajawal"),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: MediaQuery.of(context).size.height *
//                                         0.02,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       buildBlur(
//                         child: Column(
//                           // mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: const Color(0XFFF4F4F4),
//                                     borderRadius: BorderRadius.circular(30)),
//                                 // color: Color(0XFFFFFFFF),
//                                 child: Center(child: Lottie.asset(onBording3)),
//                               ),
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.02,
//                             ),
//                             Container(
//                               decoration: const BoxDecoration(
//                                   color: Color(0xFFFFFFFF),
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(30),
//                                       topRight: Radius.circular(30))),
//                               padding: const EdgeInsets.only(top: 20),
//                               child: Column(
//                                 children: [
//                                   const Text(
//                                     "Find your car",
//                                     style: TextStyle(
//                                         fontFamily: "Tajawal",
//                                         color: Color(0xFFDC8035),
//                                         fontSize: 24),
//                                   ),
//                                   SizedBox(
//                                     height: MediaQuery.of(context).size.height *
//                                         0.02,
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.symmetric(
//                                         horizontal:
//                                             MediaQuery.of(context).size.width *
//                                                 16 /
//                                                 375),
//                                     child: const Text(
//                                       textAlign: TextAlign.center,
//                                       "Through  VOOM application, you can search for a car, by many different auctions",
//                                       style: TextStyle(
//                                           fontFamily: "Tajawal", fontSize: 14),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: MediaQuery.of(context).size.height *
//                                         0.02,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   color: const Color(0xFFFFFFFF),
//                   child: Center(
//                     child: SmoothPageIndicator(
//                       controller: controller,
//                       count: 3,
//                       effect: const ExpandingDotsEffect(
//                           spacing: 5, dotWidth: 10, dotHeight: 10),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Expanded(
//               child: Container(
//                 color: const Color(0xFFFFFFFF),
//                 height: MediaQuery.of(context).size.height * 0.3,
//                 width: MediaQuery.of(context).size.width * 1,
//                 padding: EdgeInsets.only(
//                     // top: MediaQuery.of(context).size.height * 40 / 812,
//                     top: MyApplication.hightClc(context, 40),
//                     left: MyApplication.widthClc(context, 32),
//                     right: MediaQuery.of(context).size.width * 32 / 375),
//                 child: Column(
//                   children: [
//                     myButton(() {
//                       OTP = random.nextInt(1000) + 1000;
//                       MyApplication.showToast(
//                           text: "Your OTP is : $OTP", color: Colors.green);
//                       showDialog(
//                         context: context,
//                         builder: (context) => StatefulBuilder(
//                           builder: (context, setState) => AlertDialog(
//                             // title: const Text("Please Enter your name"),
//                             content: Form(
//                               key: _formKey,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 24),
//                                     child: Text("Please Enter your name"),
//                                   ),
//                                   TextFormField(
//                                     controller: nameController,
//                                     autovalidateMode:
//                                         AutovalidateMode.onUserInteraction,
//                                     validator: (value) {
//                                       if (value!.isEmpty)
//                                         return "Please Enter your name";
//                                     },
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 50),
//                                     child: Text("Please Enter OTP"),
//                                   ),
//                                   TextFormField(
//                                     controller: otpController,
//                                     // autovalidateMode:
//                                     //     AutovalidateMode.onUserInteraction,
//                                     validator: (value) {
//                                       if (value!.isEmpty)
//                                         return "Please Enter your OTP";
//                                       else if (value != OTP.toString())
//                                         return "Wrong OTP";
//                                     },
//                                   ),
//                                   const SizedBox(
//                                     height: 12,
//                                   ),
//                                   myState == 0
//                                       ? Center(
//                                           child: myButton(() {
//                                             if (_formKey.currentState!
//                                                 .validate()) {
//                                               setState(() {
//                                                 myState = 1;
//                                               });
//                                               CacheHelper.saveToShared(
//                                                   "name", nameController.text);
//                                               Future.delayed(
//                                                   Duration(seconds: 2), () {
//                                                 setState(() {
//                                                   myState = 0;
//                                                 });
//                                                 MyApplication.navigateToRemove(
//                                                     context, AppMain());
//                                               });
//                                             }
//                                           }, "Log in"),
//                                         )
//                                       : Center(
//                                           child: CircularProgressIndicator())
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     }, "Register"),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 16 / 812,
//                     ),

//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 32 / 812,
//                     ),
//                     // Spacer(),
//                     // Padding(
//                     //   padding: const EdgeInsets.only(bottom: 28),
//                     //   child: AlreadyHaveAccount(() => MyApplication.showToast(
//                     //       text: "you cant sign up ", color: Colors.orange)),
//                     // )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildBlur(
//           {required Widget child, double sigmaX = 10, double sigmaY = 10}) =>
//       ClipRRect(
//         borderRadius: BorderRadius.zero,
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaX),
//           child: child,
//         ),
//       );
// }
