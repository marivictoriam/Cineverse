import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final List<Color> colors1;
  final List<Color> colors2;
  final List<double> stops;
  final int option;

  const Background(
      {super.key,
      required this.option,
      this.colors1 = const [Colors.transparent, Colors.black87],
      this.colors2 = const [
        Colors.transparent,
        Color.fromARGB(207, 31, 31, 31)
      ],
      this.stops = const [0.0, 1.0]})
      : assert(colors1.length == stops.length,
            'Stops and Colors must be same length');

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: option == 1 ? colors1 : colors2,
              stops: stops,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    ));
  }
}
