import 'package:aureus/aureus.dart';

/*

Description: 
A class that contains variables, methods, and other items to ensure full accessibility compliance. 

*/

var accessibility = Accessibility();

// 🛑
class Accessibility {
  //returns the proper sizing of a string for a given text style with regards to the scale factor to accomodate dynamic text sizing.
  static Size textStringSize(
      {required double widthLimit,
      required String textInput,
      required TextStyle textStyle,
      required TextDirection textDirection,
      required MediaQueryData query}) {
    //creates variable that contains MediaQuery information that will be used to return proper sizing
    TextPainter textPainter = TextPainter(
        text: TextSpan(text: textInput, style: textStyle),
        maxLines: 1,
        textScaleFactor: query.textScaleFactor,
        textDirection: textDirection)
      ..layout(maxWidth: widthLimit);

    return textPainter.size;
  }
}

/*

Description: 
A class that takes variables into consideration to properly color the text of different items to match contrsst standards
*/

// 🛑
class Coloration {
  //the color returned for all general text in Aureus.

  Color decorationColor(decorationPriority decorationVariant,
      {priority: decorationPriority}) {
    Color priorityColor = foundation.black();

    switch (priority) {
      case decorationPriority.important:
        priorityColor = sameColor();
        break;

      case decorationPriority.inactive:
        priorityColor = inactiveColor();
        break;

      case decorationPriority.standard:
        priorityColor = contrastColor();
        break;
    }

    return priorityColor;
  }

  Color contrastColor() {
    if (ThemeMode.system == ThemeMode.light) {
      return foundation.black();
    } else if (ThemeMode.system == ThemeMode.dark) {
      return foundation.white();
    }

    //throws an error because there are only two mode options, so if the function falls through, something has gone wrong.
    throw UnimplementedError();
  }

  //sometimes, items will have a high contrast background and need to be the same color as the mode. in that case, use this text color.
  Color sameColor() {
    if (ThemeMode.system == ThemeMode.light) {
      return foundation.white();
    } else if (ThemeMode.system == ThemeMode.dark) {
      return foundation.black();
    }
    //throws an error because there are only two mode options, so if the function falls through, something has gone wrong.
    throw UnimplementedError();
  }

  //sometimes, items will have a high contrast background and need to be the same color as the mode. in that case, use this text color.
  Color inactiveColor() {
    if (ThemeMode.system == ThemeMode.light) {
      return foundation.iron();
    } else if (ThemeMode.system == ThemeMode.dark) {
      return foundation.steel();
    }
    //throws an error because there are only two mode options, so if the function falls through, something has gone wrong.
    throw UnimplementedError();
  }
}
