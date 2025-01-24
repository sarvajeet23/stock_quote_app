import 'package:flutter/material.dart';

class AsLinearGradient extends StatelessWidget {
  final Color? color;
  final Gradient? gradient;
  final Widget? child;

  const AsLinearGradient({super.key, this.child, this.color, this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: gradient == null ? color : null,
        gradient: gradient ??
            (color == null
                ? const LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null),
      ),
      child: child,
    );
  }
}
