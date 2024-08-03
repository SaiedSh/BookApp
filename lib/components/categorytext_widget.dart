import 'package:bookapp/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTextCard extends StatelessWidget {
  final String name;
  const CategoryTextCard({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: secondaryColor, width: 1),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8)),
      width: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: GoogleFonts.notoSansArabic(
                  fontSize: 14,
                  color: primaryColor,
                  fontWeight: FontWeight.w500),
            ),
            Icon(
              Icons.arrow_forward,
              color: primaryColor,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
