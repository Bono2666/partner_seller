import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:partner_seller/main.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List heroImage = [];

  // get hero image using api
  Future getHeroImage() async {
    var response = await http.get(Uri.parse(Globals.apiBaseUrl + 'hero'));
    var jsonData = json.decode(response.body);
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getHeroImage(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData || snapshot.data == null || snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitPulse(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            heroImage = snapshot.data as List;
            heroImage.shuffle();
          }
          return Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 100.0.w,
                          height: 88.8.w,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                            ),
                            child: Image.network(
                              heroImage[0]['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 44.0.w,
                          left: 44.0.w,
                          child: Image.asset(
                            'images/logo.png',
                            width: 50.0.w,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 30.0.w,
                              padding: EdgeInsets.only(right: 74.4.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Stack(
                                        alignment: AlignmentDirectional.topCenter,
                                        children: [
                                          Text(
                                            'Hari ini',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10.0.sp,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 2.4.h,),
                                            child: Text(
                                              DateTime.now().day.toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 36.0.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 1.2.w,),
                                    ],
                                  ),
                                  SizedBox(width: 1.4.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      RotatedBox(
                                        quarterTurns: 3,
                                        child: Text(
                                          DateFormat('MMM yyyy', 'id_ID').format(DateTime.now()),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.0.sp,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4.4.w,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 6.6.w, top: 5.6.h,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {

                          },
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Opacity(
                                opacity: .8,
                                child: Container(
                                  width: 12.5.w,
                                  height: 12.5.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Theme.of(context).shadowColor,
                                        blurRadius: 6.0,
                                        offset: const Offset(0,3),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.6.w,
                                height: 5.6.w,
                                child: FittedBox(
                                  child: Image.asset('images/ic_help.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 2.2.w,),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Opacity(
                                opacity: .8,
                                child: Container(
                                  width: 12.5.w,
                                  height: 12.5.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Theme.of(context).shadowColor,
                                        blurRadius: 6.0,
                                        offset: const Offset(0,3),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.6.w,
                                height: 5.6.w,
                                child: FittedBox(
                                  child: Image.asset('images/ic_profile.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 2.2.w,),
                        InkWell(
                          onTap: () {
                            prefs.setBackRoute('/home');
                            Navigator.pushNamed(context, '/features');
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Opacity(
                                opacity: .8,
                                child: Container(
                                  width: 12.5.w,
                                  height: 12.5.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Theme.of(context).shadowColor,
                                        blurRadius: 6.0,
                                        offset: const Offset(0,3),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.6.w,
                                height: 5.6.w,
                                child: FittedBox(
                                  child: Image.asset('images/ic_menu.png'),
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
            ],
          );
        },
      ),
    );
  }
}
