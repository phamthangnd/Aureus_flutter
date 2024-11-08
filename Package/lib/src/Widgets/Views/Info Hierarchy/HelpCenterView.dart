import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- HELP CENTER VIEW ----------*/
/// The main container for the entire Help Center functionality
/// that controls the layout, views, and more.
///
/// A help center is meant to be articles for users to learn more about your
/// resources, organization, or policies. It's meant to be customer service facing.

class HelpCenterView extends StatefulWidget {
  /// A [HelpCenterObject] that contains all of the data structures for a
  /// Help Center.
  final HelpCenterObject helpCenter;

  const HelpCenterView({required this.helpCenter});

  @override
  _HelpCenterViewState createState() => _HelpCenterViewState();
}

class _HelpCenterViewState extends State<HelpCenterView> {
  //the container that draws the first screen that someone will see when they enter the Help Center.
  List<Widget> itemGridCards = [];

  @override
  Widget build(BuildContext context) {
    var currentHelpCenter = widget.helpCenter;

    var screenSize = MediaQuery.of(context).size;

    setState(() {
      itemGridCards.clear();
      for (var element
          in currentHelpCenter.articleCategories[0].categoryArticles) {
        itemGridCards.add(GestureDetector(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HelpCenterArticleDetailView(article: element),
                ))
          },
          child: GridCardElement(
              decorationVariant: decorationPriority.standard,
              cardLabel: element.articleTitle,
              gridSize: Size(size.layoutItemWidth(1, screenSize) * 0.5,
                  size.layoutItemHeight(1, screenSize))),
        ));
      }
    });

    var sizedBox = SizedBox(
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.spaceEvenly,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          runSpacing: 15,
          children: itemGridCards,
        ),
      ),
    );

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.stackScroll,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonIcon: Assets.back,
            buttonHint: 'Exit search',
            buttonAction: () => {Navigator.pop(context)},
            buttonPriority: buttonSize.secondary,
          ),
        ),
        const SizedBox(height: 30.0),
        const DividingHeaderElement(
            headerText: 'Help Center',
            subheaderText:
                'Find the answers to your questions about our software and how it works.'),
        sizedBox,
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard,
        builder: viewLayout,
        takesFullWidth: false);
  }
}

/// A view that shows a full help center article.

class HelpCenterArticleDetailView extends StatefulWidget {
  final HelpCenterArticle article;
  const HelpCenterArticleDetailView({required this.article});

  @override
  _HelpCenterArticleDetailState createState() =>
      _HelpCenterArticleDetailState();
}

class _HelpCenterArticleDetailState extends State<HelpCenterArticleDetailView> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var container = Container(
        constraints: BoxConstraints(
            minWidth: size.layoutItemWidth(1, screenSize),
            maxWidth: size.layoutItemWidth(1, screenSize),
            minHeight: size.layoutItemHeight(5, screenSize),
            maxHeight: size.layoutItemHeight(2, screenSize)),
        decoration: LayerBackingDecoration(
                decorationVariant: decorationPriority.standard)
            .buildBacking(),
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            children: [
              BodyOneText(
                  widget.article.articleBody, decorationPriority.standard)
            ],
          ),
        ));

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        IconButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonIcon: Assets.back,
          buttonHint: 'Return to Help Center.',
          buttonAction: () => {Navigator.pop(context)},
          buttonPriority: buttonSize.secondary,
        ),
        const Spacer(),
        const IconBadge(
            badgeIcon: Assets.lock, badgePriority: decorationPriority.standard),
        const SizedBox(height: 40.0),
        HeadingThreeText(
            widget.article.articleTitle, decorationPriority.standard),
        const SizedBox(height: 25.0),
        container,
        const Spacer(),
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
