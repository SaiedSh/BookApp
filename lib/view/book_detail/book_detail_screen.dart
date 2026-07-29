import 'package:bookapp/controller/api/book/add_save_book.dart';
import 'package:bookapp/controller/api/book/book_detail.dart';
import 'package:bookapp/controller/api/payment/shop_card/buy_book.dart';
import 'package:bookapp/controller/api/payment/shop_card/get_shopcard_list.dart';
import 'package:bookapp/controller/provider/book_detail_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/api/generated/tikonline.enums.swagger.dart';
import 'package:bookapp/model/components/categorytext_widget.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class BookDetailScreen extends StatefulWidget {
  final String bookId;
  const BookDetailScreen({super.key, required this.bookId});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shopCardVisible = true;
    shopCardPhisicalVisible = true;
    getBookDetails(context: context, bookId: widget.bookId).then(
      (value) {
        saveVisible = BookDetailState.bookDetail!.like!;
      },
    );
  }

  bool descVisible = false;
  bool shopCardVisible = true;
  bool loadingVisible = true;
  bool shopCardPhisicalVisible = true;
  bool loadingPhisicalVisible = true;
  double _rating = 3.0;
  bool saveVisible = true;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: backgroundColor,
              flexibleSpace: Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, MyRoutes.profileScreen);
                                      },
                                      icon: Image(
                                        image: AssetImage(
                                            'lib/assets/images/miniicon.png'),
                                        width: 15,
                                      )),
                                  SizedBox(
                                    height: 20,
                                    width: 1,
                                    child: VerticalDivider(),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, MyRoutes.shopCardScreen);
                                      },
                                      icon: Image(
                                        image: AssetImage(
                                            'lib/assets/images/handbag.png'),
                                        width: 15,
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Consumer<BookDetailState>(
                                    builder: (context, value, child) => Text(
                                      textDirection: TextDirection.rtl,
                                      BookDetailState.bookDetail!.title
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      context.read<BookDetailState>().reset();
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              )
                              // Image(
                              //   image: AssetImage(
                              //       'lib/assets/images/logo.png'),
                              //   width: 70,
                              // )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
        backgroundColor: backgroundColor,
        body: Consumer<BookDetailState>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        errorBuilder: (BuildContext context,
                                            Object error,
                                            StackTrace? stackTrace) {
                                          return Center(
                                            child: Text(
                                              'تصویر بارگذاری نشد',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey),
                                            ),
                                          );
                                        },
                                        fit: BoxFit.fill,
                                        BookDetailState.bookDetail!.imageUrl
                                            .toString(),
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            // تصویر لود شده است
                                            return child;
                                          }
                                          // تصویر هنوز در حال لود است
                                          return CircularProgressIndicator(
                                            strokeWidth: 1,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 50),
                                    child: SizedBox(
                                      height: 100,
                                      child: Column(
                                        children: [
                                          Image(
                                            height: 30,
                                            image: AssetImage(
                                                'lib/assets/images/share.png'),
                                            width: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Visibility(
                                            visible: saveVisible,
                                            replacement: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  saveVisible = !saveVisible;
                                                });
                                                addBookSave(
                                                    context: context,
                                                    bookId: BookDetailState
                                                        .bookDetail!.id,
                                                    st: SaveType.like);
                                              },
                                              child: Container(
                                                child: Icon(Icons.bookmark),
                                                height: 28,
                                                width: 29,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7)),
                                              ),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  saveVisible = !saveVisible;
                                                });
                                                addBookSave(
                                                    context: context,
                                                    bookId: BookDetailState
                                                        .bookDetail!.id,
                                                    st: SaveType.like);
                                              },
                                              child: Image(
                                                height: 28,
                                                image: AssetImage(
                                                    'lib/assets/images/save.png'),
                                                width: 30,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    BookDetailState.bookDetail!.title
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'نویسنده / نویسندگان : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    BookDetailState.bookDetail!.nevisande
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'مترجم / مترجمین : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    BookDetailState.bookDetail!.motarjem != null
                                        ? BookDetailState.bookDetail!.motarjem
                                            .toString()
                                        : "...",
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'مولف / مولفین : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    BookDetailState.bookDetail!.entesharat !=
                                            null
                                        ? BookDetailState.bookDetail!.entesharat
                                            .toString()
                                        : "...",
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Icon(
                                          Icons.star,
                                          size: 18,
                                          color: Colors.amber,
                                        ),
                                      ),
                                      Text(
                                        "${BookDetailState.bookDetail!.rating} ( ${BookDetailState.bookDetail!.viewCount} )",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        textDirection: TextDirection.rtl,
                                        BookDetailState.bookDetail!.price
                                                .toString() +
                                            " تومان ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade800),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Visibility(
                                visible:
                                    BookDetailState.bookDetail!.buy! == false
                                        ? true
                                        : false,
                                replacement: Column(
                                  children: [
                                    SizedBox(
                                      width: 320,
                                      height: 45,
                                      child: RawMaterialButton(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Text(
                                              'نمونه',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side:
                                                BorderSide(color: Colors.grey)),
                                        onPressed: () async {
                                          // if (kIsWeb) {
                                          //   showDialog(
                                          //     context: context,
                                          //     builder: (context) => Dialog(
                                          //       child: Container(),
                                          //     ),
                                          //   );
                                          // } else {
                                          Navigator.pushNamed(
                                            context,
                                            MyRoutes.pdfScreen,
                                            arguments: BookDetailState
                                                .bookDetail!.samplePdfLink
                                                .toString(),
                                          );
                                          // }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: 320,
                                      height: 45,
                                      child: RawMaterialButton(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Text(
                                              'مشاهده فایل کامل کتاب',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side:
                                                BorderSide(color: Colors.grey)),
                                        onPressed: () async {
                                          if (kIsWeb) {
                                            showDialog(
                                              context: context,
                                              builder: (context) => Dialog(
                                                child: Container(),
                                              ),
                                            );
                                          } else {
                                            Navigator.pushNamed(
                                              context,
                                              MyRoutes.pdfScreen,
                                              arguments: BookDetailState
                                                  .bookDetail!.pdfFile
                                                  .toString(),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    IgnorePointer(
                                      ignoring: shopCardPhisicalVisible == false
                                          ? true
                                          : false,
                                      child: Visibility(
                                        visible: shopCardVisible,
                                        replacement: SizedBox(
                                          height: 45,
                                          width: 320,
                                          child: RawMaterialButton(
                                            fillColor: secondaryColor,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .shopping_cart_rounded,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      'مشاهده سبدخرید',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            onPressed: () async {
                                              Navigator.pushNamed(context,
                                                  MyRoutes.shopCardScreen);
                                            },
                                          ),
                                        ),
                                        child: Visibility(
                                          visible: loadingVisible,
                                          replacement: SizedBox(
                                            height: 45,
                                            width: 320,
                                            child: RawMaterialButton(
                                                fillColor: secondaryColor,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Directionality(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    child:
                                                        LoadingAnimationWidget
                                                            .fourRotatingDots(
                                                                color: Colors
                                                                    .white,
                                                                size: 20),
                                                  ),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                onPressed: null),
                                          ),
                                          child: SizedBox(
                                            height: 45,
                                            width: 320,
                                            child: RawMaterialButton(
                                              fillColor: secondaryColor,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Directionality(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  child: Text(
                                                    'خرید کتاب دیجیتال',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              onPressed: () async {
                                                getShopCardList(
                                                    context: context);
                                                setState(() {
                                                  loadingVisible = false;
                                                });
                                                addOrRemoveBook(
                                                        context: context,
                                                        remove: false,
                                                        bookId: BookDetailState
                                                            .bookDetail!.id
                                                            .toString())
                                                    .then(
                                                  (value) {
                                                    setState(() {
                                                      loadingVisible = true;
                                                      shopCardVisible = false;
                                                    });
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    IgnorePointer(
                                      ignoring: shopCardVisible == false
                                          ? true
                                          : false,
                                      child: Visibility(
                                        visible: shopCardPhisicalVisible,
                                        replacement: SizedBox(
                                          height: 45,
                                          width: 320,
                                          child: RawMaterialButton(
                                            fillColor: Colors.green,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .shopping_cart_rounded,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      'مشاهده سبدخرید',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            onPressed: () async {
                                              Navigator.pushNamed(context,
                                                  MyRoutes.shopCardScreen);
                                            },
                                          ),
                                        ),
                                        child: Visibility(
                                          visible: loadingPhisicalVisible,
                                          replacement: SizedBox(
                                            height: 45,
                                            width: 320,
                                            child: RawMaterialButton(
                                                fillColor: Colors.green,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Directionality(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    child:
                                                        LoadingAnimationWidget
                                                            .fourRotatingDots(
                                                                color: Colors
                                                                    .white,
                                                                size: 20),
                                                  ),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                onPressed: null),
                                          ),
                                          child: SizedBox(
                                            height: 45,
                                            width: 320,
                                            child: RawMaterialButton(
                                              fillColor: Colors.green,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Directionality(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  child: Text(
                                                    'خرید کتاب فیزیکی',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              onPressed: () async {
                                                setState(() {
                                                  loadingPhisicalVisible =
                                                      false;
                                                });
                                                addOrRemoveBook(
                                                        context: context,
                                                        remove: false,
                                                        bookId: BookDetailState
                                                            .bookDetail!.id
                                                            .toString())
                                                    .then(
                                                  (value) {
                                                    setState(() {
                                                      getShopCardList(
                                                          context: context);
                                                      loadingPhisicalVisible =
                                                          true;
                                                      shopCardPhisicalVisible =
                                                          false;
                                                    });
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 320,
                                      height: 45,
                                      child: RawMaterialButton(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Text(
                                              'نمونه',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side:
                                                BorderSide(color: Colors.grey)),
                                        onPressed: () async {
                                          // if (kIsWeb) {
                                          //   showDialog(
                                          //     context: context,
                                          //     builder: (context) => Dialog(
                                          //       child: Container(),
                                          //     ),
                                          //   );
                                          // } else {
                                          Navigator.pushNamed(
                                            context,
                                            MyRoutes.pdfScreen,
                                            arguments: BookDetailState
                                                .bookDetail!.samplePdfLink
                                                .toString(),
                                          );
                                          // }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'درباره ${BookDetailState.bookDetail!.title}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              Text(
                                  textAlign: TextAlign.start,
                                  maxLines: 5,
                                  style: TextStyle(fontSize: 14),
                                  BookDetailState.bookDetail!.description
                                      .toString()),
                              SizedBox(
                                height: 20,
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      descVisible = !descVisible;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 14,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'توضیحات کامل',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Visibility(
                                visible: descVisible,
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'زیر نظر : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'سرپرست مترجمین : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'سرپرست مولفین : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'با همکاری : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'به کوشش : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'گردآوری و تالیف : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'با مقدمه و نظارت : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'ویراستار : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'ویراستار علمی : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'ویرایش علمی : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'نوبت چاپ : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'تاریخ چاپ : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'رنگ چاپ : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'قطع کتاب : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'نوع صحافی : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'نوع کاغذ : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'شماره شابک : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'فرمت محتوا : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'زمان تقریبی مطالعه : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'زبان : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'قیمت ارزی : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'قیمت چاپی : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '...',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'دسته ها : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 25,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 1,
                                  itemBuilder: (context, index) =>
                                      CategoryTextCard(
                                    name: BookDetailState
                                        .bookDetail!.categoryTitle
                                        .toString(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'lib/assets/images/pdf.png'),
                                          width: 35,
                                          height: 35,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4),
                                          child: Text(
                                            'PDF',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height: 30, child: VerticalDivider()),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'lib/assets/images/storage.png'),
                                          width: 25,
                                          height: 25,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2),
                                          child: Text(
                                            '823.54 کیلوبایت',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height: 30, child: VerticalDivider()),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'lib/assets/images/pages.png'),
                                          width: 25,
                                          height: 25,
                                        ),
                                        Text(
                                          '${BookDetailState.bookDetail!.pages} صفحه',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height: 30, child: VerticalDivider()),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'lib/assets/images/more.png'),
                                          width: 29,
                                          height: 29,
                                        ),
                                        Text(
                                          'بیشتر',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Divider(
                                  thickness: 0.5,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'lib/assets/images/list.png'),
                                          width: 25,
                                          height: 25,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'فهرست مطالب',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'گذاشتن این عنوان در ...',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(13),
                                            child: Image(
                                              image: AssetImage(
                                                  'lib/assets/images/library.png'),
                                            ),
                                          ),
                                          width: 55,
                                          height: 55,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          'کتابخانه من',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Image(
                                              image: AssetImage(
                                                  'lib/assets/images/saves.png'),
                                            ),
                                          ),
                                          width: 55,
                                          height: 55,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          'نشان شده ها',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Image(
                                              image: AssetImage(
                                                  'lib/assets/images/readed.png'),
                                            ),
                                          ),
                                          width: 55,
                                          height: 55,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          'مطالعه شده ها',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, MyRoutes.ratingScreen,
                                          arguments:
                                              BookDetailState.bookDetail!.id);
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'نقد و امتیاز من',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'بقیه را از نظرت با خبر کن:',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              RatingBar(
                                ignoreGestures: true,
                                updateOnDrag: false,
                                onRatingUpdate: (value) {},
                                initialRating:
                                    BookDetailState.bookDetail!.myReview != null
                                        ? BookDetailState
                                            .bookDetail!.myReview!.rate!
                                            .toDouble()
                                        : 0,
                                wrapAlignment: WrapAlignment.center,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 12),
                                itemSize: 40,
                                itemCount: 5,
                                unratedColor: Colors.amber,
                                ratingWidget: RatingWidget(
                                  full: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(12),
                                        border:
                                            Border.all(color: Colors.amber)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  half: Icon(Icons.star),
                                  empty: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.grey)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.grade_outlined,
                                        color: Colors.grey,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   child: InkWell(
                    //     onTap: () {
                    //       print(List.generate(
                    //           BookDetailState.bookDetail!.bookReviewss!.length,
                    //           (index) => BookDetailState
                    //                   .bookDetail!.bookReviewss!
                    //                   .where(
                    //                 (element) =>
                    //                     BookDetailState.bookDetail!
                    //                         .bookReviewss![index].rate ==
                    //                     1,
                    //               )).length);
                    //     },
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          Text(
                                            '  ${BookDetailState.bookDetail!.rating.toString()}' +
                                                " از " +
                                                "5",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Text(
                                          "بر اساس رأی ${BookDetailState.bookDetail!.bookReviewss!.length.toString()} مخاطب",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 165,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Text(
                                                '5  ',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              SizedBox(
                                                width: 150,
                                                child: LinearProgressIndicator(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  value: List.generate(
                                                          BookDetailState
                                                              .bookDetail!
                                                              .bookReviewss!
                                                              .length,
                                                          (index) =>
                                                              BookDetailState
                                                                  .bookDetail!
                                                                  .bookReviewss!
                                                                  .where(
                                                                (element) =>
                                                                    BookDetailState
                                                                        .bookDetail!
                                                                        .bookReviewss![
                                                                            index]
                                                                        .rate ==
                                                                    5,
                                                              )).length /
                                                      (BookDetailState
                                                                  .bookDetail!
                                                                  .bookReviewss!
                                                                  .length !=
                                                              0
                                                          ? BookDetailState
                                                              .bookDetail!
                                                              .bookReviewss!
                                                              .length
                                                          : 1),
                                                  minHeight: 5,
                                                  color: Colors.amber,
                                                  backgroundColor:
                                                      Colors.grey[300],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Text(
                                                '4  ',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              SizedBox(
                                                width: 150,
                                                child: LinearProgressIndicator(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  value: List.generate(
                                                          BookDetailState
                                                              .bookDetail!
                                                              .bookReviewss!
                                                              .length,
                                                          (index) =>
                                                              BookDetailState
                                                                  .bookDetail!
                                                                  .bookReviewss!
                                                                  .where(
                                                                (element) =>
                                                                    BookDetailState
                                                                        .bookDetail!
                                                                        .bookReviewss![
                                                                            index]
                                                                        .rate ==
                                                                    4,
                                                              )).length /
                                                      (BookDetailState
                                                                  .bookDetail!
                                                                  .bookReviewss!
                                                                  .length !=
                                                              0
                                                          ? BookDetailState
                                                              .bookDetail!
                                                              .bookReviewss!
                                                              .length
                                                          : 1),
                                                  minHeight: 5,
                                                  color: Colors.amber,
                                                  backgroundColor:
                                                      Colors.grey[300],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Text(
                                                '3  ',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              SizedBox(
                                                width: 150,
                                                child: LinearProgressIndicator(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  value: List.generate(
                                                          BookDetailState
                                                              .bookDetail!
                                                              .bookReviewss!
                                                              .length,
                                                          (index) =>
                                                              BookDetailState
                                                                  .bookDetail!
                                                                  .bookReviewss!
                                                                  .where(
                                                                (element) =>
                                                                    BookDetailState
                                                                        .bookDetail!
                                                                        .bookReviewss![
                                                                            index]
                                                                        .rate ==
                                                                    3,
                                                              )).length /
                                                      (BookDetailState
                                                                  .bookDetail!
                                                                  .bookReviewss!
                                                                  .length !=
                                                              0
                                                          ? BookDetailState
                                                              .bookDetail!
                                                              .bookReviewss!
                                                              .length
                                                          : 1),
                                                  minHeight: 5,
                                                  color: Colors.amber,
                                                  backgroundColor:
                                                      Colors.grey[300],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Text(
                                                '2  ',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              SizedBox(
                                                width: 150,
                                                child: LinearProgressIndicator(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  value: List.generate(
                                                          BookDetailState
                                                              .bookDetail!
                                                              .bookReviewss!
                                                              .length,
                                                          (index) =>
                                                              BookDetailState
                                                                  .bookDetail!
                                                                  .bookReviewss!
                                                                  .where(
                                                                (element) =>
                                                                    BookDetailState
                                                                        .bookDetail!
                                                                        .bookReviewss![
                                                                            index]
                                                                        .rate ==
                                                                    2,
                                                              )).length /
                                                      (BookDetailState
                                                                  .bookDetail!
                                                                  .bookReviewss!
                                                                  .length !=
                                                              0
                                                          ? BookDetailState
                                                              .bookDetail!
                                                              .bookReviewss!
                                                              .length
                                                          : 1),
                                                  minHeight: 5,
                                                  color: Colors.amber,
                                                  backgroundColor:
                                                      Colors.grey[300],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Text(
                                                '1  ',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              SizedBox(
                                                width: 150,
                                                child: LinearProgressIndicator(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  value: List.generate(
                                                          BookDetailState
                                                              .bookDetail!
                                                              .bookReviewss!
                                                              .length,
                                                          (index) =>
                                                              BookDetailState
                                                                  .bookDetail!
                                                                  .bookReviewss!
                                                                  .where(
                                                                (element) =>
                                                                    BookDetailState
                                                                        .bookDetail!
                                                                        .bookReviewss![
                                                                            index]
                                                                        .rate ==
                                                                    1,
                                                              )).length /
                                                      (BookDetailState
                                                                  .bookDetail!
                                                                  .bookReviewss!
                                                                  .length !=
                                                              0
                                                          ? BookDetailState
                                                              .bookDetail!
                                                              .bookReviewss!
                                                              .length
                                                          : 1),
                                                  minHeight: 5,
                                                  color: Colors.amber,
                                                  backgroundColor:
                                                      Colors.grey[300],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 5),
                      child: Container(
                        height: 220,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Consumer<BookDetailState>(
                            builder: (context, value, child) =>
                                ListView.builder(
                              itemCount:
                                  BookDetailState.bookDetail!.bookReviewss !=
                                          null
                                      ? BookDetailState
                                          .bookDetail!.bookReviewss!.length
                                      : 0,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: Image(
                                                image: AssetImage(
                                                    'lib/assets/images/iconcm.png'),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.grey.shade400),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                BookDetailState
                                                    .bookDetail!
                                                    .bookReviewss![index]
                                                    .userFirstName
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                BookDetailState
                                                    .bookDetail!
                                                    .bookReviewss![index]
                                                    .userLastName
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "1402-05-05",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '5 ',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 22,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                      BookDetailState.bookDetail!
                                          .bookReviewss![index].message
                                          .toString()),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'بیشتر',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.blue),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Divider(
                                      thickness: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                  'lib/assets/images/like.png'),
                                              width: 20,
                                              height: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '10',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Image(
                                              image: AssetImage(
                                                  'lib/assets/images/pm.png'),
                                              width: 21,
                                              height: 21,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '10',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Image(
                                            image: AssetImage(
                                                'lib/assets/images/!.png'),
                                            fit: BoxFit.cover,
                                            width: 21,
                                            height: 21,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'مشاهده همه نقد ها',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13,
                                  color: Colors.blue,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        children: [
                          Text(
                            'دیگر کتاب های این ناشر',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 7),
                    //   child: SizedBox(
                    //     height: 280,
                    //     child: ListView.builder(
                    //       itemCount: 2,
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (context, index) => Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: BookCardWidget(
                    //           viewCont: 5,
                    //           bookId: '',
                    //           bookWriter: 'دکتر مهران نوربخش',
                    //           bookRate: 1,
                    //           bookPrice: '115.000',
                    //           bookName:
                    //               "مدیریت چالش ها و پیچیدگی های اندودانتیکس",
                    //           bookImage: "lib/assets/images/book.png",
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
