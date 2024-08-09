import 'package:flutter/material.dart';


class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.backgroundColor,
    this.iconColor,
    this.borderColor,
    required this.textColor,
    this.width, // Add width parameter
    this.height, // Add height parameter
  });

  final String text;
  final VoidCallback onPressed;
  final Widget icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final Color textColor;
  final double? width; // Add width parameter
  final double? height; // Add height parameter

  @override
  Widget build(BuildContext context) {
    return SizedBox( // Wrap with SizedBox
      width: width, // Set width
      height: height, // Set height
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            // color: backgroundColor?? Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: borderColor?? Theme.of(context).primaryColor,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: iconColor?? Theme.of(context).primaryColor,
                  child: icon,
                ),
                const SizedBox(width: 5),
                Text(
                  text,
                  style: TextStyle(

                    color: textColor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}