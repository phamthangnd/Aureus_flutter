import 'package:aureus/aureus.dart';

//A vertically & horizontally centered alert controller

class CenteredAlertControllerComponent extends StatefulWidget {
  final AlertControllerObject alertData;

  const CenteredAlertControllerComponent({required this.alertData});

  @override
  _CenteredAlertControllerComponentState createState() =>
      _CenteredAlertControllerComponentState();
}

class _CenteredAlertControllerComponentState
    extends State<CenteredAlertControllerComponent> {
  @override
  Widget build(BuildContext context) {
    List<Widget> actionButtons = [];

    var screenSize = size.logicalScreenSize();
    var actions = widget.alertData.actions;

    for (var element in actions) {
      actionButtons.add(Padding(
        padding: const EdgeInsets.fromLTRB(0, 5.0, 0.0, 5.0),
        child: StandardButtonElement(
            decorationVariant:
                element.actionSeverity == AlertControllerActionSeverity.confirm
                    ? decorationPriority.important
                    : decorationPriority.standard,
            buttonTitle: element.actionName,
            buttonAction: element.onSelection),
      ));
    }

    return Semantics.fromProperties(
      properties: SemanticsWrapper.customItem(
          isEnabled: true,
          label: 'Alert Controller - ${widget.alertData.alertTitle}',
          hint: widget.alertData.alertBody,
          isEditable: false,
          isLiveRegion: true),
      child: Container(
          decoration:
              CardBackingDecoration(priority: decorationPriority.inverted)
                  .buildBacking(),
          constraints: BoxConstraints(
              minWidth: size.layoutItemWidth(1, screenSize),
              maxWidth: size.layoutItemWidth(1, screenSize),
              minHeight: size.layoutItemHeight(3, screenSize),
              maxHeight: size.layoutItemHeight(1, screenSize)),
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconBadge(
                      badgeIcon: widget.alertData.alertIcon,
                      badgePriority: decorationPriority.standard),
                  const SizedBox(height: 20),
                  HeadingThreeText(
                      widget.alertData.alertTitle, decorationPriority.standard),
                  BodyOneText(
                      widget.alertData.alertBody, decorationPriority.standard),
                  const SizedBox(height: 30.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: actionButtons,
                  )
                ]),
          )),
    );
  }
}
