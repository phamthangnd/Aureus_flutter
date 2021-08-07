import 'package:flutter/cupertino.dart';
import 'package:aureus/product.dart';
import 'package:aureus/foundation.dart';

//A blank card that looks like a "pane" of glass
//Doc Link:

class TimerElement extends StatefulWidget {
  var foundation = UDSVariables();

  @override
  _TimerElementState createState() => _TimerElementState();
}

class _TimerElementState extends State<TimerElement> {
  var foundation = UDSVariables();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 245,
        height: 245,
        alignment: Alignment.center,
        child: Text('00:00:00', style: foundation.heading1()),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.all(Radius.elliptical(245, 245)),
        ));
  }
}
