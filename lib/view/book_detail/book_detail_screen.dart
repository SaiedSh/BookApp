import 'package:bookapp/controller/provider/book_detail_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/components/bookcard_widget.dart';
import 'package:bookapp/model/components/categorytext_widget.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
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
    // getBookDetails(context: context, bookId: widget.bookId);
  }

  double _rating = 3.0;
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
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
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
                                      onPressed: () {},
                                      icon: Image(
                                        image: AssetImage(
                                            'lib/assets/images/handbag.png'),
                                        width: 15,
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'مدیریت چالش ها و پیچیدگی های اندودانتیکس',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
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

                        // Directionality(
                        //   textDirection: TextDirection.rtl,
                        //   child: SizedBox(
                        //       height: 35,
                        //       width: MediaQuery.of(context).size.width - 10,
                        //       child: TextField(
                        //         cursorHeight: 20,
                        //         decoration: InputDecoration(
                        //             prefixIcon: Icon(
                        //               Icons.search,
                        //               size: 18,
                        //             ),
                        //             floatingLabelAlignment:
                        //                 FloatingLabelAlignment.center,
                        //             label: Text(
                        //               'جستجو در نیکو بوک',
                        //               style: TextStyle(
                        //                   color: Colors.grey,
                        //                   fontSize: 10,
                        //                   fontWeight: FontWeight.w500),
                        //             ),
                        //             filled: true,
                        //             fillColor: backgroundColor,
                        //             border: OutlineInputBorder(
                        //                 borderSide: BorderSide.none,
                        //                 borderRadius:
                        //                     BorderRadius.circular(5))),
                        //       )),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            )),
        backgroundColor: backgroundColor,
        // bottomSheet: Consumer<BookDetailState>(
        //   builder: (context, value, child) => Container(
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 10),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           ElevatedButton(
        //               style: ButtonStyle(
        //                   backgroundColor: WidgetStateColor.resolveWith(
        //                 (states) => secondaryColor,
        //               )),
        //               onPressed: () {
        //                 Navigator.pushNamed(
        //                   context,
        //                   MyRoutes.pdfScreen,
        //                   arguments:
        //                       BookDetailState.bookDetail!.pdfLink.toString(),
        //                 );
        //               },
        //               child: Text(
        //                 "دریافت pdf کتاب",
        //                 style: GoogleFonts.lalezar(
        //                     fontSize: 14, color: Colors.white),
        //               )),
        //           if (BookDetailState.bookDetail!.discountPrice! != 0)
        //             Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Text(
        //                   BookDetailState.bookDetail!.price.toString() +
        //                       "/000" +
        //                       " ت ",
        //                   style: GoogleFonts.lalezar(
        //                       color: Colors.grey.shade700,
        //                       decoration: TextDecoration.lineThrough),
        //                 ),
        //                 Text(
        //                   BookDetailState.bookDetail!.discountPrice.toString() +
        //                       "/000" +
        //                       " ت ",
        //                   style: GoogleFonts.lalezar(fontSize: 18),
        //                 ),
        //               ],
        //             )
        //           else if (BookDetailState.bookDetail!.price == 0)
        //             Text(
        //               'رایگان',
        //               style: GoogleFonts.lalezar(fontSize: 18),
        //             )
        //           else
        //             Text(
        //               BookDetailState.bookDetail!.price.toString() +
        //                   "/000" +
        //                   " ت ",
        //               style: GoogleFonts.lalezar(fontSize: 18),
        //             ),
        //         ],
        //       ),
        //     ),
        //     decoration: BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(12),
        //             topRight: Radius.circular(12)),
        //         boxShadow: [
        //           BoxShadow(
        //               blurRadius: 5, spreadRadius: 0.1, color: Colors.grey)
        //         ]),
        //     height: 80,
        //   ),
        // ),
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       icon: Icon(Icons.forward),
        //     )
        //   ],
        // ),

        body: Consumer<BookDetailState>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Container(
                    //       width: 120,
                    //       margin: EdgeInsets.all(5),
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           boxShadow: [
                    //             BoxShadow(blurRadius: 5, spreadRadius: 0.1)
                    //           ]),
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(10),
                    //         child: Image(
                    //             fit: BoxFit.fill,
                    //             image: NetworkImage(BookDetailState
                    //                 .bookDetail!.imageUrl
                    //                 .toString())),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 30,
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.only(top: 5),
                    //       child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           Text(
                    //             BookDetailState.bookDetail!.title.toString(),
                    //             style: GoogleFonts.lalezar(fontSize: 20),
                    //           ),
                    //           Text(
                    //             "نویسنده : " +
                    //                 BookDetailState.bookDetail!.nevisande
                    //                     .toString(),
                    //             style: GoogleFonts.lalezar(
                    //                 fontSize: 14, color: Colors.grey),
                    //           )
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 40,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 12),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Row(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           BookmarkWidget(itemId: 'itemId'),
                    //           IconButton(
                    //               onPressed: () {},
                    //               icon: Icon(
                    //                 Icons.share,
                    //                 size: 20,
                    //               )),
                    //         ],
                    //       ),
                    //       Row(
                    //         children: [
                    //           Padding(
                    //             padding: const EdgeInsets.only(bottom: 5),
                    //             child: Icon(
                    //               Icons.star,
                    //               size: 18,
                    //             ),
                    //           ),
                    //           Text(
                    //             "${BookDetailState.bookDetail!.rating.toString()} ( ${BookDetailState.bookDetail!.viewCount.toString()} )",
                    //             style: GoogleFonts.lalezar(
                    //                 fontSize: 14, color: Colors.black),
                    //           ),
                    //           SizedBox(
                    //             width: 5,
                    //           ),
                    //           InkWell(
                    //             onTap: () {},
                    //             child: Text(
                    //               "خواندن نظرات",
                    //               style: GoogleFonts.lalezar(
                    //                   decoration: TextDecoration.underline,
                    //                   decorationColor: secondaryColor,
                    //                   fontSize: 14,
                    //                   color: secondaryColor),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    // Text(
                    //   "مشخصات کتاب",
                    //   style:
                    //       GoogleFonts.lalezar(fontSize: 16, color: Colors.black),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: backColor),
                    //   width: MediaQuery.of(context).size.width - 20,
                    //   height: 200,
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     children: [
                    //       // SizedBox(
                    //       //   height: 15,
                    //       // ),
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal: 15),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(
                    //               "انتشارات : ",
                    //               style: GoogleFonts.lalezar(
                    //                   fontSize: 16, color: Colors.black),
                    //             ),
                    //             Text(
                    //               BookDetailState.bookDetail!.entesharat
                    //                   .toString(),
                    //               style: GoogleFonts.lalezar(
                    //                   fontSize: 14, color: Colors.black54),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal: 15),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(
                    //               "مترجم : ",
                    //               style: GoogleFonts.lalezar(
                    //                   fontSize: 16, color: Colors.black),
                    //             ),
                    //             Text(
                    //               BookDetailState.bookDetail!.motarjem.toString(),
                    //               style: GoogleFonts.lalezar(
                    //                   fontSize: 14, color: Colors.black54),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal: 15),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(
                    //               "دسته بندی : ",
                    //               style: GoogleFonts.lalezar(
                    //                   fontSize: 16, color: Colors.black),
                    //             ),
                    //             Text(
                    //               BookDetailState.bookDetail!.categoryName
                    //                   .toString(),
                    //               style: GoogleFonts.lalezar(
                    //                   fontSize: 14, color: Colors.black54),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal: 15),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(
                    //               "سال انتشار : ",
                    //               style: GoogleFonts.lalezar(
                    //                   fontSize: 16, color: Colors.black),
                    //             ),
                    //             Text(
                    //               BookDetailState.bookDetail!.salEnteshar
                    //                   .toString(),
                    //               style: GoogleFonts.lalezar(
                    //                   fontSize: 14, color: Colors.black54),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal: 15),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(
                    //               "تعداد صفحات : ",
                    //               style: GoogleFonts.lalezar(
                    //                   fontSize: 16, color: Colors.black),
                    //             ),
                    //             Text(
                    //               BookDetailState.bookDetail!.pages.toString(),
                    //               style: GoogleFonts.lalezar(
                    //                   fontSize: 14, color: Colors.black54),
                    //             ),
                    //           ],
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // )
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 5),
                      child: Container(
                        height: 600,
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
                                  Image(
                                    image: AssetImage(
                                        'lib/assets/images/book.png'),
                                    width: 230,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 80),
                                    child: Column(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'lib/assets/images/share.png'),
                                          width: 30,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Image(
                                          image: AssetImage(
                                              'lib/assets/images/save.png'),
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'مدیریت چالش ها و پیچیدگی های اندودانتیکس',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
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
                                    'نویسنده : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
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
                                    'مترجم : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
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
                                    'ناشر : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(),
                              SizedBox(
                                height: 20,
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
                                          size: 16,
                                          color: Colors.amber,
                                        ),
                                      ),
                                      Text(
                                        "4.8 ( 585 )",
                                        style: GoogleFonts.lalezar(
                                          fontSize: 10,
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
                                        '115/000' + " تومان ",
                                        style: GoogleFonts.notoSansArabic(
                                            fontSize: 12,
                                            color: Colors.grey.shade800),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 320,
                                child: RawMaterialButton(
                                  fillColor: secondaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Text(
                                        'خرید کتاب دیجیتال',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  onPressed: () async {},
                                ),
                              ),
                              SizedBox(
                                width: 320,
                                child: RawMaterialButton(
                                  fillColor: Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Text(
                                        'خرید کتاب فیزیکی',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11),
                                      ),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  onPressed: () async {},
                                ),
                              ),
                              SizedBox(
                                width: 320,
                                child: RawMaterialButton(
                                  fillColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Text(
                                        'نمونه',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Colors.black)),
                                  onPressed: () async {},
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 5),
                      child: Container(
                        height: 240,
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
                                    'درباره مدیریت چالش ها و پیچیدگی های اندودانتیکس',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              Text(
                                  textAlign: TextAlign.start,
                                  maxLines: 5,
                                  style: TextStyle(fontSize: 11),
                                  'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت '),
                              SizedBox(
                                height: 20,
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: InkWell(
                                  onTap: () {},
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
                                        style: GoogleFonts.ibmPlexSansArabic(
                                          color: Colors.blue,
                                          fontSize: 10,
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
                              Row(
                                children: [
                                  Text(
                                    'دسته ها : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
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
                                    name: 'دندان پزشکی',
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
                        height: 123,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
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
                                                fontSize: 7),
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
                                          '160 صفحه',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 7.5),
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
                                              fontSize: 8),
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
                                              fontSize: 8),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 5),
                      child: Container(
                        height: 145,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
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
                                height: 30,
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
                                              fontSize: 10,
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
                                              fontSize: 9,
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
                                              fontSize: 9,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 5),
                      child: Container(
                        height: 128,
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
                                          context, MyRoutes.ratingScreen);
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
                                                  fontSize: 9,
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
                                onRatingUpdate: (value) {},
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
                        height: 140,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Text(
                                        "4.1" + " از " + "5",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Text(
                                      "بر اساس رأی 50 مخاطب",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8.5),
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
                                              value: _rating / 4,
                                              minHeight: 5,
                                              color: Colors.amber,
                                              backgroundColor: Colors.grey[300],
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
                                              value: _rating / 5,
                                              minHeight: 5,
                                              color: Colors.amber,
                                              backgroundColor: Colors.grey[300],
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
                                              value: _rating / 6,
                                              minHeight: 5,
                                              color: Colors.amber,
                                              backgroundColor: Colors.grey[300],
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
                                              value: _rating / 7,
                                              minHeight: 5,
                                              color: Colors.amber,
                                              backgroundColor: Colors.grey[300],
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
                                              value: _rating / 8,
                                              minHeight: 5,
                                              color: Colors.amber,
                                              backgroundColor: Colors.grey[300],
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 5),
                      child: Container(
                        height: 205,
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
                                      Text(
                                        "پویا علینقیان",
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "1402-05-05",
                                        style: TextStyle(
                                            fontSize: 9,
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
                                      fontSize: 9.5,
                                      fontWeight: FontWeight.w500),
                                  'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد'),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'بیشتر',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.blue),
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
                                    const EdgeInsets.symmetric(horizontal: 8),
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
                                              color: Colors.grey, fontSize: 12),
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
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
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
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 5),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'مشاهده همه نقد ها',
                              style: TextStyle(
                                  fontSize: 9.5,
                                  fontWeight: FontWeight.bold,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: SizedBox(
                        height: 240,
                        child: ListView.builder(
                          itemCount: 2,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BookCardWidget(
                              bookId: '',
                              bookWriter: 'دکتر مهران نوربخش',
                              bookRate: 1,
                              bookPrice: '115.000',
                              bookName:
                                  "مدیریت چالش ها و پیچیدگی های اندودانتیکس",
                              bookImage: "lib/assets/images/book.png",
                            ),
                          ),
                        ),
                      ),
                    )
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
