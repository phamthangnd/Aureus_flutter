import 'dart:math';

import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class PulseInputToolTemplate extends ToolCardTemplate {
  PulseInputToolTemplate()
      : super(templatePrompt: 'Pulse Input', badgeIcon: IconData(0));

  @override
  Widget returnActiveToolCard() {
    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          SizedBox(height: 10.0),
          BodyOneText(
              'Press each colorful dot to disable it, and to move forward.',
              decorationPriority.standard),
          SizedBox(height: 20.0),
          _PulseMapCard()
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyTwoText('Used the Pulse Input tool', decorationPriority.standard)
        ]);
  }
}

class _PulseMapCard extends StatefulWidget {
  final List<List<int>> mapPattern1 = [
    [1, 0, 0, 0, 0, 0, 0],
    [1, 1, 0, 0, 0, 0, 0],
    [1, 1, 1, 0, 0, 0, 0],
    [1, 1, 1, 1, 0, 0, 0],
    [1, 1, 1, 1, 1, 0, 0],
    [1, 1, 1, 1, 1, 1, 0],
    [1, 1, 1, 1, 1, 1, 1]
  ];

  final List<List<int>> mapPattern2 = [
    [1, 1, 1, 0, 0, 0, 0],
    [0, 0, 0, 0, 1, 1, 1],
    [1, 1, 1, 0, 0, 0, 0],
    [0, 0, 0, 0, 1, 1, 1],
    [1, 1, 1, 0, 0, 0, 0],
    [0, 0, 0, 0, 1, 1, 1],
    [1, 1, 1, 0, 0, 0, 0]
  ];

  final List<List<int>> mapPattern3 = [
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 1, 0, 1, 0, 1, 0],
    [0, 1, 0, 1, 0, 1, 0],
    [0, 1, 0, 1, 0, 1, 0]
  ];
  final List<List<int>> mapPattern4 = [
    [1, 0, 0, 0, 1, 0, 1],
    [0, 1, 0, 1, 0, 0, 0],
    [1, 0, 0, 0, 1, 0, 1],
    [0, 1, 0, 1, 0, 0, 0],
    [1, 0, 0, 0, 1, 0, 1],
    [0, 1, 0, 1, 0, 0, 0],
    [1, 0, 0, 0, 1, 0, 1]
  ];
  final List<List<int>> mapPattern5 = [
    [1, 0, 1, 0, 1, 0, 1],
    [0, 1, 0, 1, 0, 1, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 1, 0, 1, 0, 1, 0],
    [1, 0, 1, 0, 1, 0, 1],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 1, 0, 1, 0, 1, 0]
  ];
  final List<List<int>> mapPattern6 = [
    [1, 0, 0, 0, 0, 0, 0],
    [0, 1, 1, 0, 0, 0, 0],
    [0, 0, 0, 1, 1, 1, 0],
    [0, 0, 0, 0, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 0],
    [0, 1, 1, 0, 0, 0, 0],
    [0, 0, 0, 1, 1, 1, 0]
  ];
  final List<List<int>> mapPattern7 = [
    [1, 0, 0, 0, 1, 0, 0],
    [0, 1, 0, 0, 0, 1, 0],
    [0, 1, 0, 0, 0, 1, 0],
    [0, 0, 1, 0, 0, 0, 1],
    [0, 0, 1, 0, 0, 0, 1],
    [0, 0, 1, 0, 0, 0, 1],
    [0, 0, 0, 1, 0, 0, 0]
  ];
  final List<List<int>> mapPattern8 = [
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1]
  ];
  final List<List<int>> mapPattern9 = [
    [1, 0, 0, 0, 0, 0, 1],
    [0, 1, 0, 0, 0, 1, 0],
    [0, 0, 1, 0, 1, 0, 0],
    [0, 0, 0, 1, 0, 0, 0],
    [0, 0, 1, 0, 1, 0, 0],
    [0, 1, 0, 0, 0, 1, 0],
    [1, 0, 0, 0, 0, 0, 1]
  ];
  final List<List<int>> mapPattern10 = [
    [1, 0, 1, 0, 1, 0, 1],
    [0, 1, 0, 1, 0, 1, 0],
    [1, 0, 1, 0, 1, 0, 1],
    [0, 1, 0, 1, 0, 1, 0],
    [1, 0, 1, 0, 1, 0, 1],
    [0, 1, 0, 1, 0, 1, 0],
    [1, 0, 1, 0, 1, 0, 1]
  ];

  _PulseMapCard();

  @override
  _PulseMapCardState createState() => _PulseMapCardState();
}

class _PulseMapCardState extends State<_PulseMapCard> {
  List<List<int>> selectedMapPattern = [];

  void pulseDot(List<int> values) {
    print('pulsing this dot: ${values[0]} ${values[1]}!');
    Sensory().createSensation(sensationType.praise);

    var y = values[0];
    var x = values[1];

    var mapRow = selectedMapPattern[y];

    setState(() {
      //removes the one, and sets it to zero, counting that dot as completed.
      mapRow.removeAt(x);
      mapRow.insert(x, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    //from 0-7 on the X-axis (horizontal) where the dot is
    int xIndex = 0;
    //from 0-7 on the Y-axis (vertical) where the dot is
    int yIndex = 0;

    var allMaps = [
      widget.mapPattern1,
      widget.mapPattern2,
      widget.mapPattern3,
      widget.mapPattern4,
      widget.mapPattern5,
      widget.mapPattern6,
      widget.mapPattern7,
      widget.mapPattern8,
      widget.mapPattern9,
      widget.mapPattern10,
    ];

    //returns a randomized map pattern to display.
    selectedMapPattern = (allMaps..shuffle()).first;

    var activeDot = Padding(
        padding: EdgeInsets.all(7.0),
        child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: coloration.accentColor(),
                shape: BoxShape.circle,
                boxShadow: [pastelShadow()])));

    var inactiveDot = Padding(
        padding: EdgeInsets.all(7.0),
        child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: coloration.inactiveColor(), shape: BoxShape.circle)));

    //  Creates a matrixed for each loop that generates pulse map based on
    //  selected mapping pattern.

    var currentRow = [];
    List<Row> gridColumns = [];

    selectedMapPattern.forEach((element) {
      xIndex = 0;
      currentRow = selectedMapPattern[yIndex];

      List<Widget> tempDotHolding = [];

      element.forEach((element) {
        if (currentRow[xIndex] == 1) {
          // is the active dot

          var indexMap = [yIndex, xIndex];

          tempDotHolding.add(GestureDetector(
              onTap: () => {
                    pulseDot(new List<int>.from(
                        indexMap.map((element) => element).toList()))
                  },
              child: activeDot));
          print('gave dot $xIndex and $yIndex');
        } else if (currentRow[xIndex] == 0) {
          // is an inactive dot
          tempDotHolding.add(inactiveDot);
        }

        xIndex += 1;
      });

      gridColumns.add(Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: tempDotHolding));

      yIndex += 1;
    });

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: gridColumns,
      ),
    );
  }
}
