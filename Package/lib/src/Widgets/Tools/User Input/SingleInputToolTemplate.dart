import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class SingleInputToolTemplate extends ToolCardTemplate {
  SingleInputToolTemplate()
      : super(templatePrompt: 'Single Input', badgeIcon: Assets.android);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  var dataMap = [];

  @override
  Widget returnActiveToolCard() {
    var cardController = TextEditingController();

    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          StandardTextFieldComponent(
              hintText: 'Answer here.',
              decorationVariant: decorationPriority.standard,
              textFieldController: cardController),
          DividerElement(),
          SizedBox(height: 20.0),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmolButtonElement(
                    decorationVariant: decorationPriority.important,
                    buttonTitle: 'Next',
                    buttonAction: () =>
                        {dataMap.insert(0, cardController.text), onNextCard()}),
                Spacer(),
                SmolButtonElement(
                    decorationVariant: decorationPriority.standard,
                    buttonTitle: 'Skip',
                    buttonAction: () => {onNextCard()})
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
          BodyOneText(dataMap.isNotEmpty ? dataMap[0] : 'Tool Skipped',
              decorationPriority.inactive)
        ]);
  }
}