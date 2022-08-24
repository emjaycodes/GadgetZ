// import 'package:flutter/material.dart';
// import 'package:oga_bassey/screens/welcome.dart';

// import '../../constants.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//    static String id = 'splash_screen';  

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
   

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(image: AssetImage('images/ip.png'),
//                   fit: BoxFit.cover,
//                   )
//             ),
//           ),

//           Positioned(
//             // bottom: 70,
//             child: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(colors: [
//                 Colors.white.withOpacity(0.7),
//                 kprimaryColor,
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               )
//             ),
//           )
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 130),
//                 child: Image.asset('images/logo.png'),
//               )
//             ],
//           )
//         ]
//       )
      
//     );

    
//   }
// }