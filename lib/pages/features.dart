import 'dart:convert';
import 'package:partner_seller/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class Features extends StatefulWidget {
  const Features({Key? key}) : super(key: key);

  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  late List dbChildBook;

  Future getChildBook() async {
    var url = Uri.parse('https://app.empatbulan.com/api/get_childbook.php?phone=${prefs.getPhone}');
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getChildBook(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null || snapshot.hasError) {
            return
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitDoubleBounce(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            dbChildBook = snapshot.data as List;
          }
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.0.w,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 19.0.h,),
                    Text(
                      'AKSES CEPAT',
                      style: TextStyle(
                        fontSize: 12.0.sp,
                        color: Theme.of(context).unselectedWidgetColor,
                      ),
                    ),
                    SizedBox(height: 3.1.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.2.w,),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: SizedBox(
                              width: 16.7.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: 11.1.w,
                                        height: 11.1.w,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.6.w,
                                        height: 5.6.w,
                                        child: FittedBox(
                                          child: Image.asset(
                                            'images/ic_scan.png',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2.0.w,),
                                  Text(
                                    'Scan',
                                    style: TextStyle(
                                      fontSize: 10.0.sp,
                                      color: Colors.black,
                                      height: 1.2,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {

                            },
                            child: SizedBox(
                              width: 16.7.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: 11.1.w,
                                        height: 11.1.w,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.6.w,
                                        height: 5.6.w,
                                        child: FittedBox(
                                          child: Image.asset(
                                            'images/ic_cart.png',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2.0.w,),
                                  Text(
                                    'Keranjang',
                                    style: TextStyle(
                                      fontSize: 10.0.sp,
                                      color: Colors.black,
                                      height: 1.2,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {

                            },
                            child: SizedBox(
                              width: 16.7.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: 11.1.w,
                                        height: 11.1.w,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.6.w,
                                        height: 5.6.w,
                                        child: FittedBox(
                                          child: Image.asset(
                                            'images/ic_inbox.png',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2.5.w,),
                                  Text(
                                    'Inbox',
                                    style: TextStyle(
                                      fontSize: 10.0.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {

                            },
                            child: SizedBox(
                              width: 16.7.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: 11.1.w,
                                        height: 11.1.w,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.6.w,
                                        height: 5.6.w,
                                        child: FittedBox(
                                          child: Image.asset(
                                            'images/ic_buy.png',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2.5.w,),
                                  Text(
                                    'Pesan',
                                    style: TextStyle(
                                      fontSize: 10.0.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.1.h,),
                    Text(
                      'SEMUA FITUR',
                      style: TextStyle(
                        fontSize: 12.0.sp,
                        color: Theme.of(context).unselectedWidgetColor,
                      ),
                    ),
                    SizedBox(height: 3.1.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.2.w,),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            child: SizedBox(
                              width: 16.7.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: 11.1.w,
                                        height: 11.1.w,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.6.w,
                                        height: 5.6.w,
                                        child: FittedBox(
                                          child: Image.asset(
                                            'images/ic_order_1.png',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2.0.w,),
                                  Text(
                                    'Pesanan',
                                    style: TextStyle(
                                      fontSize: 10.0.sp,
                                      color: Colors.black,
                                      height: 1.2,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {

                            },
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {

                            },
                            child: SizedBox(
                              width: 16.7.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: 11.1.w,
                                        height: 11.1.w,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.6.w,
                                        height: 5.6.w,
                                        child: FittedBox(
                                          child: Image.asset(
                                            'images/ic_sales.png',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2.0.w,),
                                  Text(
                                    'Penjualan',
                                    style: TextStyle(
                                      fontSize: 10.0.sp,
                                      color: Colors.black,
                                      height: 1.2,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/kickcounter');
                            },
                            child: SizedBox(
                              width: 16.7.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: 11.1.w,
                                        height: 11.1.w,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.6.w,
                                        height: 5.6.w,
                                        child: FittedBox(
                                          child: Image.asset(
                                            'images/ic_buy.png',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2.0.w,),
                                  Text(
                                    'Pembelian',
                                    style: TextStyle(
                                      fontSize: 10.0.sp,
                                      color: Colors.black,
                                      height: 1.2,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {

                            },
                            child: SizedBox(
                              width: 16.7.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: 11.1.w,
                                        height: 11.1.w,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.6.w,
                                        height: 5.6.w,
                                        child: FittedBox(
                                          child: Image.asset(
                                            'images/ic_stock.png',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2.5.w,),
                                  Text(
                                    'Stok',
                                    style: TextStyle(
                                      fontSize: 10.0.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.4.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.2.w,),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: SizedBox(
                              width: 16.7.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: 11.1.w,
                                        height: 11.1.w,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.6.w,
                                        height: 5.6.w,
                                        child: FittedBox(
                                          child: Image.asset(
                                            'images/ic_member.png',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2.0.w,),
                                  Text(
                                    'Member',
                                    style: TextStyle(
                                      fontSize: 10.0.sp,
                                      color: Colors.black,
                                      height: 1.2,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {

                            },
                            child: SizedBox(
                              width: 16.7.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: 11.1.w,
                                        height: 11.1.w,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.6.w,
                                        height: 5.6.w,
                                        child: FittedBox(
                                          child: Image.asset(
                                            'images/ic_reward.png',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2.0.w,),
                                  Text(
                                    'Reward',
                                    style: TextStyle(
                                      fontSize: 10.0.sp,
                                      color: Colors.black,
                                      height: 1.2,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {

                            },
                            child: SizedBox(
                              width: 16.7.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: 11.1.w,
                                        height: 11.1.w,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.6.w,
                                        height: 5.6.w,
                                        child: FittedBox(
                                          child: Image.asset(
                                            'images/ic_edu.png',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2.0.w,),
                                  Text(
                                    'Edukasi',
                                    style: TextStyle(
                                      fontSize: 10.0.sp,
                                      color: Colors.black,
                                      height: 1.2,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {

                            },
                            child: SizedBox(
                              width: 16.7.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: 11.1.w,
                                        height: 11.1.w,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.6.w,
                                        height: 5.6.w,
                                        child: FittedBox(
                                          child: Image.asset(
                                            'images/ic_kit.png',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2.5.w,),
                                  Text(
                                    'Marketing Kit',
                                    style: TextStyle(
                                      fontSize: 10.0.sp,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 19.0.w,
                  height: 15.0.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      SizedBox(
                        width: 19.0.w,
                        height: 19.0.w,
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 5.2.w,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
