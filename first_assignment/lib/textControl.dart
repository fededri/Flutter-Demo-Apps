import 'package:flutter/cupertino.dart';

import 'customText.dart';

class TextControl extends StatelessWidget {
  final bool wasButtonPressed;

  TextControl(this.wasButtonPressed);

  @override
  Widget build(BuildContext context) {
    return wasButtonPressed ? CustomText("Other text") : CustomText("Some text");
  }
}
