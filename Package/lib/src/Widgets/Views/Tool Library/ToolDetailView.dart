// ignore_for_file: must_be_immutable

import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- TOOL DETAIL VIEW ----------*/
/// A view that shows a user metadata about a [CoreTool] before they use it.

class ToolDetailView extends StatefulWidget {
  /// The tool that contains the data to be used in this template.
  final CoreTool parentTool;

  /// An action to run when a user clicks the 'use tool' button.
  final VoidCallback onUseTool;

  const ToolDetailView({required this.parentTool, required this.onUseTool});

  @override
  _ToolDetailViewState createState() => _ToolDetailViewState();
}

class _ToolDetailViewState extends State<ToolDetailView> {
  @override
  Widget build(BuildContext context) {
    var tool = widget.parentTool;
    var screenSize = MediaQuery.of(context).size;

    var fullWidthButtonElement = FullWidthButtonElement(
      buttonTitle: 'Use tool.',
      buttonHint: 'Starts ${tool.toolName}.',
      currentVariant: decorationPriority.important,
      buttonAction: () => {
        widget.onUseTool(),
      },
    );

    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20.0),
        const TabSubheaderElement(title: 'Description'),
        const SizedBox(height: 20.0),
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: LayerBackingDecoration(
                  decorationVariant: decorationPriority.standard)
              .buildBacking(),
          child: BodyOneText(tool.toolDescription, decorationPriority.standard),
        ),
        const SizedBox(height: 20.0),
        const TabSubheaderElement(title: 'Used for'),
        const SizedBox(height: 20.0),
        DetailCardCarouselComponent(cardDetailCarousel: tool.toolDetails),
        const SizedBox(height: 20.0),
      ],
    );

    var floatingContainerElement = FloatingContainerElement(
        child: Container(
            width: size.layoutItemWidth(1, screenSize),
            decoration: LayerBackingDecoration(
                    decorationVariant: decorationPriority.standard)
                .buildBacking(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              child: column,
            )));

    var align = Align(
      alignment: Alignment.topRight,
      child: IconButtonElement(
        decorationVariant: decorationPriority.standard,
        buttonIcon: Assets.no,
        buttonHint: 'Exit ${tool.toolName} details',
        buttonAction: () => {
          Navigator.pop(context),
        },
        buttonPriority: buttonSize.secondary,
      ),
    );

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      takesFullWidth: true,
      children: [
        Center(
          child: SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: size.layoutItemHeight(1, screenSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10.0),
                align,
                const Spacer(),
                IconBadge(
                    badgeIcon: tool.toolIcon,
                    badgePriority: decorationPriority.important),
                const SizedBox(height: 15.0),
                HeadingOneText(
                    data: tool.toolName,
                    textColor: decorationPriority.standard),
                const SizedBox(height: 40.0),
                floatingContainerElement,
                const Spacer(),
              ],
            ),
          ),
        ),
        const Spacer(),
        fullWidthButtonElement
      ],
    );

    return ContainerView(
      decorationVariant: decorationPriority.standard,
      builder: viewLayout,
      takesFullWidth: true,
    );
  }
}
