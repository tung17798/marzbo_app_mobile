import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marzbo_app_mobile/presentation/feature/report_schedule/view/draggable_button.dart';
import 'package:marzbo_app_mobile/widgets/basic_layout.dart';
import 'package:marzbo_app_mobile/widgets/spacing.dart';
import 'package:rxdart/rxdart.dart';

class ReportScheduleScreens extends StatefulWidget {
  const ReportScheduleScreens({super.key});

  @override
  State<ReportScheduleScreens> createState() => _ReportScheduleScreensState();
}

class _ReportScheduleScreensState extends State<ReportScheduleScreens>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _tabController1;
  late TabController _tabController2;

  int? _selectedIndex;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    _tabController1 = TabController(
      length: 3,
      vsync: this,
    );
    _tabController2 = TabController(
      length: 3,
      vsync: this,
    );
    _ButtonAccountSocialStream.add(_tabController.index);
  }

  @override
  Widget build(BuildContext context) {
    return _buidScreensReportSchedule();
  }

  final BehaviorSubject<int> _ButtonAccountSocialStream = BehaviorSubject();

  void _onItemTapped1(int index) {
    _ButtonAccountSocialStream.add(index);
  }

  _buidScreensReportSchedule() {
    return BasicLayout(
        headerVisible: false,
        padding: EdgeInsets.zero,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 317.w,
                  child: TabBar(
                      onTap: (int index) {
                        _onItemTapped1(index);
                        _buildTabViewforAccountStream.add(index);
                      },
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: _tabController,
                      isScrollable: true,
                      indicator: const BoxDecoration(),
                      tabs: List.generate(_tabController.length,
                          (index) => _buildButtonAccountSocial(index)))),
              Spacing(1.r),
              _buildTabViewforAccount(),
            ],
          ),
        ));
  }

  _buildButtonAccountSocial(int index) {
    return StreamBuilder(
        stream: _ButtonAccountSocialStream,
        builder: (context, snapshot) {
          _selectedIndex = snapshot.data;
          return Padding(
            padding: EdgeInsets.only(right: 4.r, left: 4.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      width: 35.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: NetworkImage(
                              'https://i.pinimg.com/originals/06/f7/10/06f7106bf92ab8f3029f3f780f63e181.jpg',
                            ),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                        border: _selectedIndex == index
                            ? Border.all(
                                color: const Color(0xffA8DADC), width: 2.w)
                            : const Border(),
                      ),
                    ),
                    Positioned(
                      child: Image.asset(
                        'images/iconInstaInstagram.png',
                        width: 14.w,
                        height: 14.h,
                      ),
                    )
                  ],
                ),
                Text(
                  '_linniethao',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Nunito'),
                ),
              ],
            ),
          );
        });
  }

  final BehaviorSubject<int> _buildTabViewforAccountStream = BehaviorSubject();

  _buildTabViewforAccount() {
    return StreamBuilder<int>(
        stream: _buildTabViewforAccountStream,
        builder: (context, snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 317.w,
                    height: 34.h,
                    child: TabBarView(
                      controller: _tabController,
                      children: List.generate(
                        _tabController1.length,
                        (index) => _buildTabarForDetailAccount(),
                      ),
                    )),
                SizedBox(
                  width: 317.w,
                  height: 488.h,
                  child: _buildTabViewForDetailAccount(),
                )
              ],
            ),
          );
        });
  }

  _buildTabarForDetailAccount() {
    return Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal:
                  BorderSide(color: const Color(0xffBCBCBC), width: 0.5.w)),
        ),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabController1,
          isScrollable: false,
          labelColor: const Color(0xffA8DADC),
          labelStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800),
          unselectedLabelStyle:
              TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
          unselectedLabelColor: Colors.black,
          indicatorColor: const Color(0xffA8DADC),
          tabs: <Widget>[
            SizedBox(
              width: 93.w,
              child: const Tab(
                icon: Text(
                  'Calendar',
                ),
              ),
            ),
            SizedBox(
              width: 93.w,
              child: const Tab(
                icon: Text(
                  'List',
                ),
              ),
            ),
            SizedBox(
              width: 93.w,
              child: const Tab(
                icon: Text(
                  'Preview',
                ),
              ),
            ),
          ],
        ));
  }

  _buildTabViewForDetailAccount() {
    return TabBarView(controller: _tabController1, children: [
      const Center(
        child: Text("It's sunny here"),
      ),
      _buildTabarDetailForList(),
      const Center(
        child: Text("It's sunny here"),
      ),
    ]);
  }

  Widget _buildTabarDetailForList() {
    return Container(
      width: 317.w,
      child: Column(children: [
        Spacing(1.r),
        Container(
            width: 298.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: const Color(0xffF7F7F9),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xffF7F7F9)),
            ),
            child: TabBar(
              dividerColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  color: const Color(0xffA8DADC),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xffA8DADC))),
              controller: _tabController2,
              isScrollable: false,
              labelColor: Colors.black,
              labelStyle:
                  TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800),
              unselectedLabelStyle:
                  TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
              unselectedLabelColor: Colors.black,
              indicatorColor: const Color(0xffA8DADC),
              tabs: <Widget>[
                SizedBox(
                  width: 93.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Tab(text: 'Drafts'),
                      Positioned(
                        right: 0.0.r,
                        top: 5.0.r,
                        bottom: 5.0.r,
                        child: VerticalDivider(
                          width: 2.0.w,
                          color: const Color(0xff9A9B9C),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 93.w,
                  child: const Tab(
                    icon: Text(
                      'Scheduled',
                    ),
                  ),
                ),
                SizedBox(
                  width: 93.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Tab(text: 'Published'),
                      Positioned(
                        left: 0.0.r,
                        top: 5.0.r,
                        bottom: 5.0.r,
                        child: VerticalDivider(
                          width: 2.0.w,
                          color: const Color(0xff9A9B9C),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Spacing(1.r),
        Container(
          width: 317.w,
          height: 428.h,
          child: _buildTabViewForDetailForList(),
        )
      ]),
    );
  }

  _buildTabViewForDetailForList() {
    return TabBarView(controller: _tabController2, children: [
      const Center(
        child: Text("It's sunny here"),
      ),
      _buildListPostForDrafts(),
      const Center(
        child: Text("It's sunny here"),
      ),
    ]);
  }

  _buildListPostForDrafts() {
    return Container(
      width: 317.w,
      child: ListView.builder(itemBuilder: (context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12.r),
          decoration: BoxDecoration(
              color: index % 2 == 0 ? Colors.white : Color(0xffF9F9F9),
              border: Border(
                  bottom: BorderSide(color: Color(0xffBCBCBC), width: 0.5.w))),
          width: 295.w,
          height: 90.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Apr 14 13:00 PM',
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.r),
                    child: Text(
                      'Hi, we are into.eight from now on....',
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff9A9B9C)),
                    ),
                  ),
                  Text(
                    '#abc',
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff9A9B9C)),
                  )
                ],
              ),
              Image.network(
                'https://i.pinimg.com/564x/6b/f5/36/6bf536136b07a58f42a56d061380ac38.jpg',
                width: 65.w,
                height: 65.h,
              )
            ],
          ),
        );
      }),
    );
  }
}
// FloatingDraggableWidget(
//       floatingWidget: FloatingActionButton(
//         onPressed: () {},
//         child: const Icon(Icons.add, size: 50),
//       ),
//       deleteWidgetAnimationCurve: Curves.linear,
//       floatingWidgetHeight: 90,
//       floatingWidgetWidth: 90,
//       deleteWidgetDecoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Colors.white12, Colors.grey],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           stops: [.0, 1],
//         ),
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(50),
//           topRight: Radius.circular(50),
//         ),
//       ),
//       deleteWidget: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(width: 2, color: Colors.black87),
//         ),
//         child: const Icon(Icons.close, color: Colors.black87),
//       ),
//       onDeleteWidget: () {
//         debugPrint('Widget deleted');
//       },
//       // autoAlign: true,
//       mainScreenWidget: BasicLayout(
//         automaticallyImplyLeading: true,
//         padding: EdgeInsets.zero,
//         child:
//       ),
//     )
