import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';

class CategoryTextCard extends StatelessWidget {
  final String name;
  const CategoryTextCard({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              fontSize: 8.5, color: primaryColor, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
