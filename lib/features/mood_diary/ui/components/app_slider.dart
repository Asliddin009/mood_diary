import 'package:flutter/material.dart';

class AppSlider extends StatefulWidget {
  const AppSlider({
    required this.width,
    required this.height,
    super.key,
  });
  final double width;
  final double height;
  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  double x = 0;
  bool flag = false;
  void updateX(double newX) {
    setState(() {
      x = newX;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0, -0.5),
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  child: const _RowMarker(),
                ),
              ),
              // Align(
              //   alignment: const Alignment(-1, 0),
              //   child: Container(
              //     width: widget.width,
              //     margin: const EdgeInsets.only(
              //       top: 15,
              //     ),
              //     height: 7,
              //     decoration: const BoxDecoration(
              //         color: Colors.grey,
              //         borderRadius: BorderRadius.all(Radius.circular(25))),
              //     child: Align(
              //       alignment: const Alignment(-1, 0),
              //       child: Container(
              //         width: (widget.width / 2) + (widget.width / 2) * x,
              //         height: 7,
              //         decoration: const BoxDecoration(
              //             color: Colors.orange,
              // ignore: lines_longer_than_80_chars
              //             borderRadius: BorderRadius.all(Radius.circular(25))),
              //       ),
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment.centerLeft,
                child: Slider(
                  value: x,
                  min: -1,
                  activeColor: flag ? Colors.orange : Colors.grey,
                  inactiveColor: Colors.grey,
                  divisions: 6,
                  onChanged: (value) {
                    setState(() {
                      x = value;
                      flag = true;
                    });
                  },
                ),
              ),
              // Align(
              //   alignment: Alignment(x, 0),
              //   child: GestureDetector(
              //     onHorizontalDragUpdate: (details) {
              //       final newX = x + details.delta.dx / 150;
              //       if (newX > 1) {
              //         updateX(1);
              //       } else if (newX < -1) {
              //         updateX(-1);
              //       } else {
              //         updateX(newX);
              //       }
              //     },
              //     onPanUpdate: (DragUpdateDetails details) {},
              //     onPanEnd: (details) {
              //       updateX(0);
              //     },
              //     child: Container(
              // ignore: lines_longer_than_80_chars
              //       margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
              //       width: 25,
              //       height: 25,
              //       decoration: BoxDecoration(
              //           color: Colors.orange,
              //           border: Border.all(width: 5, color: Colors.white),
              //           borderRadius:
              //               const BorderRadius.all(Radius.circular(25))),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _RowMarker extends StatelessWidget {
  const _RowMarker();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 10,
          width: 1,
          color: Colors.grey,
        ),
        Container(
          height: 10,
          width: 1,
          color: Colors.grey,
        ),
        Container(
          height: 10,
          width: 1,
          color: Colors.grey,
        ),
        Container(
          height: 10,
          width: 1,
          color: Colors.grey,
        ),
        Container(
          height: 10,
          width: 1,
          color: Colors.grey,
        ),
        Container(
          height: 10,
          width: 1,
          color: Colors.grey,
        ),
        Container(
          height: 10,
          width: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}

// double _roundToNearest(double value) {
//   // Список всех возможных значений.
//   List<double> possibleValues = [-1, -0.7, -0.35, 0, 0.35, 0.7, 1];

//   // Функция находит ближайшее значение.
//   double closest = possibleValues[0];
//   double minDistance = (value - closest).abs();

//   for (double candidate in possibleValues) {
//     double distance = (value - candidate).abs();
//     if (distance < minDistance) {
//       closest = candidate;
//       minDistance = distance;
//     }
//   }

//   return closest;
// }
