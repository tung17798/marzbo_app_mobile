import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marzbo_app_mobile/presentation/feature/sign_in/view/sign_in_screen.dart';
import 'package:marzbo_app_mobile/resources/app_colors.dart';
import 'package:marzbo_app_mobile/resources/app_dimensions.dart';
import 'package:marzbo_app_mobile/widgets/basic_layout.dart';
import 'package:marzbo_app_mobile/widgets/input/password_field.dart';
import 'package:marzbo_app_mobile/widgets/input/password_input.dart';
import 'package:marzbo_app_mobile/widgets/input/text_input_field.dart';
import 'package:marzbo_app_mobile/widgets/spacing.dart';
import 'package:marzbo_app_mobile/widgets/typography/body_text.dart';
import 'package:marzbo_app_mobile/widgets/typography/heading_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  String PHONE_FIELD = 'phone';
  String PASSWORD_FIELD = 'password';
  String EMAIL_FIELD = 'email';
  String FULLNAME_FIELD = 'fullname';
  bool? _isChecked = false;
  @override
  void initState() {
    super.initState();
    _loadUserphonePassword();
  }

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      key: _formKey,
      automaticallyImplyLeading: true,
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   height: 1 / 3,
              //   child: Image.asset(
              //     'images/Untitled_Artwork.png',
              //     width: 300,
              //     height: 1 / 3,
              //     fit: BoxFit.fill,
              //   ),
              // ),
              Heading1Text(
                "Sign Up",
                color: AppColors.primaryColor500,
                style: TextStyle(
                    fontSize: 32.sp, color: AppColors.primaryColor500),
              ),
              const Spacing(3),
              _buildTextEmailField(),
              const Spacing(1.5),
              _buildTextPhoneField(),
              const Spacing(1.5),
              _buildTextPasswordField(),
              const Spacing(1.5),
              _buildTextFullNameField(),
              const Spacing(1.5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 40.h,
                      child: Theme(
                        data: ThemeData(
                            unselectedWidgetColor: Colors.grey // Your color
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20.w,
                              height: 40.h,
                              child: Transform.scale(
                                scale: 0.8,
                                alignment: Alignment.topCenter,
                                child: Checkbox(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    splashRadius: 1,
                                    checkColor: Colors.white,
                                    activeColor: AppColors.primaryColor500,
                                    hoverColor: Colors.white,
                                    value: _isChecked,
                                    onChanged: _handleRemeberme),
                              ),
                            ),
                            SizedBox(
                              width: 320.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        children: [
                                          TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    'By signing up, you’re agree with our ',
                                                style: TextStyle(
                                                  color: Color(0xff333333),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                            TextSpan(
                                              text: 'Terms & Conditions ',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff407BFF)),
                                            ),
                                            TextSpan(
                                                text: 'and',
                                                style: TextStyle(
                                                  color: Color(0xff333333),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                            TextSpan(
                                              text: 'Privacy Policy',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff407BFF)),
                                            )
                                          ]),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              const Spacing(3),
              const _SignUpButton(),
              const Spacing(3),
              Row(children: <Widget>[
                Expanded(child: Divider()),
                Center(
                  child: BodyText(
                    " Or, sign up with... ",
                    style: TextStyle(
                        color: Color(0xff9A9B9C),
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp),
                  ),
                ),
                Expanded(child: Divider()),
              ]),
              const Spacing(3),
              _buildOtherOptionsLogin(),
              Spacing(3),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BodyMText(
                    'Joined us before?',
                    color: Colors.black,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      },
                      child: BodyXLText(
                        'Login',
                        color: AppColors.primaryBackgroundColor,
                      ))
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ]),
      ),
    );
  }

  PasswordInput _buildTextPasswordField() {
    return PasswordInput(
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints.expand(
          width: 32.w,
          height: 32.h,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.all(2.5),
        labelStyle: TextStyle(
            fontFamily: 'Nunito',
            color: const Color(0xff9A9B9C),
            fontSize: 18.sp,
            fontWeight: FontWeight.w400),
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 8.r),
          child: Image.asset(
            'images/icons/lock-closed.png',
            color: Color(0xff9A9B9C),
          ),
        ),
      ),
      name: PASSWORD_FIELD,
      labelText: 'Password*',
    );
  }

  Widget _buildTextPhoneField() {
    return FormBuilderTextField(
      name: PHONE_FIELD,
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints.expand(
          width: 32.w,
          height: 32.h,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 8.r),
          child: Image.asset(
            'images/icons/call.png',
            color: Color(0xff9A9B9C),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding:
            EdgeInsets.all(2.5), //prefixIconColor: Color(0xff9A9B9C),

        fillColor: Color(0xff9A9B9C),
        labelText: 'Phone number*',
        labelStyle: TextStyle(
            color: const Color(0xff9A9B9C),
            fontSize: 18.sp,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _buildTextEmailField() {
    return FormBuilderTextField(
      name: EMAIL_FIELD,
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints.expand(
          width: 32.w,
          height: 32.h,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 8.r),
          child: Image.asset(
            'images/icons/icon_at.png',
            color: Color(0xff9A9B9C),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.all(2.5), //
        fillColor: Color(0xff9A9B9C),
        labelText: 'Email*',
        labelStyle: TextStyle(
            color: const Color(0xff9A9B9C),
            fontSize: 18.sp,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _buildTextFullNameField() {
    return FormBuilderTextField(
      name: FULLNAME_FIELD,
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints.expand(
          width: 32.w,
          height: 32.h,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            right: 8.r,
          ),
          child: Image.asset(
            'images/icons/person-circle.png',
            color: Color(0xff9A9B9C),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding:
            EdgeInsets.all(2.5), //        fillColor: Color(0xff9A9B9C),
        labelText: 'Full name*',
        labelStyle: TextStyle(
            color: const Color(0xff9A9B9C),
            fontSize: 18.sp,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  void _loadUserphonePassword() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var password = prefs.getString("password") ?? "";

      var remeberMe = prefs.getBool("remember_me") ?? false;
      print(remeberMe);
      print(password);

      if (remeberMe) {
        setState(() {
          _isChecked = true;
        });
        // PASSWORD_FIELD = password;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _handleRemeberme(bool? value) async {
    print("Handle Rember Me");
    _isChecked = value!;

    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('password', PASSWORD_FIELD);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }
}

class _buildOtherOptionsLogin extends StatelessWidget {
  const _buildOtherOptionsLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 161.w,
          height: 46.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xffD9D9D9))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/Facebook.png',
                width: 59.w,
                height: 32.h,
              ),
              BodyText(
                'Facebook',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        Container(
          width: 161.w,
          height: 46.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xffD9D9D9))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/Google.png',
                width: 59.w,
                height: 32.h,
              ),
              BodyText(
                'Google',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: AppDimensions.buttonHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: AppColors.primaryColor500),
          child: BodyLText("Sign Up",
              color: AppColors.textLightColor,
              style: BodyLText.defaultStyle.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              )),
        ),
      ),
    );
  }
}
