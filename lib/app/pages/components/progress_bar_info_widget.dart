import 'package:flutter/material.dart';

class ProgressBarInfoWidget extends StatelessWidget {
  const ProgressBarInfoWidget({
    Key? key,
    required this.info,
    required this.title,
  }) : super(key: key);

  final String info;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          info,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.3,
            color: Colors.white,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
