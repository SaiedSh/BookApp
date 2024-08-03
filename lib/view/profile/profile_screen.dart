import 'package:bookapp/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop(
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => ProfileScreen(),
                        transitionDuration: const Duration(milliseconds: 500),
                        transitionsBuilder: (_, a, __, c) => FadeTransition(
                              opacity: a,
                              child: c,
                            )),
                  );
                },
                child: Icon(
                  Icons.forward,
                  color: thirdColor,
                  size: 35,
                ),
              ),
            )
          ],
          automaticallyImplyLeading: false,
          backgroundColor: secondaryColor,
        ),
        backgroundColor: secondaryColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.person,
                    color: secondaryColor,
                    size: 60,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: textsColor,
                      border: Border.all(color: Colors.white, width: 2)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'نام کاربری',
                  style: GoogleFonts.notoSansArabic(
                      fontWeight: FontWeight.bold,
                      color: textsColor,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'وضعیت اشتراک : ',
                          style: GoogleFonts.notoSansArabic(
                              fontWeight: FontWeight.bold,
                              color: textsColor,
                              fontSize: 14),
                        ),
                        Text(
                          'غیرفعال',
                          style: GoogleFonts.notoSansArabic(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'مدت زمان باقی مانده : ',
                          style: GoogleFonts.notoSansArabic(
                              fontWeight: FontWeight.bold,
                              color: textsColor,
                              fontSize: 14),
                        ),
                        Text(
                          '00/00/00',
                          style: GoogleFonts.notoSansArabic(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    height: 40,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                  ),
                ),
                Text(
                  ' کتاب های ذخیره شده ',
                  style: GoogleFonts.notoSansArabic(
                      fontWeight: FontWeight.bold,
                      color: textsColor,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 20,
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height - 100,
                //   width: MediaQuery.of(context).size.width - 10,
                //   child: AnimationLimiter(
                //     child: GridView.count(
                //       shrinkWrap: true,
                //       childAspectRatio: 0.6,
                //       crossAxisCount: 2,
                //       children: List.generate(
                //         2,
                //         (int index) {
                //           return AnimationConfiguration.staggeredGrid(
                //             position: index,
                //             duration: const Duration(milliseconds: 375),
                //             columnCount: 2,
                //             child: ScaleAnimation(
                //               child: FadeInAnimation(
                //                 child: Padding(
                //                   padding: const EdgeInsets.all(8.0),
                //                   child: BookCardWidget(),
                //                 ),
                //               ),
                //             ),
                //           );
                //         },
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
