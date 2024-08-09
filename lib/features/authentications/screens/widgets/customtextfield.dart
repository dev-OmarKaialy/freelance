import 'package:flutter/material.dart';



class CustomTextField extends StatelessWidget {
  final String hintText;
  final VoidCallback onTap;
  final Color hintColor;
  final double hintSize;
  final Color borderColor;
  final Color focusedBorderColor;
  final double width;
  final double? hight;
  final Widget? icon;
  final Color? iconColor;
  final TextEditingController? controller; // Add this line

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.onTap,
    this.hintColor = Colors.grey,
    this.hintSize = 16,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.width = double.infinity,
    this.hight = double.infinity,
    this.icon,
    this.iconColor,
    this.controller, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: TextField(
          controller: controller, // Add this line
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintColor,
              fontSize: hintSize,
            ),
            border: buildBorder(borderColor),
            enabledBorder: buildBorder(borderColor),
            focusedBorder: buildBorder(focusedBorderColor),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder(color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color));
  }
}