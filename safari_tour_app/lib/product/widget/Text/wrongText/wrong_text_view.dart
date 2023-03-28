import 'package:flutter/material.dart';

import '../../../const/text/app_text.dart';

class WrongText extends StatelessWidget {
  const WrongText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text(AppText.wrong)));
  }
}
