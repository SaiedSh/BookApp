import 'package:bookapp/controller/provider/category_product_state.dart';
import 'package:bookapp/init_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => CategoryState(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProductsState(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitScreen(),
    );
  }
}
