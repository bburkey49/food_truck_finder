import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_truck_finder/truck_pop_up.dart';
import 'package:meta/meta.dart';


class InfoWidgetRoute extends PopupRoute {
  final Widget child;
  final double width;
  final double height;
  final BuildContext buildContext;
  final TextStyle textStyle;
  final Rect mapsWidgetSize;

  InfoWidgetRoute({
    @required this.child,
    @required this.buildContext,
    @required this.textStyle,
    @required this.mapsWidgetSize,
    this.width = 150,
    this.height = 50,
    this.barrierLabel,
  });

  @override
  Duration get transitionDuration => Duration(milliseconds: 100);

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => null;

  @override
  final String barrierLabel;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      removeTop: true,
      child: Builder(builder: (BuildContext context) {
        return CustomSingleChildLayout(
          delegate: _InfoWidgetRouteLayout(
              mapsWidgetSize: mapsWidgetSize, width: width, height: height),
          child: InfoWidgetPopUp(
            infoWidgetRoute: this,
          ),
        );
      }),
    );
  }
}



class _InfoWidgetRouteLayout<T> extends SingleChildLayoutDelegate {
  final Rect mapsWidgetSize;
  final double width;
  final double height;

  _InfoWidgetRouteLayout(
      {@required this.mapsWidgetSize,
        @required this.height,
        @required this.width});

  /// Depending of the size of the marker or the widget, the offset in y direction has to be adjusted;
  /// If the appear to be of different size, the commented code can be uncommented and
  /// adjusted to get the right position of the Widget.
  /// Or better: Adjust the marker size based on the device pixel ratio!!!!)

  @override
  Offset getPositionForChild(Size size, Size childSize) {
//    if (Platform.isIOS) {
    return Offset(
      mapsWidgetSize.center.dx - childSize.width / 2,
      mapsWidgetSize.center.dy - childSize.height - 50,
    );
//    } else {
//      return Offset(
//        mapsWidgetSize.center.dx - childSize.width / 2,
//        mapsWidgetSize.center.dy - childSize.height - 10,
//      );
//    }
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    //we expand the layout to our predefined sizes
    return BoxConstraints.expand(width: width, height: height);
  }

  @override
  bool shouldRelayout(_InfoWidgetRouteLayout oldDelegate) {
    return mapsWidgetSize != oldDelegate.mapsWidgetSize;
  }
}
