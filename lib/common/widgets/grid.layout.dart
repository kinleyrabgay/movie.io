import 'package:flutter/cupertino.dart';
import 'package:movieio/common/utils/constants/sizes.dart';

class MVGridLayout extends StatelessWidget {
  const MVGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent,
    required this.itemBuilder,
    this.crossAxisCount = 2,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final int crossAxisCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: mainAxisExtent,
        mainAxisSpacing: MVSizes.gridViewSpacing,
        crossAxisSpacing: MVSizes.gridViewSpacing,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
