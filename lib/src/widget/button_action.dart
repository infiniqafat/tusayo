import 'package:flutter/material.dart';

class ButtonAction extends StatefulWidget {
  const ButtonAction({
    this.height,
    this.onPress,
    this.label,
  });

  final int height;
  final onPress;
  final String label;

  @override
  _ButtonActionState createState() => _ButtonActionState();
}

class _ButtonActionState extends State<ButtonAction> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height == null ? 40.0 : widget.height,
      child: RaisedButton(
        onPressed: widget.onPress,
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF7BAD00),
                  Color(0xFF7BAD00),
                  Color(0xFFB5E51D),
                  
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: new Text(widget.label.toUpperCase(),
              style: TextStyle(fontSize: 16, color: Colors.black)),
        ),
      ),
    );
  }
}
