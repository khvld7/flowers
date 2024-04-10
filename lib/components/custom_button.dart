import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Widget? child;
  final double? height;

  final Function() onPressed;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final Color? color;
  final Color? textColor;
  final Border? border;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.height,
    this.padding,
    this.margin,
    this.alignment,
    this.color,
    this.textColor,
    this.border,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.alignment,
      decoration: BoxDecoration(
        color: widget.color,
        border: widget.border,
        borderRadius: BorderRadius.circular(10),
      ),
      height: widget.height,
      padding: widget.padding,
      margin: widget.margin,
      child: RawMaterialButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: widget.onPressed,
        child: widget.child,
        textStyle: TextStyle(
            color: widget.textColor,
            fontFamily: 'SF-Pro-Display',
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
