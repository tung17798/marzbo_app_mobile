import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marzbo_app_mobile/presentation/feature/created_post/view/select_time_screens.dart';
import 'package:marzbo_app_mobile/resources/app_dimensions.dart';
import 'package:marzbo_app_mobile/widgets/basic_layout.dart';
import 'package:marzbo_app_mobile/widgets/spacing.dart';
import 'package:marzbo_app_mobile/widgets/typography/body_text.dart';

class CreatedPostForm extends StatefulWidget {
  const CreatedPostForm({super.key});

  @override
  State<CreatedPostForm> createState() => _CreatedPostFormState();
}

class _CreatedPostFormState extends State<CreatedPostForm> {
  String CAPTIONS_FIELD = 'phone';
  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      child: SingleChildScrollView(
        child: Column(children: [
          _buildChoiceTypeSocialAccount(),
          Spacing(1.r),
          _buildChoiceTypePost(),
          Spacing(2.r),
          _buildImageVideoPicker(),
          Spacing(2.r),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Tap media to crop',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Nunito'),
            ),
          ),
          Spacing(2.r),
          _buildInputCaptionField(),
          Spacing(2.r),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'MORE OPTIONS',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Nunito'),
            ),
          ),
          Spacing(2.r),
          _buildButtonMoreOption(),
          Spacing(2.r),
          _buldSelectTime(),
          Spacing(2.r),
          _buildButtonSaveAndPublishNow()
        ]),
      ),
    );
  }

  _buildChoiceTypeSocialAccount() {
    return InkWell(
      child: Container(
        width: 317.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: const Color(0xffA8DADC),
            border: Border.all(color: const Color(0xffA8DADC)),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.only(right: 10.r, left: 10.r),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.r),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Container(
                            width: 35.w,
                            height: 35.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'https://i.pinimg.com/originals/06/f7/10/06f7106bf92ab8f3029f3f780f63e181.jpg',
                                  ),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
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
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '_linniethao',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Nunito'),
                          ),
                          Text(
                            'Instagram',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Nunito'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 24.sp,
                ),
              ]),
        ),
      ),
    );
  }

  _buildChoiceTypePost() {
    return InkWell(
      child: Container(
        width: 317.w,
        height: 34.h,
        decoration: BoxDecoration(
            color: const Color(0xffE8E8E8),
            border: Border.all(color: const Color(0xffE8E8E8)),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.only(right: 10.r, left: 10.r),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.r),
                      child: Image.asset(
                        'images/luoi.png',
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        'Feed post',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Nunito'),
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20.sp,
                ),
              ]),
        ),
      ),
    );
  }

  _buildImageVideoPicker() {
    return Container(
      width: 317.w,
      height: 75.h,
      child: ListView(
        shrinkWrap: true,
        // itemCount: 2,
        scrollDirection: Axis.horizontal,
        // itemBuilder: (context, index) => InkWell(
        //       child: Container(
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //               image: NetworkImage(
        //                 'https://cdn.tatmart.com/images/detailed/229/1_ij7h-zd.png',
        //               ),
        //               fit: BoxFit.cover),
        //           shape: BoxShape.circle,
        //         ),
        //         width: 65.w,
        //         height: 65.h,
        //         child: Stack(
        //           alignment: AlignmentDirectional.topEnd,
        //           children: [
        //             Container(
        //               width: 18.w,
        //               height: 18.h,
        //               decoration: BoxDecoration(
        //                   shape: BoxShape.circle, color: Colors.black),
        //               child: Icon(
        //                 Icons.close,
        //                 size: 16.sp,
        //                 color: Colors.white,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     )
        children: [
          InkWell(
            child: Container(
              margin: EdgeInsets.only(right: 16.r),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://cdn.tatmart.com/images/detailed/229/1_ij7h-zd.png',
                    ),
                    fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
              width: 65.w,
              height: 65.h,
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    width: 18.w,
                    height: 18.h,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: Icon(
                      Icons.close,
                      size: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildButtonMorePicker(1),
          _buildButtonMorePicker(1)
        ],
      ),
    );
  }

  _buildInputCaptionField() {
    return Container(
      width: 317.w,
      height: 158.h,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffD0D5DD)),
          borderRadius: BorderRadius.circular(8)),
      child: Theme(
        data: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
        ),
        child: FormBuilderTextField(
          name: CAPTIONS_FIELD,
          maxLines: 7,
          style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w300,
              fontFamily: 'Nunito'),
          decoration: const InputDecoration.collapsed(
            border: InputBorder.none,
            fillColor: Color(0xff9A9B9C),
            hintText: 'Write a caption...',
          ),
        ),
      ),
    );
  }

  _buildButtonMoreOption() {
    return Container(
      width: 317.w,
      decoration: BoxDecoration(
          color: const Color(0xffA8DADC),
          border: Border.all(color: const Color(0xffA8DADC)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 43.h,
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              //                    <--- top side
              color: Colors.black,
              width: 0.2.w,
            ),
          )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20.r),
                    child: Image.asset(
                      'images/Icons.png',
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      'Add Location',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Nunito'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 43.h,
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              //                    <--- top side
              color: Colors.black,
              width: 0.2.w,
            ),
          )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20.r),
                    child: Image.asset(
                      'images/Icons (1).png',
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      'Tag User',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Nunito'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 43.h,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20.r),
                    child: Image.asset(
                      'images/Icons (2).png',
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      'Add Music',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Nunito'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  _buldSelectTime() {
    return Container(
      width: 317.w,
      decoration: BoxDecoration(
          color: const Color(0xffA8DADC),
          border: Border.all(color: const Color(0xffA8DADC)),
          borderRadius: BorderRadius.circular(10)),
      height: 42.h,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20.r),
                    child: Image.asset(
                      'images/Icons (3).png',
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      'No time selected',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Nunito'),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SeletctTimeScreens(),
                          ));
                    },
                    child: Text(
                      'Change',
                      style: TextStyle(
                          color: Color(0xff457B9D),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Nunito'),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _buildButtonSaveAndPublishNow() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        width: 155.w,
        height: 38.h,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff457B9D), width: 2.w)),
        child: InkWell(
            child: Center(
          child: Text(
            'Save as Draft',
            style: TextStyle(
                color: Colors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w700),
          ),
        )),
      ),
      Container(
        width: 155.w,
        height: 38.h,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff1D3557), width: 2.w),
            color: Color(0xff1D3557)),
        child: InkWell(
            child: Center(
          child: Text(
            'Publish now',
            style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.w700),
          ),
        )),
      )
    ]);
  }

  Widget _buildButtonMorePicker(int indexBt) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(right: 16.r),
        width: 65.w,
        height: 65.h,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 200, 230, 232),
            borderRadius: BorderRadius.circular(12)),
        child: const Icon(
          Icons.add,
          color: Color(0xffA8DADC),
          size: 40,
        ),
      ),
    );
  }
}
//optionasocialccount
//optiontypepost
//chosseimageorvideo
//formcaption
//moreoption : addlocation,tag user, add music
// selectetime ( optional)