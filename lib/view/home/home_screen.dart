import 'package:bookapp/components/bookcard_widget.dart';
import 'package:bookapp/components/categorytext_widget.dart';
import 'package:bookapp/components/slidercard_widget.dart';
import 'package:bookapp/controller/api/home_items/category_products.dart';
import 'package:bookapp/controller/provider/category_product_state.dart';
import 'package:bookapp/global.dart';
import 'package:bookapp/view/product/product_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List categoryList = ['ادبیات', 'تاریخ', 'رمان', 'کودکان'];
  List sliderImageList = [
    'lib/assets/images/banner2.jpg',
    'lib/assets/images/banner3.jpg',
    'lib/assets/images/banner.jpg'
  ];
  List bookImageList = [
    'lib/assets/images/book.jpg',
    'lib/assets/images/book2.jpg',
    'lib/assets/images/book3.jpg'
  ];
  String searchText = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCategories(
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: Drawer(
          width: 230,
          child: Consumer<CategoryState>(
            builder: (context, value, child) => ListView(children: [
              DrawerHeader(
                child: Center(child: Text('Book')),
              ),
              for (var element in CategoryState.categories)
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnotherScreen(
                            motherId: element.id.toString(),
                          ),
                        ));
                  },
                  title: Text(element.title.toString()),
                  trailing: Icon(Icons.arrow_forward),
                ),
            ]),
          ),
        ),
        backgroundColor: backgroundColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: primaryColor, size: 30),
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: backgroundColor,
          title: Padding(
            padding: EdgeInsets.only(top: 0),
            child: SizedBox(
              width: 300,
              height: 40,
              child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                    fillColor: thirdColor,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    hintText: 'جست و جو',
                    hintStyle: GoogleFonts.ibmPlexSansArabic(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.search_rounded),
                      width: 18,
                    )),
              ),
            ),
          ),
          centerTitle: true,

          // leading: SizedBox(
          //   height: 50,
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 15, right: 10),
          //     child: GestureDetector(
          //       onTap: () {
          //         Navigator.of(context).push(
          //           PageRouteBuilder(
          //               pageBuilder: (_, __, ___) => ProfileScreen(),
          //               transitionDuration: const Duration(milliseconds: 500),
          //               transitionsBuilder: (_, a, __, c) => FadeTransition(
          //                     opacity: a,
          //                     child: c,
          //                   )),
          //         );
          //       },
          //       child: Container(
          //         child: Icon(
          //           Icons.person,
          //           color: primaryColor,
          //           size: 30,
          //         ),
          //         decoration:
          //             BoxDecoration(shape: BoxShape.circle, color: textsColor),
          //       ),
          //     ),
          //   ),
          // ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('lib/assets/images/mainbanner.png'),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                decoration: BoxDecoration(color: thirdColor),
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage('lib/assets/images/icon.png'),
                          width: 35,
                          height: 35,
                        ),
                        SizedBox(
                          width: 80,
                          child: Text(
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            'خرید کتاب های پرفروش',
                            style: GoogleFonts.lalezar(
                                fontSize: 12, color: primaryColor),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage('lib/assets/images/icon2.png'),
                          width: 35,
                          height: 35,
                        ),
                        SizedBox(
                          width: 80,
                          child: Text(
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            'امکان دانلود  کتاب ها   ',
                            style: GoogleFonts.lalezar(
                                fontSize: 12, color: primaryColor),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage('lib/assets/images/icon3.png'),
                          width: 35,
                          height: 35,
                        ),
                        SizedBox(
                          width: 80,
                          child: Text(
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            'امکان خرید اشتراک ماهانه',
                            style: GoogleFonts.lalezar(
                                fontSize: 12, color: primaryColor),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'دسته بندی',
                style: GoogleFonts.notoSansArabic(
                    fontWeight: FontWeight.bold, color: primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<CategoryState>(
                builder: (context, value, child) => SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CategoryTextCard(
                        name: CategoryState.categories[index].title!,
                      ),
                    ),
                    itemCount: CategoryState.categories.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CarouselSlider(
                options: CarouselOptions(height: 170.0),
                items: [0, 1, 2].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SliderWidget(
                          imagePath: sliderImageList[i],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       GestureDetector(
              //         child: Container(
              //           width: 120,
              //           height: 40,
              //           child: Center(
              //             child: Text(
              //               'اشتراک',
              //               style: GoogleFonts.notoSansArabic(
              //                   fontWeight: FontWeight.bold,
              //                   color: primaryColor),
              //             ),
              //           ),
              //           decoration: BoxDecoration(
              //               color: thirdColor,
              //               borderRadius: BorderRadius.circular(20)),
              //         ),
              //       ),
              //       GestureDetector(
              //         onTap: () {},
              //         child: Container(
              //           width: 120,
              //           height: 40,
              //           child: Center(
              //             child: Text(
              //               'نصب برنامه',
              //               style: GoogleFonts.notoSansArabic(
              //                   fontWeight: FontWeight.bold,
              //                   color: primaryColor),
              //             ),
              //           ),
              //           decoration: BoxDecoration(
              //               color: thirdColor,
              //               borderRadius: BorderRadius.circular(20)),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      'دسته بندی',
                      style: GoogleFonts.notoSansArabic(
                          fontWeight: FontWeight.bold, color: primaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 265,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: BookCardWidget(
                      bookImage: bookImageList[index],
                    ),
                  ),
                  itemCount: bookImageList.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
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
