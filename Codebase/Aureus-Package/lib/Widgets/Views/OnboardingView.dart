import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//
//Doc Link:

class OnboardingView extends StatefulWidget {
  final modeVariants viewMode;
  final deviceVariants deviceType;

  const OnboardingView({required this.viewMode, required this.deviceType});

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(
            Sizing.widthOf(context: context, weight: sizingWeight.w0),
            Sizing.heightOf(context: context, weight: sizingWeight.w1),
            Sizing.widthOf(context: context, weight: sizingWeight.w0),
            Sizing.heightOf(context: context, weight: sizingWeight.w0)),
        width: Sizing.widthOf(context: context, weight: sizingWeight.w10),
        height: Sizing.heightOf(context: context, weight: sizingWeight.w10),
        decoration: LayerBackingDecoration(
            mode: widget.viewMode,
            priority: decorationPriority.standard,
            variant: layerDecorationVariants.edged) as Decoration,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: []));
  }
}
