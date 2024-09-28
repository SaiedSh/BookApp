import 'package:bookapp/controller/provider/book_detail_state.dart';
import 'package:bookapp/controller/provider/book_list_state.dart';
import 'package:bookapp/controller/provider/book_review_state.dart';
import 'package:bookapp/controller/provider/book_saved_state.dart';
import 'package:bookapp/controller/provider/category_product_state.dart';
import 'package:bookapp/controller/provider/index_items_state.dart';
import 'package:bookapp/controller/provider/profile_state.dart';
import 'package:bookapp/controller/provider/subscriptions_state.dart';
import 'package:bookapp/controller/provider/user_transactions.dart';
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
    ChangeNotifierProvider(
      create: (context) => BookSavedState(),
    ),
    ChangeNotifierProvider(
      create: (context) => BookReviewState(),
    ),
    ChangeNotifierProvider(
      create: (context) => SubscriptionsState(),
    ),
    ChangeNotifierProvider(
      create: (context) => UserTransactionsState(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProfileState(),
    ),
    ChangeNotifierProvider(
      create: (context) => BookListState(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Yekan'),
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
