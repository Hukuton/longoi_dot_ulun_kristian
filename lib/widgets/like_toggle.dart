import 'package:flutter/material.dart';

class LikeToggle extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final IconData? activeIcon;
  final IconData? inactiveIcon;
  final double? size;
  const LikeToggle({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor, // = Colors.red,
    this.inactiveColor, // = Colors.grey,
    this.activeIcon = Icons.favorite,
    this.inactiveIcon = Icons.favorite,
    this.size = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _value = value;
    return GestureDetector(
      child: value
          ? Icon(
              activeIcon,
              color: activeColor,
              size: size,
            )
          : Icon(
              inactiveIcon,
              color: inactiveColor,
              size: size,
            ),
      onTap: () {
        _value = !_value;
        onChanged(_value);
      },
    );
  }
}
