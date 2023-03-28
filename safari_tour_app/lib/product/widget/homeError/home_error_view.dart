import 'package:flutter/material.dart';

import '../../../feature/home/cubit/home_state.dart';

class HomeErrorView extends StatelessWidget {
  final HomeError state;
  const HomeErrorView(
    this.state, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(state.message);
  }
}
