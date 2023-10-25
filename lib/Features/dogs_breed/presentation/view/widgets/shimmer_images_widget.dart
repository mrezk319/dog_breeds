import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImages extends StatelessWidget {
  const ShimmerImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: const SizedBox(
        width: 200,
        height: 200,
      ),
    );
  }
}
