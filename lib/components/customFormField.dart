import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vdev20210801/constants/palette.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType keyBoardType;
  final String Function(String) validator;
  final List<TextInputFormatter> inputFormat;
  final bool obscureText;

  const CustomFormField(
      {Key key,
      this.textEditingController,
      this.hintText,
      this.keyBoardType,
      this.validator,
      this.inputFormat,
      this.obscureText})
      : super(key: key);

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool obscureTextState = false;
  bool showPassword = false;

  void obscureTap() {
    setState(() {
      obscureTextState = !obscureTextState;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!showPassword) obscureTextState = widget.obscureText;
    return TextFormField(
      controller: widget.textEditingController,
      validator: widget.validator,
      textInputAction: TextInputAction.next,
      keyboardType: widget.keyBoardType,
      inputFormatters: widget.inputFormat,
      obscureText: obscureTextState,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
            borderSide: BorderSide(width: 1, color: Palette.tomato)),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
            borderSide: BorderSide(width: 1, color: Color(0xFF656E86))),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
            borderSide: BorderSide(width: 1, color: Color(0xFFe4e8f4))),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusColor: Color(0xFF656E86),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.silverBackground, width: 1.0),
            borderRadius: BorderRadius.circular(5.0)),
        fillColor: Palette.white,
        hintStyle: TextStyle(fontSize: 14, color: Palette.blueyGrey),
        hintText: widget.hintText,
        alignLabelWithHint: true,
        filled: true,
        suffixIcon: widget.obscureText
            ? InkWell(
                child: Icon(
                    obscureTextState ? Icons.visibility : Icons.visibility_off,
                    size: 20.0,
                    color: Palette.blueyGrey),
                onTap: () {
                  showPassword = true;
                  obscureTap();
                },
              )
            : null,
      ),
    );
  }
}
