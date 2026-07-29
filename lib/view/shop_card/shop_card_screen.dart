import 'package:bookapp/controller/api/payment/shop_card/buy_book.dart';
import 'package:bookapp/controller/api/payment/shop_card/final_payment.dart';
import 'package:bookapp/controller/api/payment/shop_card/get_shopcard_list.dart';
import 'package:bookapp/controller/provider/shop_card_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ShopCardScreen extends StatefulWidget {
  const ShopCardScreen({
    super.key,
  });

  @override
  State<ShopCardScreen> createState() => _ShopCardScreenState();
}

class _ShopCardScreenState extends State<ShopCardScreen> {
  TextEditingController price = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getShopCardList(context: context).then(
      (value) {
        finalValue = (ShopCardState.shopCardList!.rawPrice)! -
            (ShopCardState.shopCardList!.totalPrice!);
      },
    );
  }

  int finalValue = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomSheet: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
            child: RawMaterialButton(
              fillColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'پرداخت',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            thickness: 2,
                            color: Colors.white,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: [
                            Consumer<ShopCardState>(
                              builder: (context, value, child) => Text(
                                ShopCardState.shopCardList!.totalPrice != null
                                    ? ShopCardState.shopCardList!.totalPrice
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                'تومان',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              onPressed: () async {
                payment(context: context, wallet: true).then(
                  (value) {
                    getShopCardList(context: context);
                  },
                );
              },
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0), color: Colors.white),
        ),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
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
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              Row(
                                children: [
                                  Text(
                                    'سبد خرید',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          MyRoutes.navigationBarScreen);
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
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<ShopCardState>(
                  builder: (context, value, child) => ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: ShopCardState.shopCardList!.shopCardItems != null
                        ? ShopCardState.shopCardList!.shopCardItems!.length
                        : 0,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'lib/assets/images/book.png'),
                                    fit: BoxFit.fill,
                                    width: 120,
                                    height: 100,
                                  ),
                                  // Image.network(
                                  //   ShopCardState.shopCardList!.shopCardItems !=
                                  //           null
                                  //       ? ShopCardState.shopCardList!
                                  //           .shopCardItems![index].bookImageUrl
                                  //           .toString()
                                  //       : "",
                                  //   width: 120,
                                  //   height: 100,
                                  //   fit: BoxFit.fill,
                                  // ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ShopCardState.shopCardList!
                                                      .shopCardItems !=
                                                  null
                                              ? ShopCardState
                                                  .shopCardList!
                                                  .shopCardItems![index]
                                                  .bookTitle
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: primaryColor),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          ShopCardState.shopCardList!
                                                      .shopCardItems !=
                                                  null
                                              ? ShopCardState
                                                  .shopCardList!
                                                  .shopCardItems![index]
                                                  .bookNevisande
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          ShopCardState.shopCardList!
                                                      .shopCardItems !=
                                                  null
                                              ? ShopCardState
                                                  .shopCardList!
                                                  .shopCardItems![index]
                                                  .bookMotarjem
                                                  .toString()
                                              : "",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        addOrRemoveBook(
                                                context: context,
                                                bookId: ShopCardState
                                                    .shopCardList!
                                                    .shopCardItems![index]
                                                    .bookId,
                                                remove: true)
                                            .then(
                                          (value) {
                                            getShopCardList(context: context);
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 70,
                                        height: 30,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.delete_forever,
                                                color: Colors.red,
                                                size: 23,
                                              ),
                                              Text(
                                                'حذف',
                                                style: TextStyle(fontSize: 16),
                                              )
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border:
                                                Border.all(color: Colors.grey)),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          ShopCardState.shopCardList!
                                                      .shopCardItems !=
                                                  null
                                              ? ShopCardState
                                                  .shopCardList!
                                                  .shopCardItems![index]
                                                  .bookPrice
                                                  .toString()
                                              : "",
                                        ),
                                        Text('تومان')
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, bottom: 5, top: 15),
                  child: Container(
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
                                'شیوه پرداخت',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              height: 50,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Checkbox(
                                            fillColor: WidgetStateProperty.all(
                                                primaryColor),
                                            shape: CircleBorder(),
                                            value: true,
                                            onChanged: (value) {},
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'درگاه پرداخت آنلاین',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              'پرداخت با همه کارت های عضوشتاب',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.solidCreditCard,
                                          color: Colors.blue,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade800),
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, bottom: 5, top: 15),
                  child: Container(
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
                                'فاکتور',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Divider(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'جمع کل',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Consumer<ShopCardState>(
                                    builder: (context, value, child) => Text(
                                      '( ${ShopCardState.shopCardList!.shopCardItems != null ? ShopCardState.shopCardList!.shopCardItems!.length.toString() : '0'} عنوان )',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade600),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Consumer<ShopCardState>(
                                    builder: (context, value, child) => Text(
                                      ShopCardState.shopCardList!
                                                  .shopCardItems !=
                                              null
                                          ? ShopCardState.shopCardList!.rawPrice
                                              .toString()
                                          : "",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey.shade600),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'تومان',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade600),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'سود شما از این خرید',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    finalValue.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'تومان',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade600),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'قابل پرداخت',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Consumer<ShopCardState>(
                                    builder: (context, value, child) => Text(
                                      ShopCardState.shopCardList!.totalPrice !=
                                              null
                                          ? ShopCardState
                                              .shopCardList!.totalPrice
                                              .toString()
                                          : "0",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'تومان',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
