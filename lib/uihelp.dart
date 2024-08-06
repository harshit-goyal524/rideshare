import 'package:flutter/material.dart';

class UIHelper {
  // Small Elevated Button
  static Widget smallElevatedButton({
    required String text,
    required VoidCallback onPressed,
    Color backgroundColor = Colors.blue,
    Color textColor = Colors.white,
    double borderRadius = 8.0,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
        vertical: 8.0, horizontal: 16.0),
  }) {
    return LayoutBuilder(builder: (context, constraints) {
      double screenwidth = constraints.maxWidth;
      double buttonwidth = screenwidth / 2;
      return Container(
        width: buttonwidth,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: padding,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    },
    );
  }

  // Large Elevated Button
  static Widget largeElevatedButton({
    required String text,
    required VoidCallback onPressed,
    Color backgroundColor = Colors.blue,
    Color textColor = Colors.white,
    double borderRadius = 14.0,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
        vertical: 16.0, horizontal: 32.0),
  }) {
    return LayoutBuilder(builder: (context, constraints) {
      double screenwidth = constraints.maxWidth;
      double buttonwidth = (screenwidth * 2) / 3;

      return Container(
        width: buttonwidth,
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: padding,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      );
    }
    );
  }
}
