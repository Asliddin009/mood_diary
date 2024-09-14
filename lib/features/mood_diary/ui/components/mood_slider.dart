// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:mood_diary/features/mood_diary/ui/components/app_slider.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    required this.leftText,
    required this.rightText,
    required this.onSwitched,
    super.key,
  });
  final String leftText;
  final String rightText;
  final Function(double value) onSwitched;
  @override
  // ignore: library_private_types_in_public_api
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 16, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 8,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppSlider(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.leftText,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    widget.rightText,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
