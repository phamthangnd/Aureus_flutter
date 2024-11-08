import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/cupertino.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- DATE PICKER INPUT TOOL ----------*/
/// A tool template for selecting a date.

class DatePickerInputToolTemplate extends ToolCardTemplate {
  DatePickerInputToolTemplate({required templatePrompt, required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  DateTime? time;

  @override
  Widget returnActiveToolCard() {
    var dateChosen = DateTime.now();

    var datePicker = CupertinoTheme(
        data: CupertinoThemeData(
          brightness: palette.brightness(),
        ),
        child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            onDateTimeChanged: (date) {
              dateChosen = date;
            }));

    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          SizedBox(height: 100.0, width: 250.0, child: datePicker),
          const SizedBox(height: 10.0),
          const DividerElement(),
          const SizedBox(height: 20.0),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmolButtonElement(
                    decorationVariant: decorationPriority.standard,
                    buttonTitle: 'Skip',
                    buttonHint: 'Skips the current card.',
                    buttonAction: () => {onNextCard()}),
                const Spacer(),
                SmolButtonElement(
                    decorationVariant: decorationPriority.important,
                    buttonTitle: 'Next',
                    buttonHint: 'Goes to the next card.',
                    buttonAction: () => {
                          time = dateChosen,
                          onNextCard(),
                        }),
              ])
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyOneText(
              'Date Chosen: ' + time.toString(), decorationPriority.inactive)
        ]);
  }
}
