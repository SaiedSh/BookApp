import 'dart:async';

import 'package:bookapp/controller/api/book/book_list.dart';
import 'package:bookapp/controller/api/home_items/category_products.dart';
import 'package:bookapp/controller/api/home_items/items.dart';
import 'package:bookapp/controller/provider/book_list_state.dart';
import 'package:bookapp/controller/provider/category_product_state.dart';
import 'package:bookapp/controller/provider/index_items_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/components/bookcard_widget.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:bookapp/view/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  List categoryList = ['ادبیات', 'تاریخ', 'رمان', 'کودکان'];
  List sliderImageList = [
    'lib/assets/images/banner2.jpg',
    'lib/assets/images/banner3.jpg',
    'lib/assets/images/banner.jpg'
  ];
  // List bookImageList = [
  //   'lib/assets/images/book.jpg',
  //   'lib/assets/images/book2.jpg',
  //   'lib/assets/images/book3.jpg'
  // ];
  String searchText = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    // getCategories(
    //   context: context,
    // );
    getIndexItems(context: context);
    getProductsByCategory(context: context);
    getBooksList(context: context);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: backgroundColor,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                  onPressed: () {},
                                  icon: Image(
                                    image: AssetImage(
                                        'lib/assets/images/handbag.png'),
                                    width: 15,
                                  )),
                            ],
                          ),
                          Image(
                            image: AssetImage('lib/assets/images/logo.png'),
                            width: 70,
                          )
                        ],
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: SizedBox(
                          height: 35,
                          width: MediaQuery.of(context).size.width - 10,
                          child: TextField(
                            cursorHeight: 20,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 18,
                                ),
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center,
                                label: Text(
                                  'جستجو در نیکو بوک',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                                filled: true,
                                fillColor: backgroundColor,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5))),
                          )),
                    )
                  ],
                ),
              ),
            ),
          )),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Consumer<IndexItemsState>(builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(0),
                child: IndexItemsState.IndexLists != null
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 220,
                        child: PageView(
                          controller: _pageController,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(IndexItemsState
                                          .IndexLists!
                                          .indexInfo!
                                          .banner1ImageUrl
                                          .toString()))),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    IndexItemsState
                                        .IndexLists!.indexInfo!.banner1Title
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 100),
                                    child: Divider(),
                                  ),
                                  Text(
                                    IndexItemsState.IndexLists!.indexInfo!
                                        .banner1Description
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade300),
                                  ),
                                  SizedBox(
                                    height: 100,
                                  ),
                                  AnimatedSmoothIndicator(
                                    activeIndex: 0,
                                    count: 3,
                                    effect: ExpandingDotsEffect(
                                        activeDotColor: secondaryColor,
                                        dotHeight: 10,
                                        dotWidth: 10,
                                        dotColor: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(IndexItemsState
                                          .IndexLists!
                                          .indexInfo!
                                          .banner2ImageUrl
                                          .toString()))),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    IndexItemsState
                                        .IndexLists!.indexInfo!.banner2Title
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 100),
                                    child: Divider(),
                                  ),
                                  Text(
                                    IndexItemsState.IndexLists!.indexInfo!
                                        .banner2Description
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 100,
                                  ),
                                  AnimatedSmoothIndicator(
                                    activeIndex: 1,
                                    count: 3,
                                    effect: ExpandingDotsEffect(
                                        activeDotColor: secondaryColor,
                                        dotHeight: 10,
                                        dotWidth: 10,
                                        dotColor: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(IndexItemsState
                                          .IndexLists!
                                          .indexInfo!
                                          .banner3ImageUrl
                                          .toString()))),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    IndexItemsState
                                        .IndexLists!.indexInfo!.banner3Title
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 100),
                                    child: Divider(),
                                  ),
                                  Text(
                                    IndexItemsState.IndexLists!.indexInfo!
                                        .banner3Description
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade300),
                                  ),
                                  SizedBox(
                                    height: 100,
                                  ),
                                  AnimatedSmoothIndicator(
                                    activeIndex: 2,
                                    count: 3,
                                    effect: ExpandingDotsEffect(
                                        activeDotColor: secondaryColor,
                                        dotHeight: 10,
                                        dotWidth: 10,
                                        dotColor: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 220,
                      ),
              );
            }),

            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 14,
                          color: Colors.blue,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.allBooksScreen);
                            },
                            child: Text(
                              'مشاهده همه',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Text(
                    'کتاب های تخصصی دندانپزشکی',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Consumer<BookListState>(
                builder: (context, value, child) => SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: BookCardWidget(
                        bookId: BookListState.books[index].id.toString(),
                        bookWriter:
                            BookListState.books[index].nevisande.toString(),
                        bookRate: BookListState.books[index].rating!.toDouble(),
                        bookPrice: BookListState.books[index].price.toString(),
                        bookName: BookListState.books[index].title.toString(),
                        bookImage:
                            BookListState.books[index].imageUrl.toString(),
                        viewCont: BookListState.books[index].viewCount!,
                      ),
                    ),
                    itemCount: BookListState.books.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 14,
                          color: Colors.blue,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'مشاهده همه',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Text(
                    'کتاب های پزشکی',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            // Consumer<IndexItemsState>(
            //   builder: (context, value, child) => SizedBox(
            //     height: 265,
            //     width: MediaQuery.of(context).size.width,
            //     child: ListView.builder(
            //       itemBuilder: (context, index) => Padding(
            //         padding: const EdgeInsets.all(15.0),
            //         child: BookCardWidget(
            //           bookId: IndexItemsState.IndexLists!.freeBooks![index].id
            //               .toString(),
            //           bookWriter: IndexItemsState
            //               .IndexLists!.freeBooks![index].nevisande
            //               .toString(),
            //           bookRate: IndexItemsState
            //               .IndexLists!.freeBooks![index].rating!
            //               .toDouble(),
            //           bookPrice: ' رایگان ',
            //           bookName: IndexItemsState
            //               .IndexLists!.freeBooks![index].title
            //               .toString(),
            //           bookImage: IndexItemsState
            //               .IndexLists!.freeBooks![index].imageUrl
            //               .toString(),
            //         ),
            //       ),
            //       itemCount: IndexItemsState.IndexLists!.freeBooks!.length,
            //       scrollDirection: Axis.horizontal,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 200,
            )
            // SizedBox(
            //   height: MediaQuery.of(context).size.height - 100,
            //   width: MediaQuery.of(context).size.width - 10,
            //   child: AnimationLimiter(
            //     child: GridView.count(
            //       shrinkWrap: true,
            //       childAspectRatio: 0.6,
            //       crossAxisCount: 2,
            //       children: List.generate(
            //         8,
            //         (int index) {
            //           return AnimationConfiguration.staggeredGrid(
            //             position: index,
            //             duration: const Duration(milliseconds: 375),
            //             columnCount: 2,
            //             child: ScaleAnimation(
            //               child: FadeInAnimation(
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(8.0),
            //                   child: BookCardWidget(),
            //                 ),
            //               ),
            //             ),
            //           );
            //         },
            //       ),
            //     ),
            //   ),
            // ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: DropdownButton<String>(
            //     value: selectedCategory,
            //     onChanged: (String? newValue) {
            //       setState(() {
            //         selectedCategory = newValue!;
            //       });
            //       _filterItems(selectedCategory);
            //     },
            //     items:
            //         categories.map<DropdownMenuItem<String>>((String category) {
            //       return DropdownMenuItem<String>(
            //         value: category,
            //         child: Text(category),
            //       );
            //     }).toList(),
            //   ),
            // ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: filteredItems.length,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text(filteredItems[index]['name']!),
            //         subtitle: Text(filteredItems[index]['category']!),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class AnotherScreen extends StatefulWidget {
  final String motherId;
  const AnotherScreen({
    super.key,
    required this.motherId,
  });

  @override
  State<AnotherScreen> createState() => _AnotherScreenState();
}

class _AnotherScreenState extends State<AnotherScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories(context: context, motherId: widget.motherId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CategoryState>(
        builder: (context, value, child) => Column(
          children: [
            for (var element in CategoryState.categoriesChild)
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BooksScreen(categoryId: element.id.toString()),
                      ));
                },
                title: Text(element.title.toString()),
              )
          ],
        ),
      ),
    );
  }
}
