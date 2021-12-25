import 'package:aureus/aureus.dart';
import 'package:flutter/gestures.dart';

//A 80% width button that acts as a standard button for the UDS
//Doc Link:

class StandardButtonElement extends StatefulWidget {
  final decorationPriority decorationVariant;
  final String buttonTitle;
  final VoidCallback buttonAction;

  const StandardButtonElement(
      {required this.decorationVariant,
      required this.buttonTitle,
      required this.buttonAction});

  @override
  _StandardButtonElementState createState() => _StandardButtonElementState();
}

class _StandardButtonElementState extends State<StandardButtonElement> {
  @override
  Widget build(BuildContext context) {
    //variables that change how the variants are displayed in build time
    BoxDecoration buttonDecoration = ButtonBackingDecoration(
            variant: buttonDecorationVariants.roundedRectangle,
            priority: widget.decorationVariant)
        .buildBacking();

    //bool isButtonEnabled = widget.decorationVariant == decorationPriority.inactive ? true : false;

    Size minimumButtonTextSize = Accessibility.textStringSize(
        widthLimit: 300,
        textInput: widget.buttonTitle,
        textStyle: foundation.button2(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return SizedBox(
        width: minimumButtonTextSize.width * 3,
        height: minimumButtonTextSize.height * 3,
        child: Container(
            decoration: buttonDecoration,
            child: Center(
                child: ButtonTwoText(
                    widget.buttonTitle, widget.decorationVariant))));
  }
}