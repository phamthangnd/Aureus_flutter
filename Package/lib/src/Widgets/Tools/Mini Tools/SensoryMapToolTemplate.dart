import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- SENSORY MAP TOOL ----------*/
/// A Tool template that allows the user to mark a sensation in their body in response to a prompt.

class SensoryMapToolTemplate extends ToolCardTemplate {
  SensoryMapToolTemplate({required templatePrompt, required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.

  @override
  Widget returnActiveToolCard() {
    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          const _SensoryMapInputCard(),
          const SizedBox(height: 20.0),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SmolButtonElement(
                    decorationVariant: decorationPriority.important,
                    buttonTitle: 'Next',
                    buttonHint: 'Goes to the next card',
                    buttonAction: () => {onNextCard()}),
              ]),
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyTwoText('Used the Sensory Map tool', decorationPriority.standard)
        ]);
  }
}

class _SensoryMapInputCard extends StatefulWidget {
  const _SensoryMapInputCard();

  @override
  _SensoryMapInputCardState createState() => _SensoryMapInputCardState();
}

class _SensoryMapInputCardState extends State<_SensoryMapInputCard> {
  Offset itemOffset = Offset.zero;

  Container createMapCircle(double diameter) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
          border: palette.universalBorder(), shape: BoxShape.circle),
    );
  }

  void onPanStart(DragStartDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);

    setState(() {
      itemOffset = point;
    });
  }

  void onPanUpdate(DragUpdateDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);

    setState(() {
      itemOffset = point;
    });
  }

  void onPanEnd(DragEndDetails details) {}

  @override
  Widget build(BuildContext context) {
    var area = MediaQuery.of(context).size;

    var sensoryMarker = PulseShadowElement(
        isActive: true,
        pulseWidth: size.responsiveSize(40, area),
        child: Container(
          width: size.responsiveSize(40, area),
          height: size.responsiveSize(40, area),
          decoration: ButtonBackingDecoration(
                  variant: buttonDecorationVariants.circle,
                  decorationVariant: decorationPriority.important)
              .buildBacking(),
          child: Icon(
            Icons.circle_outlined,
            color: coloration.sameColor(),
          ),
        ));

    var mappingCircles = SizedBox(
        width: 250,
        height: 250,
        child: Stack(
          alignment: Alignment.center,
          children: [
            createMapCircle(size.responsiveSize(275, area)),
            createMapCircle(size.responsiveSize(250, area)),
            createMapCircle(size.responsiveSize(225, area)),
            createMapCircle(size.responsiveSize(200, area)),
            createMapCircle(size.responsiveSize(175, area)),
            createMapCircle(size.responsiveSize(150, area)),
            createMapCircle(size.responsiveSize(125, area)),
            createMapCircle(size.responsiveSize(100, area)),
            createMapCircle(size.responsiveSize(75, area)),
            createMapCircle(size.responsiveSize(50, area)),
            createMapCircle(size.responsiveSize(25, area)),
            const Positioned(
                top: 0.0, child: TabSubheaderElement(title: "Top")),
            const Positioned(
                right: 0.0, child: TabSubheaderElement(title: "Right")),
            const Positioned(
                bottom: 0.0, child: TabSubheaderElement(title: "Bottom")),
            const Positioned(
                left: 0.0, child: TabSubheaderElement(title: "Left")),
            Positioned(
                left: itemOffset.dx, top: itemOffset.dy, child: sensoryMarker),
          ],
        ));

    return GestureDetector(
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        child: mappingCircles);
  }
}
