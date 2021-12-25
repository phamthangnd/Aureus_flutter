import 'package:aureus/aureus.dart';
import 'package:flutter/gestures.dart';

//A small, circular button that uses an icon to communicate its' purpose
//Doc Link:

//big circular icon buttons that are greater than 70x70 and are intended to be the main action of the page (e.g: add, message, etc).
class PrimaryIconButtonElement extends StatefulWidget {
  final decorationPriority decorationVariant;
  final IconData buttonIcon;
  final String buttonTooltip;
  final VoidCallback buttonAction;

  const PrimaryIconButtonElement(
      {required this.decorationVariant,
      required this.buttonIcon,
      required this.buttonTooltip,
      required this.buttonAction});

  @override
  _PrimaryIconButtonElementState createState() =>
      _PrimaryIconButtonElementState();
}

class _PrimaryIconButtonElementState extends State<PrimaryIconButtonElement> {
  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled =
        widget.decorationVariant == decorationPriority.inactive ? true : false;
    BoxDecoration buttonBacking = ButtonBackingDecoration(
            variant: buttonDecorationVariants.circle,
            priority: widget.decorationVariant)
        .buildBacking();

    return SizedBox(
        width: 80.0,
        height: 80.0,
        child: Container(
          decoration: buttonBacking,
          child: Center(
            child: Icon(widget.buttonIcon,
                color: coloration.decorationColor(
                    decorationVariant: widget.decorationVariant),
                semanticLabel: widget.buttonTooltip,
                size: 60.0),
          ),
        ));
  }
}

//tiny babey icon buttons that are 60x60 or less.
class SecondaryIconButtonElement extends StatefulWidget {
  final decorationPriority decorationVariant;
  final IconData buttonIcon;
  final String buttonTooltip;
  final VoidCallback buttonAction;

  const SecondaryIconButtonElement(
      {required this.decorationVariant,
      required this.buttonIcon,
      required this.buttonTooltip,
      required this.buttonAction});

  @override
  _SecondaryIconButtonElementState createState() =>
      _SecondaryIconButtonElementState();
}

class _SecondaryIconButtonElementState
    extends State<SecondaryIconButtonElement> {
  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled =
        widget.decorationVariant == decorationPriority.inactive ? true : false;

    var buttonBackingDecoration = ButtonBackingDecoration(
        variant: buttonDecorationVariants.circle,
        priority: widget.decorationVariant);

    return SizedBox(
      width: 40.0,
      height: 40.0,
      child: Container(
        decoration: buttonBackingDecoration.buildBacking(),
        child: Icon(widget.buttonIcon,
            color: coloration.decorationColor(
                decorationVariant: widget.decorationVariant),
            semanticLabel: widget.buttonTooltip,
            size: 30.0),
      ),
    );
  }
}