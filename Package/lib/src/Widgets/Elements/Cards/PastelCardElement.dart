import 'package:aureus/aureus.dart';

//A blank card that is a pastel version of the product color
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Cards/Pastel%20Cards.md

class PastelCardElement extends StatelessWidget {
  final String _cardLabel;

  PastelCardElement(this._cardLabel);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192,
      width: 189,
      decoration: CardBackingDecoration(priority: decorationPriority.important)
          .buildBacking(),
      child: Padding(
        padding: const EdgeInsets.only(left: 13, top: 35),
        child: BodyOneText(_cardLabel, decorationPriority.important),
      ),
    );
  }
}