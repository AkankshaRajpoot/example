import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../shared/views/layouts/AuthLayout.dart';
import '../../../shared/views/layouts/ResponsiveUi.dart';
import '../../Modules.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (LoginController controller) {
          return ResponsiveUi(
            mobile: MobileLogin(
              controller: controller,
            ),
            tablet: TabletLogin(
              controller: controller,
            ),
          );
        });
  }
}



///+++++++++++++++++++++++++
///Mobile
///+++++++++++++++++++++++++
class MobileLogin extends StatelessWidget {
  const MobileLogin({super.key, required this.controller});
  final LoginController controller;
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
        backgroundColor: kcWhite,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: kcDarkAlt.withOpacity(0.1),
                      image: DecorationImage(
                      image: AssetImage('assets/placeholders/hotel-icon.png'),
                      fit: BoxFit.contain)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 0.5,
                      width: 100,
                      color: kcDarkAlt,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        child: Text(
                          "Get Started",
                          style: TextStyle(color: kcBlack, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 0.5,
                      width: 100,
                      color: kcDarkAlt,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17, vertical: 25),
                  decoration: BoxDecoration(
                      color: kcWhite, borderRadius: BorderRadius.circular(5), border: Border.all(color: kcDarkAlt.withOpacity(0.5))),
                  child: Row(
                    children: [
                      CountryListPick(
                        // To disable option set to false
                          theme: CountryTheme(
                            isShowFlag: false,
                            isShowTitle: false,
                            isShowCode: true,
                            isDownIcon: true,
                            showEnglishName: true,
                          ),
                          // Set default value
                          // or
                          // initialSelection: 'US'
                          onChanged: (CountryCode? code) async {
                            print(code?.name);
                            print(code?.code);
                            print(code?.dialCode);
                            print(code?.flagUri);
                            controller.onSelectCountryCode(code!.dialCode!);
                          },
                          // Whether to allow the widget to set a custom UI overlay
                          useUiOverlay: false,
                          // Whether the country list should be wrapped in a SafeArea
                          useSafeArea: false),
                      Container(
                        height: 25,
                        width: 1.5,
                        color: kcDarkAlt.withOpacity(0.3),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.phoneInput,
                          validator: (value) =>
                              Validator("Phone Number", value!)
                                  .required()
                                  .min(10)
                                  .max(12)
                                  .validate(),
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: kcWhite.withOpacity(0.6),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Phone Number",
                            prefixStyle: TextStyle(color: kcDarkAlt),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                            hintStyle: TextStyle(color: kcDarkAlt.withOpacity(0.8), fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    controller.store();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 90, vertical: 10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: kcButton),
                    child: Text(
                      "Continue",
                      style: TextStyle(color: kcWhite, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 0.5,
                      width: 145,
                      color: kcDarkAlt,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("or"),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 0.5,
                      width: 145,
                      color: kcDarkAlt,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 25,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/google.png'),
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'By continuing,you agree to our',
                      style: TextStyle(fontSize: 12, color: kcBlack),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            launch("https://www.defenzelite.com/page/terms");
                          },
                          child: Text(
                            'Terms & Conditions,',
                            style: TextStyle(fontSize: 12, color: kcBlack),
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: () {
                            launch("https://www.defenzelite.com/page/data-privacy");
                          },
                          child: Text(
                            'Privacy Policy,',
                            style: TextStyle(fontSize: 12, color: kcBlack),
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: () {
                            launch("https://www.defenzelite.com/page/payment-policy");
                          },
                          child: Text(
                            'Payment Policy',
                            style: TextStyle(fontSize: 12, color: kcBlack),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}



///+++++++++++++++++++++++++
///Tablet
///+++++++++++++++++++++++++
class TabletLogin extends StatelessWidget {
  const TabletLogin({super.key, required this.controller});
  final LoginController controller;
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
        backgroundColor: kcWhite,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: kcDarkAlt.withOpacity(0.1),
                      image: DecorationImage(
                          image: AssetImage('assets/placeholders/hotel-icon.png'),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 0.5,
                      width: 100,
                      color: kcDarkAlt,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        child: Text(
                          "Get Started",
                          style: TextStyle(color: kcBlack, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 0.5,
                      width: 100,
                      color: kcDarkAlt,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17, vertical: 25),
                  decoration: BoxDecoration(
                      color: kcWhite, borderRadius: BorderRadius.circular(5), border: Border.all(color: kcDarkAlt.withOpacity(0.5))),
                  child: Row(
                    children: [
                      CountryListPick(
                        // To disable option set to false
                          theme: CountryTheme(
                            isShowFlag: false,
                            isShowTitle: false,
                            isShowCode: true,
                            isDownIcon: true,
                            showEnglishName: true,
                          ),
                          // Set default value
                          // or
                          // initialSelection: 'US'
                          onChanged: (CountryCode? code) async {
                            print(code?.name);
                            print(code?.code);
                            print(code?.dialCode);
                            print(code?.flagUri);
                            controller.onSelectCountryCode(code!.dialCode!);
                          },
                          // Whether to allow the widget to set a custom UI overlay
                          useUiOverlay: false,
                          // Whether the country list should be wrapped in a SafeArea
                          useSafeArea: false),
                      Container(
                        height: 25,
                        width: 1.5,
                        color: kcDarkAlt.withOpacity(0.3),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.phoneInput,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: kcWhite.withOpacity(0.6),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Phone Number",
                            prefixStyle: TextStyle(color: kcDarkAlt),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                            hintStyle: TextStyle(color: kcDarkAlt.withOpacity(0.8), fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    controller.store();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 90, vertical: 10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: kcButton),
                    child: Text(
                      "Continue",
                      style: TextStyle(color: kcWhite, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 0.5,
                      width: 145,
                      color: kcDarkAlt,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("or"),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 0.5,
                      width: 145,
                      color: kcDarkAlt,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 25,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/google.png'),
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'By continuing,you agree to our',
                      style: TextStyle(fontSize: 12, color: kcBlack),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            launch("https://www.defenzelite.com/page/terms");
                          },
                          child: Text(
                            'Terms & Conditions,',
                            style: TextStyle(fontSize: 12, color: kcBlack),
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: () {
                            launch("https://www.defenzelite.com/page/data-privacy");
                          },
                          child: Text(
                            'Privacy Policy,',
                            style: TextStyle(fontSize: 12, color: kcBlack),
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: () {
                            launch("https://www.defenzelite.com/page/payment-policy");
                          },
                          child: Text(
                            'Payment Policy',
                            style: TextStyle(fontSize: 12, color: kcBlack),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
