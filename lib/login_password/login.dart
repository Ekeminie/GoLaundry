import 'package:anywash/login_password/forgot.dart';
import 'package:anywash/login_password/login.vm.dart';
import 'package:anywash/login_password/register.dart';
import 'package:anywash/ui/base.ui.dart';
import 'package:anywash/utils/keyboard-utils.dart';
import 'package:anywash/widgets/custom_button.dart';
import 'package:anywash/widgets/phone_input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/itextfield.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return BaseView<LoginViewModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: notifire.getprimerycolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height / 13,
              ),
              Image.asset(
                "image/login.png",
                height: height / 4,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 15),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          CustomStrings.login,
                          style: TextStyle(
                              fontFamily: 'Gilroy Bold',
                              color: notifire.getdarkscolor,
                              fontSize: height / 25),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 30,
              ),
              // Row(
              //   children: [
              //     SizedBox(
              //       width: width / 20,
              //     ),
              //     const Icon(
              //       Icons.alternate_email,
              //       color: Colors.grey,
              //     ),
              //     SizedBox(
              //       width: width / 40,
              //     ),
              //     Customtextfild.textField(
              //         "Phone Number", notifire.getwhitecolor, width / 1.3,
              //         controller: model.phoneController),
              //   ],
              // ),
              SizedBox(
                height: height / 30,
              ),
              MobileInput(
                onChanged: (v) => model.setPhone(v),
                onIsoChanged: (v) {},
              ),
              SizedBox(
                height: height / 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width / 20,
                  ),
                  const Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: width / 40,
                  ),
                  Container(
                    color: Colors.transparent,
                    height: height / 20,
                    width: width / 1.3,
                    child: Customtextfild2.textField(
                      "Password",
                      notifire.getwhitecolor,
                      GestureDetector(
                          onTap: () {
                            _toggle();
                          },
                          child: _obscureText
                              ? const Icon(Icons.remove_red_eye_rounded)
                              : const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.grey,
                                )),
                      _obscureText,
                      controller: model.pinController,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 30,
              ),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        const Forgot(),
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Text(
                        CustomStrings.forgot,
                        style: TextStyle(
                            fontFamily: 'Gilroy Bold',
                            color: notifire.getprocolor,
                            fontSize: height / 50),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 20,
                  ),
                ],
              ),
              SizedBox(
                height: height / 30,
              ),
              UiButton(
                text: "Login",
                onPressed: (model.isValidEntries)
                    ? () {
                        killKeyboard(context);
                        if (kDebugMode) {
                          print("phone ${model.phoneNumber}");
                        }
                        model.loginUser();
                        // Navigator.pushNamed(context, PageRoutes.accountPage);
                      }
                    : () => model.showErrorMessage(),
                loadingState: model.viewState,
              ),

              SizedBox(
                height: height / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    CustomStrings.newto,
                    style: TextStyle(
                        fontFamily: 'Gilroy Medium',
                        color: Colors.grey,
                        fontSize: height / 50),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        const Register(),
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Text(
                        CustomStrings.register,
                        style: TextStyle(
                            fontFamily: 'Gilroy Medium',
                            color: notifire.getprocolor,
                            fontSize: height / 50),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
