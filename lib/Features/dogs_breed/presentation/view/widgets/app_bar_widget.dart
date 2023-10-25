import 'package:dogs_images/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text("Dog Breeds", style: Styles.textStyle),
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }
}
