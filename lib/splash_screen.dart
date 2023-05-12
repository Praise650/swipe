// import 'package:flutter/material.dart';
// import 'package:swipe/app/res.dart';
// import 'package:swipe/homepage.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(
//       const Duration(seconds: 2),
//       () => Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const MyHomePage(),
//       ),
//     ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Center(
//         child: Image.asset(
//           AppImages.logo,
//         ),
//       ),
//     );
//   }
// }
