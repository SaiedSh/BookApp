import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookCardWidget extends StatelessWidget {
  final String bookImage;
  final String bookName;
  final String bookPrice;
  final String bookWriter;
  final double bookRate;
  final String bookId;
  final int viewCont;
  final bool discountVisible = false;
  final bool nikoPlusVisible = false;
  final bool physicalVisivle = false;
  final bool onlineVisible = false;
  const BookCardWidget(
      {super.key,
      required this.bookImage,
      required this.bookName,
      required this.bookPrice,
      required this.bookWriter,
      required this.bookRate,
      required this.bookId,
      required this.viewCont});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topLeft, children: [
      Container(
        height: 300,
        width: 160,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              spreadRadius: 0.1, blurRadius: 4, color: Colors.grey.shade400)
        ], color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(alignment: Alignment.bottomRight, children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        MyRoutes.bookDetail,
                        arguments: bookId,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 6, bottom: 10, left: 4, right: 4),
                      child: Container(
                        width: 160,
                        height: 110,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('lib/assets/images/book.png')),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        // child: ClipRRect(
                        //   borderRadius: BorderRadius.circular(12),
                        //   child: Image.network(
                        //     bookImage,
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: physicalVisivle,
                    child: Positioned(
                        bottom: 10,
                        right: 30,
                        child: Image(
                          image: AssetImage('lib/assets/images/byke.png'),
                          width: 15,
                        )),
                  ),
                  Visibility(
                    visible: onlineVisible,
                    child: Positioned(
                        bottom: 10,
                        right: 12,
                        child: Image(
                          image: AssetImage('lib/assets/images/booky.png'),
                          width: 15,
                        )),
                  )
                ]),
                Text(
                  bookName,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  bookWriter,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      "${bookRate} ( $viewCont )",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Divider(),
                // SizedBox(
                //   width: 100,
                //   child: RatingBar.builder(
                //     itemSize: 18,
                //     initialRating: bookRate,
                //     minRating: 1,
                //     direction: Axis.horizontal,
                //     allowHalfRating: true,
                //     itemCount: 5,
                //     itemBuilder: (context, _) => Icon(
                //       Icons.star,
                //       color: Colors.amber,
                //     ),
                //     onRatingUpdate: (rating) {
                //       print(rating);
                //     },
                //   ),
                // ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      textDirection: TextDirection.rtl,
                      bookPrice + " تومان ",
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade800),
                    ),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 5),
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.bookmark_outline,
                //         size: 20,
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
      Visibility(
        visible: nikoPlusVisible,
        child: Positioned(
            left: 12,
            child: Image(
              image: AssetImage('lib/assets/images/plusicon.png'),
              width: 20,
            )),
      ),
      Visibility(
        visible: discountVisible,
        child: Positioned(
          child: Container(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '20',
                    style:
                        GoogleFonts.aBeeZee(color: Colors.white, fontSize: 10),
                  ),
                  Text(
                    '%',
                    style: TextStyle(color: Colors.white, fontSize: 8),
                  ),
                ],
              ),
            ),
            width: 20,
            height: 27,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/assets/images/discount.png'),
                    fit: BoxFit.fill)),
          ),
          left: 35,
        ),
      )
      // Positioned(
      //     left: 35,
      //     child: Image(
      //       image: AssetImage('lib/assets/images/discount.png'),
      //       width: 20,
      //     )),
    ]);
  }
}

class BookCardListWidget extends StatelessWidget {
  final String bookImage;
  final String bookName;
  final String bookPrice;
  final String bookWriter;
  final double bookRate;
  final String bookId;
  const BookCardListWidget(
      {super.key,
      required this.bookImage,
      required this.bookName,
      required this.bookPrice,
      required this.bookWriter,
      required this.bookRate,
      required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: 160,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          MyRoutes.bookDetail,
                          arguments: bookId,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 6, bottom: 10, left: 4, right: 4),
                        child: Container(
                          width: 120,
                          height: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              image: DecorationImage(
                                  image: AssetImage(bookImage),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bookName,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            bookWriter,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'ناشر : ',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Divider(),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber,
                            ),
                          ),
                          Text(
                            "4.8 ( 585 )",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            textDirection: TextDirection.rtl,
                            "ثبت نقد و امتیاز من",
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 0, 174, 212)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.5),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 11,
                              color: Color.fromARGB(255, 0, 174, 212),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
