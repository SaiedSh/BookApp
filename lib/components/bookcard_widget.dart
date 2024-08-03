import 'package:bookapp/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class BookCardWidget extends StatelessWidget {
  final String bookImage;
  const BookCardWidget({super.key, required this.bookImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(spreadRadius: 0.1, blurRadius: 4, color: Colors.grey.shade400)
      ], color: thirdColor, borderRadius: BorderRadius.circular(5)),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Container(
                width: 120,
                height: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: AssetImage(bookImage), fit: BoxFit.fill)),
              ),
            ),
            Text(
              'نام کتاب',
              style: GoogleFonts.notoSansArabic(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'نام نویسنده',
              style: GoogleFonts.notoSansArabic(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 100,
              child: RatingBar.builder(
                itemSize: 18,
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textDirection: TextDirection.rtl,
                  ' 98/000 ' + " ت ",
                  style: GoogleFonts.notoSansArabic(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.bookmark_outline,
                    size: 20,
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
