import 'package:flutter/material.dart';

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  const SliverCustomHeaderDelegate(
      {@required this.minHeight, @required this.maxHeight, this.child});

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlaps) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;
  @override
  double get minExtent => minHeight;
  @override
  bool shouldRebuild(SliverCustomHeaderDelegate oldDelegate) =>
      oldDelegate.shouldRebuild(oldDelegate);
}
