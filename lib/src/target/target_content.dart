import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../tutorial_coach_mark.dart';

class CustomTargetContentPosition {
  CustomTargetContentPosition({
    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  final double? top, left, right, bottom;

  @override
  String toString() {
    return 'CustomTargetPosition{top: $top, left: $left, right: $right, bottom: $bottom}';
  }
}

class OverlayMarker extends InheritedWidget {
  const OverlayMarker({
    Key? key,
    required Widget child,
    required this.markerContext,
  }) : super(key: key, child: child);

  final BuildContext markerContext;

  static OverlayMarker? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<OverlayMarker>();
  }

  @override
  bool updateShouldNotify(OverlayMarker oldWidget) {
    return markerContext != oldWidget.markerContext;
  }
}

enum ContentAlign { top, bottom, left, right, custom }

typedef TargetContentBuilder = Widget Function(
  BuildContext context,
  TutorialCoachMarkController controller,
);

class TargetContent {
  TargetContent({
    this.align = ContentAlign.bottom,
    this.padding = const EdgeInsets.all(20.0),
    this.child,
    this.customPosition,
    this.builder,
  }) : assert(!(align == ContentAlign.custom && customPosition == null));

  final ContentAlign align;
  final EdgeInsets padding;
  final CustomTargetContentPosition? customPosition;
  final Widget? child;
  final TargetContentBuilder? builder;

  @override
  String toString() {
    return 'ContentTarget{align: $align, child: $child}';
  }
}
