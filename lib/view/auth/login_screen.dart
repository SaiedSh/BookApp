import 'package:bookapp/controller/api/auth/login_controller_post.dart';
import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:bookapp/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 0.7,
                      ),
                    ),
                    // Container(
                    //   width: 290,
                    //   height: 55,
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           image: AssetImage(
                    //             'lib/assets/images/logo.png',
                    //           ),
                    //           fit: BoxFit.cover)),
                    // ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 0.7,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.white,
                      )),
                  width: MediaQuery.of(context).size.width > 400
                      ? 350
                      : MediaQuery.of(context).size.width - 50,
                  height: 350,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'ورود',
                        style: GoogleFonts.ibmPlexSansArabic(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.indigo)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.indigo)),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              border: OutlineInputBorder(),
                              label: Text(
                                'نام کاربری',
                                style: GoogleFonts.ibmPlexSansArabic(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              )),
                          controller: userName,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.indigo)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.indigo)),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              border: OutlineInputBorder(),
                              label: Text(
                                'رمز عبور',
                                style: GoogleFonts.ibmPlexSansArabic(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              )),
                          controller: password,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        child: RawMaterialButton(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              'ورود',
                              style: GoogleFonts.ibmPlexSansArabic(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          fillColor: Colors.indigo,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: () async {
                            login(
                                    context: context,
                                    dto: LoginDto(
                                        password: password.text,
                                        userName: userName.text))
                                .then((value) {
                              print("Hereleey");
                              Navigator.of(context).pushAndRemoveUntil(
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          const HomeScreen(),
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      transitionsBuilder: (_, a, __, c) =>
                                          FadeTransition(
                                            opacity: a,
                                            child: c,
                                          )),
                                  (route) => false);
                            });
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.grey])),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height),
    );
  }
}
