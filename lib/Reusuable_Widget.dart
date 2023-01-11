import 'package:flutter/cupertino.dart';

class ReusuableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardchild;
  final void Function()? onPress;

  const ReusuableCard(
      {super.key, required this.colour, this.cardchild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Expanded(
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10),
          ),
          child: cardchild,
        ),
      ),
    );
  }
}
