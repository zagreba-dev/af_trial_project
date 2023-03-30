import 'package:flutter/material.dart';

class MovieCardSkeletonLoader extends StatelessWidget {
  const MovieCardSkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AspectRatio(
            aspectRatio: 164 / 215,
            child: Container(
              color: const Color(0xFF303030),
            )),
        const SizedBox(height: 12),
        Expanded(
          flex: 21,
          child: Container(
            color: const Color(0xFF3D3D3D),
            child: const AspectRatio(aspectRatio: 66 / 21),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          flex: 19,
          child: Container(
              color: const Color(0xFF4D4D4D),
              child: const AspectRatio(aspectRatio: 136 / 19)),
        ),
        const SizedBox(height: 4),
        Expanded(
          flex: 19,
          child: Container(
              color: const Color(0xFF4D4D4D),
              child: const AspectRatio(aspectRatio: 109 / 19)),
        )
      ]),
    );
  }
}
