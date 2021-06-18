import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class FullPageShimmerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShimmerPage(),
    );
  }
}

class ShimmerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      color: Colors.yellow,
      height: 50,
      width: 200,
      child: Shimmer(
        //Default value
        duration: Duration(milliseconds: 400),
        //Default value: Duration(seconds: 0)
        interval: Duration(milliseconds: 100),
        //Default value
        color: Colors.white,
        //Default value
        enabled: true,
        //Default value
        direction: ShimmerDirection.fromLeftToRight(),
        child: Container(
          color: Colors.deepPurple,
        ),
      ),
    )));
  }
}
