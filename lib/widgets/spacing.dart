import 'package:flutter/material.dart';
import 'package:marzbo_app_mobile/resources/app_dimensions.dart';

enum SpacingDirection { Vertical, Horizontal }

class Spacing extends StatelessWidget {
  const Spacing(
    this.space, {
    super.key,
    this.direction = SpacingDirection.Vertical,
  });

  final double space;
  final SpacingDirection direction;

  @override
  Widget build(BuildContext context) {
    final double spacing = AppDimensions.defaultPadding * space;
    return SizedBox(
      height: direction == SpacingDirection.Vertical ? spacing : null,
      width: direction == SpacingDirection.Horizontal ? spacing : null,
    );
  }

  static Spacing horizontal(double space) {
    return Spacing(space, direction: SpacingDirection.Horizontal);
  }
}
