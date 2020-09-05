import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScreen extends StatelessWidget {

  Shimmer _buildShimmer(double height, double width) {
    return Shimmer.fromColors(
      period: Duration(seconds: 1),
      direction: ShimmerDirection.ltr,
      baseColor: Colors.grey[300],
      highlightColor: Colors.white,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        height: height,
        width: width,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildShimmer(10, 200)
      ),
    );
  }
}
