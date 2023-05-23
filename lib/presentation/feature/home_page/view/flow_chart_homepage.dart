import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:marzbo_app_mobile/resources/app_colors.dart';
import 'package:marzbo_app_mobile/resources/app_dimensions.dart';
import 'package:marzbo_app_mobile/widgets/spacing.dart';
import 'package:marzbo_app_mobile/widgets/typography/body_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FlowchartView extends StatefulWidget {
  const FlowchartView({super.key});

  @override
  State<FlowchartView> createState() => _FlowchartViewState();
}

class _FlowchartViewState extends State<FlowchartView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(AppDimensions.defaultXSPadding),
        decoration: BoxDecoration(
            color: const Color(0xffF7F7F9),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xffF7F7F9))),
        width: 317.w,
        child: Column(
          children: [
            tabbarView(),
            SizedBox(
                width: 44.w,
                height: 8.h,
                child: TabBar(
                  indicator: BoxDecoration(
                    color: const Color(0xff272727),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelPadding: const EdgeInsets.all(3),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.black,
                  controller: _tabController,
                  isScrollable: true,
                  unselectedLabelColor: Colors.black,
                  tabs: <Widget>[
                    Tab(
                      child: SizedBox(
                        width: 8.r,
                        child: null,
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        width: 8.r,
                        child: null,
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }

  Widget tabbarView() {
    return SizedBox(
        height: 600.h,
        child: TabBarView(controller: _tabController, children: <Widget>[
          MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: const FlowChartHomePage()),
          MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: const FlowChartHomePage())
        ]));
  }
}

class FlowChartHomePage extends StatelessWidget {
  const FlowChartHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFormFlowChart(),
      ],
    );
  }

  Column _buildFormFlowChart() {
    return Column(children: [
      _buidHeaderFlowchart(),
      Spacing(1.r),
      _buildLineFlowChart(),
      Spacing(1.r),
      Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 5.r),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffA8DADC),
                        borderRadius: BorderRadius.circular(2.r),
                        border: Border.all(color: const Color(0xffA8DADC))),
                    width: 10.w,
                    height: 10.h,
                  )),
              BodyText(
                'Views',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Nunito'),
              )
            ],
          ),
          Spacing(
            1.r,
            direction: SpacingDirection.Horizontal,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 5.r),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffE63946),
                        borderRadius: BorderRadius.circular(2.r),
                        border: Border.all(color: const Color(0xffE63946))),
                    width: 10.w,
                    height: 10.h,
                  )),
              BodyText(
                'Likes',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Nunito'),
              )
            ],
          ),
        ],
      ),
      Padding(
        padding:
            EdgeInsets.only(top: 11.r, bottom: 20.r, left: 10.r, right: 10.r),
        child: const Divider(
          thickness: 1,
          color: Color(0xffD9D9DD),
        ),
      ),
      _buildNumberOfPerformance()
    ]);
  }

  Widget _buildNumberOfPerformance() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 140.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: const Color(0xffEBEAF1),
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: const Color(0xffEBEAF1))),
            child: Container(
              padding: EdgeInsets.only(left: 5.r, right: 5.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/style=fill.png',
                    width: 16.w,
                    height: 16.h,
                  ),
                  SizedBox(
                    width: 91.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BodyLText(
                          'Post published',
                          color: const Color(0xff9A9B9C),
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w700),
                        ),
                        Spacing(0.2.r),
                        BodyLText(
                          '10',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'images/icons/style=outline.png',
                    width: 12.w,
                    height: 12.h,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 140.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: const Color(0xffEBEAF1),
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: const Color(0xffEBEAF1))),
            child: Container(
              padding: EdgeInsets.only(left: 5.r, right: 5.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/style=fill.png',
                    width: 16.w,
                    height: 16.h,
                  ),
                  SizedBox(
                    width: 91.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BodyLText(
                          'Total likes',
                          color: const Color(0xff9A9B9C),
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w700),
                        ),
                        Spacing(0.2.r),
                        BodyLText(
                          '3.456K',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'images/icons/style=outline.png',
                    width: 12.w,
                    height: 12.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      Spacing(1.r),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 140.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: const Color(0xffEBEAF1),
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: const Color(0xffEBEAF1))),
            child: Container(
              padding: EdgeInsets.only(left: 5.r, right: 5.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/icons/arrow-redo.png',
                    width: 16.w,
                    height: 16.h,
                  ),
                  SizedBox(
                    width: 91.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BodyLText(
                          'Total shares',
                          color: const Color(0xff9A9B9C),
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w700),
                        ),
                        Spacing(0.2.r),
                        BodyLText(
                          '879.2K',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'images/icons/style=outline.png',
                    width: 12.w,
                    height: 12.h,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 140.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: const Color(0xffEBEAF1),
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: const Color(0xffEBEAF1))),
            child: Container(
              padding: EdgeInsets.only(left: 5.r, right: 5.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/style=fill.png',
                    width: 16.w,
                    height: 16.h,
                  ),
                  SizedBox(
                    width: 91.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BodyLText(
                          'Average like post',
                          color: const Color(0xff9A9B9C),
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w700),
                        ),
                        Spacing(0.2.r),
                        BodyLText(
                          '543',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'images/icons/style=outline.png',
                    width: 12.w,
                    height: 12.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    ]);
  }

  Widget _buidHeaderFlowchart() {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30.h,
                decoration: BoxDecoration(
                    color: const Color(0xffA8DADC),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xffA8DADC))),
                child: Padding(
                  padding: EdgeInsets.only(right: 13.r, left: 9.r),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.r),
                          child: Image.asset(
                            'images/Subtract.png',
                            width: 16.w,
                            height: 16.h,
                          ),
                        ),
                        BodyText(
                          ' _linniethao',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Nunito'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 30.h,
                decoration: BoxDecoration(
                    color: const Color(0xffEBEAF1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xffEBEAF1))),
                child: Padding(
                  padding: EdgeInsets.only(right: 8.r, left: 8.r),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.r),
                          child: BodyText(
                            'Report',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Nunito'),
                          ),
                        ),
                        Image.asset(
                          'images/icons/style=outline.png',
                          width: 12.w,
                          height: 12.h,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Spacing(1.r),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BodyLText(
                  'Total Visit',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                ),
                BodyLText(
                  '3,349,000',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'images/icons/Vector (1).png',
                  width: 9.w,
                  height: 9.h,
                ),
                BodySText(
                  '25.1%',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff4B877A)),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  StreamBuilder _buildLineFlowChart() {
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return SizedBox(
            width: 297.w,
            height: 264.h,
            child: SfCartesianChart(
                enableAxisAnimation: true,
                backgroundColor: const Color(0xffF7F7F9),
                zoomPanBehavior: ZoomPanBehavior(
                  maximumZoomLevel: 0.3,
                  enablePinching: true,
                  zoomMode: ZoomMode.x,
                  enablePanning: true,
                ),
                primaryYAxis: NumericAxis(
                    labelPosition: ChartDataLabelPosition.inside,
                    labelFormat: ' ',
                    tickPosition: TickPosition.inside),
                primaryXAxis: DateTimeAxis(
                    labelFormat: ' ',
                    labelPosition: ChartDataLabelPosition.inside,
                    tickPosition: TickPosition.inside,
                    interval: 1,
                    axisLine: AxisLine(
                        color: Colors.grey,
                        width: 2.w,
                        dashArray: <double>[1, 1])),
                trackballBehavior: _buildTrackBall(),
                // tooltipBehavior: _buildToolTips(),
                series: <ChartSeries<ChartData, DateTime>>[
                  LineSeries<ChartData, DateTime>(
                    color: const Color(0xffE63946), width: 1,
                    dataSource: view,
                    xValueMapper: (ChartData numbers, _) => numbers.time,
                    yValueMapper: (ChartData numbers, _) => numbers.numbers,
                    name: 'Like',
                    // Enable data label
                  ),
                  LineSeries<ChartData, DateTime>(
                    color: const Color(0xffA8DADC),
                    dataSource: like,
                    xValueMapper: (ChartData numbers, _) => numbers.time,
                    yValueMapper: (ChartData numbers, _) => numbers.numbers,
                    name: 'View',
                  )
                ]),
          );
        });
  }

  TrackballBehavior _buildTrackBall() {
    return TrackballBehavior(
      activationMode: ActivationMode.singleTap,
      lineType: TrackballLineType.vertical,
      tooltipDisplayMode: TrackballDisplayMode.nearestPoint,
      enable: true,
      markerSettings: const TrackballMarkerSettings(
          markerVisibility: TrackballVisibilityMode.visible),
      tooltipSettings: const InteractiveTooltip(
          enable: true, color: Colors.red, canShowMarker: false),
      builder: (BuildContext context, TrackballDetails trackballDetails) {
        return Container(
          width: 136.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: const Color(0xff1D3557),
              border: Border.all(color: const Color(0xff1D3557)),
              borderRadius:
                  BorderRadius.circular(AppDimensions.defaultSRadius)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
                child: BodySText(
                  DateFormat.yMMMEd().format(
                    trackballDetails.point!.x,
                  ),
                  style: BodySText.defaultStyle.copyWith(
                      fontSize: 12.sp, color: AppColors.textLightColor),
                ),
              ),
              BodySText(
                trackballDetails.point!.y.toString(),
                style: BodySText.defaultStyle.copyWith(
                    fontSize: 12.sp, color: AppColors.textLightColor),
              ),
            ],
          ),
        );
      },
    );
  }

}

class ChartData {
  ChartData(this.time, this.numbers);
  final DateTime time;
  final int numbers;
}

List<ChartData> view = [
  ChartData(DateTime(2015, 1), 20),
  ChartData(DateTime(2015, 2), 65),
  ChartData(DateTime(2015, 3), 76),
  ChartData(DateTime(2015, 4), 30),
  ChartData(DateTime(2015, 5), 42),
  ChartData(DateTime(2015, 6), 98),
  ChartData(DateTime(2015, 7), 123),
  ChartData(DateTime(2015, 8), 53),
  ChartData(DateTime(2015, 9), 67),
  ChartData(DateTime(2015, 10), 32),
  ChartData(DateTime(2015, 11), 56),
  ChartData(DateTime(2015, 12), 15)
];
List<ChartData> like = [
  ChartData(DateTime(2015, 1), 10),
  ChartData(DateTime(2015, 2), 40),
  ChartData(DateTime(2015, 3), 90),
  ChartData(DateTime(2015, 4), 60),
  ChartData(DateTime(2015, 5), 45),
  ChartData(DateTime(2015, 6), 190),
  ChartData(DateTime(2015, 7), 32),
  ChartData(DateTime(2015, 8), 67),
  ChartData(DateTime(2015, 9), 45),
  ChartData(DateTime(2015, 10), 78),
  ChartData(DateTime(2015, 11), 26),
  ChartData(DateTime(2015, 12), 125)
];
