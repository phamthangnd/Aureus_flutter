import 'package:aureus/aureus.dart';

// The base class for a card tool template.
// A CARD is a tool template that doesn't take up a full page, and
// is accessed within a card carousel only. It's used in conjunction with
// other cards, not as a stand alone item.

class BaseCardToolTemplate extends StatefulWidget {
  final bool isActive;
  final IconData cardIcon;
  final String toolPrompt;
  final List<Widget> toolChildren;

  const BaseCardToolTemplate(
      {required this.isActive,
      required this.cardIcon,
      required this.toolPrompt,
      required this.toolChildren});

  @override
  _BaseCardToolTemplateState createState() => _BaseCardToolTemplateState();
}

class _BaseCardToolTemplateState extends State<BaseCardToolTemplate> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var activeLayout = Container(
        constraints: BoxConstraints(
            maxWidth: size.layoutItemWidth(1, screenSize),
            minWidth: size.layoutItemWidth(1, screenSize),
            maxHeight: size.layoutItemHeight(1, screenSize)),
        decoration: CardBackingDecoration(priority: decorationPriority.inverted)
            .buildBacking(),
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.0),
            IconBadge(
                badgeIcon: widget.cardIcon,
                badgePriority: decorationPriority.standard),
            SizedBox(height: 20.0),
            SubheaderText(widget.toolPrompt, decorationPriority.standard),
            SizedBox(height: 20.0),
            Column(children: widget.toolChildren),
            SizedBox(height: 20.0)
          ],
        ));

    var inactiveLayout = FloatingContainerElement(
        child: Container(
            constraints: BoxConstraints(
                maxWidth: size.layoutItemWidth(1, screenSize),
                minWidth: size.layoutItemWidth(1, screenSize),
                maxHeight: size.layoutItemHeight(4, screenSize)),
            decoration:
                CardBackingDecoration(priority: decorationPriority.inactive)
                    .buildBacking(),
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconBadge(
                    badgeIcon: widget.cardIcon,
                    badgePriority: decorationPriority.standard),
                SizedBox(width: 15.0),
                FractionallySizedBox(
                  heightFactor: 1.0,
                  child: Container(
                      width: 1,
                      decoration:
                          BoxDecoration(color: coloration.inactiveColor())),
                ),
                SizedBox(width: 15.0),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TagOneText(widget.toolPrompt, decorationPriority.standard),
                    SizedBox(height: 15.0),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: widget.toolChildren))
                  ],
                )
              ],
            )));

    //checks if widget is actively engaged, and returns proper layout.
    return widget.isActive ? activeLayout : inactiveLayout;
  }
}