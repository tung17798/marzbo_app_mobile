
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marzbo_app_mobile/presentation/feature/sign_in/view/sign_in_screen.dart';
import 'package:marzbo_app_mobile/resources/app_colors.dart';
import 'package:marzbo_app_mobile/resources/app_dimensions.dart';
import 'package:marzbo_app_mobile/widgets/basic_layout.dart';
import 'package:marzbo_app_mobile/widgets/spacing.dart';
import 'package:marzbo_app_mobile/widgets/typography/body_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      safeTopPadding: false,
      color: Colors.white,
      automaticallyImplyLeading: false,
      headerVisible: false,
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  bottom: 90.r,
                  left: 35.r,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      tabbarView(),
                      SizedBox(
                          height: 10,
                          child: TabBar(
                            indicator: BoxDecoration(
                              color: Color(0xff272727),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            labelPadding: EdgeInsets.all(3),
                            labelColor: Color(0xff828282),
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Color(0xff828282),
                            controller: _tabController,
                            isScrollable: true,
                            tabs: <Widget>[
                              Tab(
                                child: Container(
                                  width: 30.w,
                                  height: 10.h,
                                ),
                              ),
                              Tab(
                                child: Container(
                                  width: 30.w,
                                  height: 10.h,
                                ),
                              ),
                              Tab(
                                child: Container(
                                  width: 30.w,
                                  height: 20.h,
                                ),
                              ),
                              Tab(
                                child: Container(),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  child: Positioned(
                    top: 160.r,
                    right: 40.r,
                    left: -10,
                    child: SizedBox(
                        height: 393.h,
                        width: 458.w,
                        child: Image.asset('images/illustration 1.png')),
                  ),
                ),
                Positioned(
                  top: -200.r,
                  left: -160.r,
                  right: 40.r,
                  child: Image.asset('images/Group 411.png'),
                ),
                Positioned(
                  left: 90.r,
                  bottom: 260.r,
                  child: Image.asset(
                    'images/Work In Beanbag.png',
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 16.r, right: 16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 79.w,
                      height: 33.h,
                      child: _SkipButton(
                        onTapToNext: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                        },
                      )),
                  Container(
                      width: 79.w,
                      height: 33.h,
                      child: _NextButton(
                        onTapToNext: () {
                          _tabController
                              .animateTo((_tabController.index + 1) % 4);
                          if (_tabController.index == 3) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()));
                          }
                        },
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tabbarView() {
    return Container(
      width: 300.w,
      height: 200.h,
      child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyLText(
                  'L1',
                  style: TextStyle(
                      color: Color(0xff414D54),
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700),
                ),
                Spacing(0.5),
                SizedBox(
                  child: BodyMText(
                    'Our goal is to ensure that you have everything you need to feel comfortable, confident, and ready to make an impact.',
                    maxLines: 5,
                  ),
                )
              ],
            ),
          ),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Text('2'),
          ),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyLText(
                  'Let"s Get Started',
                  style: TextStyle(
                      color: Color(0xff414D54),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700),
                ),
                Spacing(0.5),
                SizedBox(
                  child: BodyMText(
                      'Our goal is to ensure that you have everything\nyou need to feel comfortable, confident, and \nready to make an impact.'),
                )
              ],
            ),
          ),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({
    super.key,
    required this.onTapToNext,
  });
  final Function() onTapToNext;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
        onTap: onTapToNext,
        child: Container(
          width: 79.w,
          height: 33.h,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              BodyLText("Next",
                  textAlign: TextAlign.center,
                  color: AppColors.textLightColor,
                  style: BodyLText.defaultStyle.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  const _SkipButton({
    super.key,
    required this.onTapToNext,
  });
  final Function() onTapToNext;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTapToNext,
        child: Container(
          width: 79.w,
          height: 33.h,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BodyLText("Skip",
                  textAlign: TextAlign.center,
                  color: Color(0xff1D3557),
                  style: BodyLText.defaultStyle.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  )),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
