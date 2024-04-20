import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCheckbox extends StatefulWidget {
  final Function()? onChanged;
  final double width;
  final double height;
  final bool isActive;

  CustomCheckbox({
    super.key,
    this.isActive = false,
    this.width = 24.0,
    this.height = 24.0,
    this.onChanged,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onChanged,
      child: Container(
        width: widget.width,
        height: widget.height,
        child: widget.isActive
            ? SvgPicture.asset('assets/icons/active_icon/check_box_active.svg')
            : SvgPicture.asset('assets/icons/check_box.svg'),
      ),
    );
  }
}
