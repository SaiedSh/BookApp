import 'package:bookapp/controller/api/book/book_list.dart';
import 'package:bookapp/controller/api/home_items/category_products.dart';
import 'package:bookapp/controller/provider/book_list_state.dart';
import 'package:bookapp/controller/provider/category_product_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/components/bookcard_widget.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:bookapp/view/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllBooksScreen extends StatefulWidget {
  const AllBooksScreen({super.key});

  @override
  State<AllBooksScreen> createState() => _AllBooksScreenState();
}

class _AllBooksScreenState extends State<AllBooksScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBooksList(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
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
                      padding: const EdgeInsets.only(top: 30),
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
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image(
                              image: AssetImage('lib/assets/images/logo.png'),
                              width: 70,
                            ),
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 35,
              height: 40,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('lib/assets/images/filter.png'),
                            fit: BoxFit.fill,
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'فیلتر محصولات ',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image(
                            image: AssetImage('lib/assets/images/sort.png'),
                            fit: BoxFit.fill,
                            width: 20,
                            height: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'پر فروش ترین',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image(
                            image: AssetImage('lib/assets/images/listt.png'),
                            fit: BoxFit.fill,
                            width: 18,
                            height: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Image(
                            image: AssetImage('lib/assets/images/grid.png'),
                            fit: BoxFit.fill,
                            width: 18,
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 270,
                  width: MediaQuery.of(context).size.width - 40,
                  child: Consumer<BookListState>(
                    builder: (context, value, child) => GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: BookListState.books.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.6, crossAxisCount: 2),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BookCardWidget(
                          viewCont: BookListState.books[index].viewCount!,
                          bookId: BookListState.books[index].id.toString(),
                          bookWriter:
                              BookListState.books[index].nevisande.toString(),
                          bookRate:
                              BookListState.books[index].rating!.toDouble(),
                          bookPrice:
                              BookListState.books[index].price.toString(),
                          bookName: BookListState.books[index].title.toString(),
                          bookImage:
                              BookListState.books[index].imageUrl.toString(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
