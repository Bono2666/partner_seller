import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:partner_seller/pages/home.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:partner_seller/pages/signin.dart';
import 'package:partner_seller/pages/verification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:partner_seller/pages/profile/profile.dart';
import 'package:partner_seller/pages/features.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await prefs.init();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Partner Seller',
          theme: ThemeData(
              fontFamily: 'Josefin Sans',
              shadowColor: const Color(0x32000000),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: Color(0xff757575),
                error: Color(0xffFF2800),

              )
          ),

          initialRoute: prefs.getIsSignIn == false ? '/signin' : '/',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return SlideUpRoute(page: Home());
              case '/signin':
                return SlideUpRoute(page: Signin());
              case '/verification':
                return SlideLeftRoute(page: Verification());
              case '/profile':
                return SlideDownRoute(page: Profile());
              case '/features':
                return SlideDownRoute(page: Features());
            }
            return null;
          },
        );
      },
    );
  }
}

class Globals {
  static String apiBaseUrl = 'http://192.168.0.13:8000/api/';
}

final prefs = SharedPrefs();

class SharedPrefs {
  // ignore: prefer_typing_uninitialized_variables
  var _prefs;

  init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  bool get getIsSignIn => _prefs.getBool('isSignIn') ?? false;
  String get getIsoCode => _prefs.getString('isoCode') ?? '';
  String get getDialCode => _prefs.getString('dialCode') ?? '';
  String get getPhone => _prefs.getString('phone') ?? '';
  String get getBackRoute => _prefs.getString('backRoute') ?? '';

  setIsSignIn(bool value) => _prefs.setBool('isSignIn', value);
  setIsoCode(String value) => _prefs.setString('isoCode', value);
  setDialCode(String value) => _prefs.setString('dialCode', value);
  setPhone(String value) => _prefs.setString('phone', value);
  setBackRoute(String value) => _prefs.setString('backRoute', value);
}

class SlideUpRoute extends PageRouteBuilder {
  final Widget page;

  SlideUpRoute({required this.page}) :super(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
        return SlideTransition(
          position: Tween(
            begin: const Offset(0,1.2),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
        return page;
      }
  );
}

class SlideLeftRoute extends PageRouteBuilder {
  final Widget page;

  SlideLeftRoute({required this.page}) :super(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
        return SlideTransition(
          position: Tween(
            begin: const Offset(1.2,0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
        return page;
      }
  );
}

class SlideDownRoute extends PageRouteBuilder {
  final Widget page;

  SlideDownRoute({required this.page}) :super(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
        return SlideTransition(
          position: Tween(
            begin: const Offset(0,-1.2),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
        return page;
      }
  );
}

class NoSlideRoute extends PageRouteBuilder {
  final Widget page;

  NoSlideRoute({required this.page}) :super(
      transitionDuration: Duration(seconds: 0),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
        return SlideTransition(
          position: Tween(
            begin: Offset.zero,
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
        return page;
      }
  );
}