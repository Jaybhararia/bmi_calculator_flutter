import 'package:flutter/cupertino.dart';
import 'constants.dart';

class IdentifierWidget extends StatelessWidget {
  final IconData newicon;
  final String gender;

  const IdentifierWidget(this.newicon, this.gender,
      {super.key}); // IdentifierWidget()

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          newicon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: newstyle,
        )
      ],
    );
  }
}
