import 'package:aureus/aureus.dart';

//A bar that indicators progress for a given task.

class LoadingCircleElement extends StatefulWidget {
  const LoadingCircleElement();

  @override
  _LoadingCircleElementState createState() => _LoadingCircleElementState();
}

class _LoadingCircleElementState extends State<LoadingCircleElement>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // Checks user's accessibility settings to make sure animations are allowed,
    //and then initializes the animation controller.
    if (accessibility.accessFeatures.disableAnimations == false ||
        accessibility.accessFeatures.reduceMotion == false) {
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 5),
      )..addListener(() {
          setState(() {});
        });
      controller.repeat(reverse: true);
    }

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingContainerElement(
      child: SizedBox(
        width: 250.0,
        height: 250.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: coloration.accentColor().withOpacity(0.2),
                shape: BoxShape.circle),
            child: CircularProgressIndicator(
              backgroundColor: coloration.inactiveColor(),
              color: coloration.accentColor(),
              value: 30.0,
              strokeWidth: 3.0,
              semanticsLabel: 'Progress Indicator',
            ),
          ),
        ),
      ),
    );
  }
}