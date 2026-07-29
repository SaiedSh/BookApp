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
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Text(
            name,
            style: TextStyle(
                fontSize: 12, color: primaryColor, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
