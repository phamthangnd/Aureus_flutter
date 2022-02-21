import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class SingleCategoryItemInfoToolTemplate extends ToolCardTemplate {
  SingleCategoryItemInfoToolTemplate()
      : super(templateItems: [], templatePrompt: '', badgeIcon: IconData(0));

  @override
  Widget returnActiveToolCard() {
    return BasePageToolTemplate(
        parentTool: parentTool,
        onToolDetail: onToolDetail,
        pageChildren: pageChildren);
  }
}
