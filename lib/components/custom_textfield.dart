import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatefulWidget {
  final Widget? prefixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  Function(String)? onChanged;
  TextCapitalization textCapitalization;

  final String name;
  List<TextInputFormatter>? inputFormatters;
  TextInputAction? textInputAction;

  CustomTextfield({
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    super.key,
    this.inputFormatters,
    this.hintText,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    required this.onChanged,
    required this.name,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(1, 2),
          color: Color.fromRGBO(212, 212, 212, 0.1),
        )
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12, left: 24),
            child: Text(
              widget.name,
              style: TextStyle(
                  fontFamily: 'SF-Pro-Display',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(137, 106, 219, 1)),
              textAlign: TextAlign.start,
            ),
          ),
          TextFormField(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            inputFormatters: widget.inputFormatters,
            cursorColor: Color.fromRGBO(103, 116, 130, 1),
            textAlignVertical: TextAlignVertical.center,
            minLines: null,
            maxLines: 1,
            autocorrect: false,
            textCapitalization: widget.textCapitalization,
            textInputAction: widget.textInputAction,
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  color: Color.fromRGBO(161, 167, 176, 1),
                  fontSize: 15,
                  fontFamily: 'SF-Pro-Display',
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 20, right: 10),
                child: widget.prefixIcon,
              ),
              prefixIconColor: Color.fromRGBO(137, 106, 219, 1),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'SF-Pro-Display'),
          ),
        ],
      ),
    );
  }
}
