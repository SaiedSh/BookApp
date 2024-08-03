// import 'package:bookapp/global.dart';
// import 'package:bookapp/view/auth/otp_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginScreen extends StatelessWidget {
//   TextEditingController userName = TextEditingController();
//   TextEditingController password = TextEditingController();

//   LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: Container(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 100),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           color: primaryColor,
//                           thickness: 1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 50),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           color: primaryColor,
//                           thickness: 1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: textsColor,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   width: MediaQuery.of(context).size.width > 400
//                       ? 350
//                       : MediaQuery.of(context).size.width - 50,
//                   height: 350,
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 40,
//                       ),
//                       Text(
//                         'ورود',
//                         style: GoogleFonts.ibmPlexSansArabic(
//                           fontWeight: FontWeight.bold,
//                           color: primaryColor,
//                           fontSize: 25,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 50,
//                       ),
//                       SizedBox(
//                         width: 200,
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                               focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: primaryColor)),
//                               enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: primaryColor)),
//                               floatingLabelAlignment:
//                                   FloatingLabelAlignment.center,
//                               border: OutlineInputBorder(),
//                               label: Center(
//                                 child: Text(
//                                   'شماره موبایل',
//                                   style: GoogleFonts.ibmPlexSansArabic(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                       color: primaryColor),
//                                 ),
//                               )),
//                           controller: userName,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 80,
//                       ),
//                       // SizedBox(
//                       //   width: 200,
//                       //   child: TextFormField(
//                       //     decoration: InputDecoration(
//                       //         focusedBorder: OutlineInputBorder(
//                       //             borderSide: BorderSide(color: Colors.white)),
//                       //         enabledBorder: OutlineInputBorder(
//                       //             borderSide: BorderSide(color: Colors.white)),
//                       //         floatingLabelAlignment:
//                       //             FloatingLabelAlignment.center,
//                       //         border: OutlineInputBorder(),
//                       //         label: Text(
//                       //           'رمز عبور',
//                       //           style: GoogleFonts.ibmPlexSansArabic(
//                       //               fontSize: 14,
//                       //               fontWeight: FontWeight.bold,
//                       //               color: Colors.white),
//                       //         )),
//                       //     controller: password,
//                       //   ),
//                       // ),

//                       SizedBox(
//                         child: RawMaterialButton(
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 5),
//                             child: Text(
//                               'ورود',
//                               style: GoogleFonts.ibmPlexSansArabic(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: textsColor),
//                             ),
//                           ),
//                           fillColor: primaryColor,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5),
//                               side: BorderSide(color: thirdColor, width: 0.1)),
//                           onPressed: () async {
//                             Navigator.of(context).pushAndRemoveUntil(
//                                 PageRouteBuilder(
//                                     pageBuilder: (_, __, ___) => OtpScreen(),
//                                     transitionDuration:
//                                         const Duration(milliseconds: 500),
//                                     transitionsBuilder: (_, a, __, c) =>
//                                         FadeTransition(
//                                           opacity: a,
//                                           child: c,
//                                         )),
//                                 (route) => false);
//                             // login(
//                             //         context: context,
//                             //         dto: LoginDto(
//                             //             password: password.text,
//                             //             userName: userName.text))
//                             //     .then((value) {
//                             //   print("Hereleey");
//                             //   Navigator.of(context).pushAndRemoveUntil(
//                             //       PageRouteBuilder(
//                             //           pageBuilder: (_, __, ___) =>
//                             //               const HomeScreen(),
//                             //           transitionDuration:
//                             //               const Duration(milliseconds: 500),
//                             //           transitionsBuilder: (_, a, __, c) =>
//                             //               FadeTransition(
//                             //                 opacity: a,
//                             //                 child: c,
//                             //               )),
//                             //       (route) => false);
//                             // });
//                           },
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 50),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           color: primaryColor,
//                           thickness: 1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 100),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           color: primaryColor,
//                           thickness: 1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           decoration: BoxDecoration(),
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height),
//     );
//   }
// }
