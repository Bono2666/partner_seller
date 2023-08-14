import 'package:partner_seller/main.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String phone = '', isoCode = 'ID', dialCode = '+62';
  bool isPhoneError = false;

  Future findMember(String phone) async {
    var response = await http.get(Uri.parse(Globals.apiBaseUrl + 'phone/' + phone));
    var jsonData = json.decode(response.body);
    return jsonData;
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
    gestures: const [
      GestureType.onTap,
      GestureType.onVerticalDragDown,
    ],
    child: Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.0.w,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.0.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0.8.w),
                        child: Text(
                          'Nomor Ponsel',
                          style: TextStyle(
                            fontSize: 13.0.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 1.1.w,),
                      Container(
                        width: 1.7.w,
                        height: 1.7.w,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.error,
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.3.h,),
                  InternationalPhoneNumberInput(
                    onInputChanged: (value) {
                      phone = value.phoneNumber!;
                      isoCode = value.isoCode!;
                      dialCode = value.dialCode!;
                    },
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      trailingSpace: false,
                    ),
                    keyboardType: TextInputType.phone,
                    selectorTextStyle: TextStyle(
                      fontSize: 20.0.sp,
                    ),
                    hintText: '',
                    textStyle: TextStyle(
                      fontSize: 20.0.sp,
                    ),
                    initialValue: PhoneNumber(isoCode: isoCode, phoneNumber: phone),
                    maxLength: 15,
                    searchBoxDecoration: InputDecoration(
                      hintText: 'Cari nama atau kode negara',
                      contentPadding: EdgeInsets.only(left: 4.8.w,),
                      alignLabelWithHint: false,
                    ),
                  ),
                  SizedBox(height: 11.3.h,),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 12.0.h, left: 7.0.w),
                child: Image.asset('images/logo.png', width: 50.0.w,),
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async {
                      var memberData = await findMember(phone);
                      if (memberData.isNotEmpty) {
                        prefs.setIsoCode(isoCode);
                        prefs.setDialCode(dialCode);
                        prefs.setPhone(phone);
                        Navigator.pushReplacementNamed(context, '/verification');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              'Nomor Ponsel belum terdaftar. Hubungi Admin.',
                              style: TextStyle(
                                fontFamily: 'Josefin Sans',
                              ),
                            ),
                            backgroundColor: Theme.of(context).colorScheme.error,
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 74.0.w,
                      height: 12.0.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Lanjutkan',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
