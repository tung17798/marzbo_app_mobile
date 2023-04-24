import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marzbo_app_mobile/presentation/feature/home_page/view/flow_chart_homepage.dart';
import 'package:marzbo_app_mobile/presentation/feature/home_page/view/list_activity_home_page.dart';
import 'package:marzbo_app_mobile/presentation/feature/utils/size_config.dart';
import 'package:marzbo_app_mobile/resources/app_colors.dart';
import 'package:marzbo_app_mobile/resources/app_dimensions.dart';
import 'package:marzbo_app_mobile/widgets/basic_layout.dart';
import 'package:marzbo_app_mobile/widgets/spacing.dart';
import 'package:marzbo_app_mobile/widgets/typography/body_text.dart';

class BottomTabbar extends StatefulWidget {
  const BottomTabbar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomTabbar> createState() => _BottomTabbarState();
}

class _BottomTabbarState extends State<BottomTabbar> {
  int _selectedIndex = 0;
  final List<Widget> pages = [
    const HomePageScreen(),
    Container(),
    Container(),
    Container(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return BasicLayout(
          color: Colors.white,
          headerVisible: false,
          bottomNavigationBar: Theme(
            data: ThemeData(
              canvasColor: Colors.white,
            ),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Container(
                      width: 52.w,
                      height: 52.h,
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _selectedIndex == 0
                              ? Color(0xff1D3557)
                              : Colors.transparent,
                        ),
                        color: _selectedIndex == 0
                            ? Color(0xff1D3557)
                            : Colors.transparent,
                      ),
                      child: ImageIcon(
                        AssetImage("images/icons/Group 415.png"),
                        size: 20.sp,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      width: 52.w,
                      height: 52.h,
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _selectedIndex == 1
                              ? Color(0xff1D3557)
                              : Colors.transparent,
                        ),
                        color: _selectedIndex == 1
                            ? Color(0xff1D3557)
                            : Colors.transparent,
                      ),
                      child: ImageIcon(
                        AssetImage("images/style=fill.png"),
                        size: 20.sp,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      width: 52.w,
                      height: 52.h,
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _selectedIndex == 2
                              ? Color(0xff1D3557)
                              : Colors.transparent,
                        ),
                        color: _selectedIndex == 2
                            ? Color(0xff1D3557)
                            : Colors.transparent,
                      ),
                      child: ImageIcon(
                        AssetImage("images/icons/calendar.png"),
                        size: 20.sp,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      width: 52.w,
                      height: 52.h,
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _selectedIndex == 3
                              ? Color(0xff1D3557)
                              : Colors.transparent,
                        ),
                        color: _selectedIndex == 3
                            ? Color(0xff1D3557)
                            : Colors.transparent,
                      ),
                      child: ImageIcon(
                        AssetImage("images/icons/reorder-three (1).png"),
                        size: 20.sp,
                      ),
                    ),
                    label: ''),
              ],
              selectedIconTheme: IconThemeData(
                color: Colors.white,
                size: 20.sp,
              ),
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedIconTheme: const IconThemeData(
                color: Colors.grey,
              ),
              type: BottomNavigationBarType.shifting,
            ),
          ),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  floating: true,
                  snap: true,
                  forceElevated: innerBoxIsScrolled,
                  automaticallyImplyLeading: true,
                  backgroundColor: Colors.white,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(0.h),
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.roundedRadius),
                              child: Image(
                                image: const AssetImage(
                                  'images/icons/logo.png',
                                ),
                                height: 40.h,
                              )),
                          _buildHomeAction(),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Scaffold(
              body: IndexedStack(
                index: _selectedIndex,
                children: pages,
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _buildHomeAction() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: const Color(0xffF7F7F9),
              border: Border.all(color: const Color(0xffF7F7F9)),
              borderRadius:
                  BorderRadius.circular(AppDimensions.defaultSRadius)),
          child: IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage('images/icons/search.png'),
            ),
          )),
      Container(
          margin: EdgeInsets.only(left: 10.r, right: 10.r),
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: const Color(0xffF7F7F9),
              border: Border.all(color: const Color(0xffF7F7F9)),
              borderRadius:
                  BorderRadius.circular(AppDimensions.defaultSRadius)),
          child: IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage('images/icons/notifications.png'),
            ),
          )),
      ClipRRect(
          borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
          child: InkWell(
            child: Image(
              image: const AssetImage(
                'images/icons/avataruser.png',
              ),
              height: 40.h,
            ),
          )),
    ],
  );
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      padding: EdgeInsets.zero,
      headerVisible: false,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Spacing(1.r),
            const FlowchartView(),
            Spacing(2.r),
            const ListActivityHomePage()
          ],
        ),
      ),
    );
  }
}

class AppBarHome extends StatelessWidget {
  final VoidCallback? onAvatarPressed;
  final String? userName;
  const AppBarHome({Key? key, this.onAvatarPressed, this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: AppColors.primaryLightColor,
      centerTitle: false,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.roundedRadius),
                  child: Image(
                    image: const AssetImage(
                      'images/icons/logo.png',
                    ),
                    height: 40.h,
                  )),
              _buildHomeAction(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: const Color(0xffF7F7F9),
                border: Border.all(color: const Color(0xffF7F7F9)),
                borderRadius:
                    BorderRadius.circular(AppDimensions.defaultSRadius)),
            child: IconButton(
              onPressed: () {},
              icon: const ImageIcon(
                AssetImage('images/icons/search.png'),
              ),
            )),
        Container(
            margin: EdgeInsets.only(left: 10.r, right: 10.r),
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: const Color(0xffF7F7F9),
                border: Border.all(color: const Color(0xffF7F7F9)),
                borderRadius:
                    BorderRadius.circular(AppDimensions.defaultSRadius)),
            child: IconButton(
              onPressed: () {},
              icon: const ImageIcon(
                AssetImage('images/icons/notifications.png'),
              ),
            )),
        ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
            child: InkWell(
              child: Image(
                image: const AssetImage(
                  'images/icons/avataruser.png',
                ),
                height: 40.h,
              ),
            )),
      ],
    );
  }
}
