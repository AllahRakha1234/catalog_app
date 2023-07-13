
import 'package:flutter/material.dart';
import '../../themes/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.bold.xl5.color(MyTheme.blackColor).make(),
        "Trending Products".text.bold.xl2.make(),
      ],
    );
  }
}