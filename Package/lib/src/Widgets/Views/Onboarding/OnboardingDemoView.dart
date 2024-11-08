import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- ONBOARDING DEMO VIEW ----------*/
/// A view that allows users to try tools before onboarding into the app.
/// This helps the user build trust, and improves conversion rates.

class OnboardingDemoView extends StatefulWidget {
  /// A list of CoreTools that are used in the resource, that can be demoed
  /// from an onboarding page. You can also make sample tools specifically for demo
  /// purposes.
  final List<CoreTool> toolItems;

  const OnboardingDemoView({required this.toolItems});

  @override
  _OnboardingDemoViewState createState() => _OnboardingDemoViewState();
}

class _OnboardingDemoViewState extends State<OnboardingDemoView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> cardItems = [];

    for (var item in widget.toolItems) {
      cardItems.add(Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
        child: CategoryIconDetailCardElement(
            decorationVariant: decorationPriority.standard,
            cardLabel: item.toolName,
            cardBody: item.toolDescription[0],
            cardIcon: item.toolIcon),
      ));
    }

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        PageHeaderElement.withExit(
            pageTitle: "${resourceValues.name}'s Tools",
            onPageExit: () => {Navigator.pop(context)}),
        const Spacer(),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: cardItems))
      ],
    );

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: viewLayout,
      showQuickActionBar: false,
    );
  }
}
