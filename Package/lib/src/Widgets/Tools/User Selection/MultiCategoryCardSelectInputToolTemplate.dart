import 'package:aureus/aureus.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- MULTI CATEGORY CARD SELECT INPUT ----------*/

class MultiCategoryCardSelectInputToolTemplate extends ToolCardTemplate {
  MultiCategoryCardSelectInputToolTemplate(
      {required templatePrompt, required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  var dataMap = [];

  @override
  Widget returnActiveToolCard() {
    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: const []);
  }

  @override
  Widget returnTemplateSummary() {
    if (dataMap.isEmpty == true) {
      throw ('You cannot show a template summary of a tool template without populating dataMap.');
    }

    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: const []);
  }
}
