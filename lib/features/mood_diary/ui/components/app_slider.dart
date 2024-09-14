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
