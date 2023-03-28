import 'package:flutter/material.dart';
import 'package:marzbo_app_mobile/resources/app_dimensions.dart';
import 'package:marzbo_app_mobile/widgets/typography/body_text.dart';


class ButtonText extends BodyText {
  static const TextStyle defaultStyle = TextStyle(
      fontSize: AppDimensions.bodyMFontSize, fontWeight: FontWeight.w700);
  const ButtonText(
    super.data, {
    super.key,
    super.style,
    super.color,
    super.textAlign = TextAlign.left,
    super.overflow,
    super.maxLines,
  }) : super(fallbackStyle: defaultStyle);
}
