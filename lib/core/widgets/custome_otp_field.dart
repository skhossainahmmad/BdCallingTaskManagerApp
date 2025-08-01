import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOtpField extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;
  final double fieldSize;
  final double gapSize;
  final TextStyle? textStyle;
  final Color? cursorColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? disabledBorderColor;
  final double borderWidth;
  final double borderRadius;

  const CustomOtpField({
    Key? key,
    this.length = 6,
    this.onCompleted,
    this.onChanged,
    this.fieldSize = 50,
    this.gapSize = 10,
    this.textStyle,
    this.cursorColor,
    this.borderColor,
    this.focusedBorderColor,
    this.disabledBorderColor,
    this.borderWidth = 2,
    this.borderRadius = 8,
  }) : super(key: key);

  @override
  _CustomOtpFieldState createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;
  late List<String> _otp;

  @override
  void initState() {
    super.initState();
    _initializeOtpFields();
  }

  void _initializeOtpFields() {
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
    _otp = List.filled(widget.length, '');
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1) {
      _otp[index] = value;
      if (index < widget.length - 1) {
        _focusNodes[index].unfocus();
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        _focusNodes[index].unfocus();
      }
      widget.onChanged?.call(_otp.join());
      if (_otp.every((element) => element.isNotEmpty)) {
        widget.onCompleted?.call(_otp.join());
      }
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index].unfocus();
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) => _buildOtpField(index)),
    );
  }

  Widget _buildOtpField(int index) {
    return Container(
      width: widget.fieldSize,
      height: widget.fieldSize,
      margin: EdgeInsets.symmetric(horizontal: widget.gapSize / 2),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        style:
            widget.textStyle ??
            const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
        cursorColor: widget.cursorColor ?? Colors.white,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.white.withOpacity(0.5),
              width: widget.borderWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.white.withOpacity(0.5),
              width: widget.borderWidth,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              color: widget.focusedBorderColor ?? Colors.white,
              width: widget.borderWidth,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              color: widget.disabledBorderColor ?? Colors.grey,
              width: widget.borderWidth,
            ),
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.04),
        ),
        onChanged: (value) => _onChanged(value, index),
      ),
    );
  }
}
