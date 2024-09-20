import 'package:bookapp/controller/provider/book_detail_state.dart';
import 'package:bookapp/controller/provider/category_product_state.dart';
import 'package:bookapp/controller/provider/index_items_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
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
    ChangeNotifierProvider(
      create: (context) => IndexItemsState(),
    ),
    ChangeNotifierProvider(
      create: (context) => BookDetailState(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Sansation'),
      builder: (context, child) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return CustomError();
        };
        return child!;
      },
      onGenerateRoute: MyRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      home: InitScreen(),
    );
  }
}

class CustomError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
