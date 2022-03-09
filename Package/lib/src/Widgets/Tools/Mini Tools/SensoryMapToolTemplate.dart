import 'package:aureus/aureus.dart';

class SensoryMapToolTemplate extends ToolCardTemplate {
  SensoryMapToolTemplate() : super(templatePrompt: '', badgeIcon: IconData(0));

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
        toolChildren: []);
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
  _SensoryMapInputCard();

  @override
  _SensoryMapInputCardState createState() => _SensoryMapInputCardState();
}

class _SensoryMapInputCardState extends State<_SensoryMapInputCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}