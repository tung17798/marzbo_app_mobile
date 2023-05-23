import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

/// Customable and nice Switch button :).
///
/// Currently, you can change the widget
/// width but not the height property.
///
/// The following arguments are required:
///
/// * [value] determines switch state (on/off).
/// * [onChanged] is called when user toggles switch on/off.
/// * [onTap] event called on tap
/// * [onDoubleTap] event called on double tap
/// * [onSwipe] event called on swipe (left/right)
///
class CustomSwitchButton extends StatefulWidget {
  @required
  final bool value;
  final double width;

  @required
  final Function(bool) onChanged;
  final String textOff;
  final Color textOffColor;
  final String textOn;
  final Color textOnColor;
  final Color colorOn;
  final Color colorOff;
  final double textSize;
  final Duration animationDuration;
  final IconData iconOn;
  final IconData iconOff;
  final Function onTap;
  final Function onDoubleTap;
  final Function onSwipe;
  final double? height;

  CustomSwitchButton({
    this.value = false,
    this.width = 100,
    this.height,
    this.textOff = "Off",
    this.textOn = "On",
    this.textSize = 14.0,
    this.colorOn = Colors.green,
    this.colorOff = Colors.red,
    this.iconOff = Icons.flag,
    this.iconOn = Icons.check,
    this.animationDuration = const Duration(milliseconds: 600),
    this.textOffColor = Colors.white,
    this.textOnColor = Colors.black,
    required this.onTap,
    required this.onDoubleTap,
    required this.onSwipe,
    required this.onChanged,
  });

  @override
  _CustomSwitchButtonState createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton>
    with SingleTickerProviderStateMixin {
  /// Late declarations
  late AnimationController animationController;
  late Animation<double> animation;
  late bool turnState;

  double value = 0.0;

  @override
  void dispose() {
    //Ensure to dispose animation controller
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: widget.animationDuration);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animationController.addListener(() {
      setState(() {
        value = animation.value;
      });
    });
    turnState = widget.value;

    // Executes a function only one time after the layout is completed.
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        if (turnState) {
          animationController.forward();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //Color transition animation
    Color? transitionColor = Color.lerp(widget.colorOff, widget.colorOn, value);

    return GestureDetector(
      onDoubleTap: () {
        _action();
        widget.onDoubleTap();
      },
      onTap: () {
        _action();
        widget.onTap();
      },
      onPanEnd: (details) {
        _action();
        widget.onSwipe();
      },
      child: Container(
        padding: EdgeInsets.all(5),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: transitionColor, borderRadius: BorderRadius.circular(9)),
        child: Stack(
          children: <Widget>[
            Transform.translate(
              offset: isRTL(context)
                  ? Offset(-10 * value, 0)
                  : Offset(10 * value, 0), //original
              child: Opacity(
                opacity: (1 - value).clamp(0.0, 1.0),
                child: Container(
                  padding: isRTL(context)
                      ? EdgeInsets.only(left: 10)
                      : EdgeInsets.only(right: 10),
                  alignment: isRTL(context)
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  height: 40,
                  child: Text(
                    widget.textOff,
                    style: TextStyle(
                        color: widget.textOffColor,
                        fontWeight: FontWeight.bold,
                        fontSize: widget.textSize),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: isRTL(context)
                  ? Offset(-10 * (1 - value), 0)
                  : Offset(10 * (1 - value), 0), //original
              child: Opacity(
                opacity: value.clamp(0.0, 1.0),
                child: Container(
                  padding: isRTL(context)
                      ? EdgeInsets.only(right: 5)
                      : EdgeInsets.only(left: 5),
                  alignment: isRTL(context)
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  height: 40,
                  child: Text(
                    widget.textOn,
                    style: TextStyle(
                        color: widget.textOnColor,
                        fontWeight: FontWeight.bold,
                        fontSize: widget.textSize),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: isRTL(context)
                  ? Offset((-widget.width + 60) * value, 0)
                  : Offset((widget.width - 60) * value, 0),
              child: Transform.rotate(
                angle: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white),
                  height: 32.h,
                  width: 51.w,
                  alignment: Alignment.center,
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Opacity(
                          opacity: (1 - value).clamp(0.0, 1.0),
                          child: Text(
                            widget.textOn,
                            style: TextStyle(
                                color: widget.textOnColor,
                                fontWeight: FontWeight.bold,
                                fontSize: widget.textSize),
                          ),
                        ),
                      ),
                      Center(
                        child: Opacity(
                          opacity: value.clamp(0.0, 1.0),
                          child: Text(
                            widget.textOff,
                            style: TextStyle(
                                color: widget.textOnColor,
                                fontWeight: FontWeight.bold,
                                fontSize: widget.textSize),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _action() {
    _determine(changeState: true);
  }

  _determine({bool changeState = false}) {
    setState(() {
      if (changeState) turnState = !turnState;
      (turnState)
          ? animationController.forward()
          : animationController.reverse();

      widget.onChanged(turnState);
    });
  }
}

bool isRTL(BuildContext context) {
  return Bidi.isRtlLanguage(Localizations.localeOf(context).languageCode);
}
