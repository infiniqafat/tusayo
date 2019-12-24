import 'package:flutter/material.dart';
import 'package:tusayo/src/helper/color.dart';

class InputField extends StatefulWidget {
  const InputField({
    this.fieldKey,
    this.maxLength,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.readonly,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType,
    this.isPassword,
  });

  final Key fieldKey;
  final int maxLength;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final bool readonly;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final TextInputType textInputType;
  final bool isPassword;
  
  

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: TextFormField(
          key: widget.fieldKey,
          obscureText: widget.isPassword != null ? true : false,
          keyboardType: widget.textInputType == null ?TextInputType.text:widget.textInputType,
          readOnly: widget.readonly==null?false:widget.readonly,
          onSaved: widget.onSaved,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: new InputDecoration(
            prefixIcon: widget.prefixIcon == null?null: Icon(widget.prefixIcon, color: AppPalette.green),
            suffixIcon: widget.suffixIcon==null?null:Icon(widget.suffixIcon,color: Colors.black),
            // filled: true,
            hintText: widget.hintText,
            labelText: widget.labelText,
            helperText: widget.helperText,
            contentPadding:EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0),
              borderSide: new BorderSide(color: Colors.grey[300]),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0),
              borderSide: new BorderSide(color: Colors.grey[300]),
            ),
            
            // filled: true,
          ),
          style: TextStyle(fontSize: 14.0),
        ),
      );
  }
}