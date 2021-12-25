import 'package:aureus/aureus.dart';

//A carousel that contains an icon and label to describe the details of an object
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/5%20-%20Components%20(Bricks)/Collection%20Views/Detail%20Carousel.md

class DetailCarouselComponent extends StatefulWidget {
  final List<String> cardLabels;
  final List<IconData> cardIcons;

  DetailCarouselComponent({required this.cardLabels, required this.cardIcons});

  @override
  _DetailCarouselComponentState createState() =>
      _DetailCarouselComponentState();
}

class _DetailCarouselComponentState extends State<DetailCarouselComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Padding(
              padding: size.universalPadding(),
              child: Container(
                decoration: TabItemBackingDecoration(
                        variant: tabItemDecorationVariants.roundedRectangle,
                        priority: decorationPriority.standard)
                    .buildBacking(),
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        widget.cardIcons[index],
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      TagTwoText(widget.cardLabels[index],
                          decorationPriority.standard),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: widget.cardLabels.length,
      ),
    );
  }
}