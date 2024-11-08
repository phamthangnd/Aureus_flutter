import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- COOKIE BANNER ----------*/
/// A y/n banner to ask a user to accept cookies on the website.

class CookieBannerComponent extends StatefulWidget {
  /// A message to ask about cookie permission
  final String cookieMessage;

  /// What to do if user accepts cookies
  final VoidCallback onCookieAccept;

  /// What to do if user denies cookies
  final VoidCallback onCookieDeny;
  const CookieBannerComponent(
      {required this.cookieMessage,
      required this.onCookieAccept,
      required this.onCookieDeny});

  @override
  _CookieBannerComponentState createState() => _CookieBannerComponentState();
}

class _CookieBannerComponentState extends State<CookieBannerComponent> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var buttonRow = Row(
      children: [
        SmolButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonTitle: 'Accept',
            buttonHint: 'Accepts cookies from ${resourceValues.name}',
            buttonAction: widget.onCookieAccept),
        const Spacer(),
        SmolButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonTitle: 'Deny',
            buttonHint: 'Denies cookies from ${resourceValues.name}',
            buttonAction: widget.onCookieDeny)
      ],
    );

    var cookieBannerContent = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10.0),
        const IconBadge(
            badgeIcon: Assets.alertmessage,
            badgePriority: decorationPriority.important),
        const SizedBox(height: 10.0),
        TagTwoText('Cookie Usage', decorationPriority.standard),
        const SizedBox(height: 10.0),
        BodyOneText(widget.cookieMessage, decorationPriority.standard),
        const SizedBox(height: 10.0),
        buttonRow,
        const SizedBox(height: 10.0),
      ],
    );

    var cookieBannerContainer = Container(
        constraints: BoxConstraints(
            minWidth: size.layoutItemWidth(3, screenSize),
            maxWidth: size.layoutItemWidth(2, screenSize),
            minHeight: size.layoutItemHeight(4, screenSize)),
        decoration: CardBackingDecoration(
                decorationVariant: decorationPriority.inverted)
            .buildBacking(),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: cookieBannerContent,
        ));

    return cookieBannerContainer;
  }
}
