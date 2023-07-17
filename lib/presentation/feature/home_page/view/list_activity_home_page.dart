import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marzbo_app_mobile/widgets/spacing.dart';
import 'package:marzbo_app_mobile/widgets/typography/body_text.dart';

class ListActivityHomePage extends StatelessWidget {
  const ListActivityHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffF7F7F9),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffF7F7F9))),
      width: 317.w,
      height: 277.h,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 27.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10.r, top: 20.r),
                  child: BodyLText(
                    'Activity',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: 30.h,
                  margin: EdgeInsets.only(right: 10.r, top: 16.r),
                  decoration: BoxDecoration(
                      color: Color(0xffEBEAF1),
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
                              'All activity',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          Image.asset(
                            'images/icons/caret-forward.png',
                            width: 16.w,
                            height: 16.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: _buildListActivity()),
        ],
      ),
    );
  }

  Widget _buildListActivity() => ListView.builder(
      itemCount: 3,
      itemBuilder: (context, int index) {
        return _buildActivityItems();
      });

  Widget _buildActivityItems() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11.5.r, horizontal: 8.5.r),
      width: 283.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'images/Frame 472 (1).png',
            width: 36.w,
            height: 36.h,
          ),
          Container(
            width: 185.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyLText(
                  'Ready to publish post to',
                  color: Color(0xff9A9B9C),
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700),
                ),
                Spacing(0.2.r),
                BodyLText(
                  'Quynh Anh on Facebook',
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          BodyLText(
            '10:43 AM',
            color: Color(0xff9A9B9C),
            style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
