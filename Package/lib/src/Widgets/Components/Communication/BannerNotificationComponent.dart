import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- BANNER NOTIFICATION ----------*/
/// A small banner that drops down from the top of a screen to alert the user
/// of something.

class BannerNotificationComponent extends StatefulWidget {
  /// The body of the banner notification
  final String body;

  /// The icon for the banner notification
  final IconData icon;
  const BannerNotificationComponent({required this.body, required this.icon});

  @override
  _BannerNotificationComponentState createState() =>
      _BannerNotificationComponentState();
}

class _BannerNotificationComponentState
    extends State<BannerNotificationComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> slideAnimation;
  late Animation<double> progressAnimation;
  late SlideTransition slideOverTransition;
  late TickerFuture animationDirection;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..addListener(() {
        // Removes notification from widget tree when
        // progress bar is done.
        if (progressAnimation.value == 1.0) {
          notificationMaster.resetRequests();
        } else {
          setState(() {});
        }
      });

    slideAnimation = CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.0,
        0.1,
        curve: Curves.decelerate,
      ),
    );

    progressAnimation = CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.1,
        1.0,
        curve: Curves.linear,
      ),
    );

    slideOverTransition = SlideTransition(
        position: Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(0.5, 0.0),
    ).animate(progressAnimation));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void afterBuild() {
    setState(() {
      // Reverses the animation controller and runs on launch VoidCallback
      animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var slidingProgressBar = ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: LinearProgressIndicator(
          value: progressAnimation.value,
          backgroundColor: coloration.inactiveColor(),
          color: coloration.accentColor(),
          minHeight: 5.0,
          semanticsLabel: 'Notification Timer',
          semanticsValue:
              'Time Left: ${1.0 - slideAnimation.value * 15} seconds',
        ));

    var bannerNotificationSubContent = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        BodyTwoText(widget.body, decorationPriority.standard),
        const Spacer(),
        const IconBadge(
            badgeIcon: Assets.alertmessage,
            badgePriority: decorationPriority.important),
      ],
    );

    var bannerNotificationContent = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: bannerNotificationSubContent,
        ),
        const DividerElement(),
        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          child: slidingProgressBar,
        ),
        const SizedBox(height: 15.0),
      ],
    );

    var bannerNotificationContainer = FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minWidth: size.layoutItemWidth(1, screenSize),
              maxWidth: size.layoutItemWidth(1, screenSize)),
          decoration: CardBackingDecoration(
                  decorationVariant: decorationPriority.standard)
              .buildBacking(),
          child: bannerNotificationContent),
    );

    var bannerNotificationInteractor = Focus(
      child: GestureDetector(
        onVerticalDragEnd: (end) {
          notificationMaster.resetRequests();
        },
        child: bannerNotificationContainer,
      ),
    );

    return bannerNotificationInteractor;
  }
}
