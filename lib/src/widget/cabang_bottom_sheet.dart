import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tusayo/src/helper/color.dart';

Future brachBottomSheet(BuildContext context) async {
  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(16.0),
          topRight: const Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext bc) {
        return Container(
          height: 300.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0))),
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    child: Icon(Icons.close),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              label(context, 'Pilih Cabang'),
              touchInputText(context),
              label(context, 'Pilih Tanggal Kirim'),
              dateRow(),
              buttonAction()
            ],
          ),
        );
      });
}

Widget label(context, label) {
  return Container(
    padding: EdgeInsets.only(bottom: 10.0),
    child: GestureDetector(
      onTap: () {
        brachSelect(context);
      },
      child: new Text(
        label,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
        textAlign: TextAlign.start,
      ),
    ),
  );
}

Widget touchInputText(context) {
  return GestureDetector(
      onTap: () {
        brachSelect(context);
      },
      child: AbsorbPointer(child: inputText()));
}

Widget inputText() {
  return new Container(
    padding: EdgeInsets.only(bottom: 10.0),
    child: TextFormField(
      //dsadreadOnly: true,
      decoration: new InputDecoration(
        prefixIcon: Icon(Icons.pin_drop, color: AppPalette.green),
        suffixIcon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        //hintText: "adsad",
        // labelText: "sadsa",
        //helperText: "sadas",
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


Widget inputTextQty() {
  return new Container(
    padding: EdgeInsets.only(bottom: 5.0),
    height: 40.0,
    child: TextFormField(
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
        prefixIcon: Icon(Icons.remove, color: AppPalette.green),
        suffixIcon: Icon(
          Icons.add,
          color: Colors.black,
        ),
        contentPadding:EdgeInsets.only(top: 5.0, bottom: 5.0, left: 0.0, right: 0.0),
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
      textAlign: TextAlign.center,
    ),
  );
}

Widget buttonAction({String label:"BELI"}) {
  return SizedBox(
    height: 45.0,
    child: RaisedButton(
    onPressed: () {},
    textColor: Colors.white,
    padding: const EdgeInsets.all(0.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    child: Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF66BB6A),
              Color(0xFF66BB6A),
              Color(0xFF66BB6A),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: new Text(label, style: TextStyle(fontSize: 16)),
    ),
  ),
  );
}

Widget dateRow() {
  return Padding(
    padding: EdgeInsets.only(bottom: 10.0),
    child: Container(
      height: 80.0,
      alignment: Alignment.center,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          dateSelectItem(
            active: true,
          ),
          dateSelectItem(
            active: false,
          ),
          dateSelectItem(active: false),
        ],
      ),
    ),
  );
}

Widget dateSelectItem({active: false}) {
  return Container(
    margin: EdgeInsets.only(left: 10.0),
    padding: EdgeInsets.all(10.0),
    decoration: new BoxDecoration(
        border: Border.all(
            color: active ? Colors.green : Colors.grey[300],
            width: active ? 3.0 : 1.0),
        borderRadius: BorderRadius.circular(5.0)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Icon(
            FontAwesomeIcons.calendarDay,
            color: AppPalette.green,
            size: 16.0,
          ),
        ),
        Text(
          "Rabu",
          style: TextStyle(
              fontSize: 12.0, color: active ? AppPalette.green : Colors.black),
        ),
        Text(
          "12 Desember",
          style: TextStyle(
              fontSize: 12.0, color: active ? AppPalette.green : Colors.black),
        ),
      ],
    ),
  );
}

Future brachSelect(BuildContext context) async {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
          contentPadding: EdgeInsets.only(top: 0.0, bottom: 10.0),
          content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Center(
                    child: new Text(
                      "Pilih Cabang",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  color: Colors.grey[300],
                ),
                LabeledRadio(
                  label: 'Cikupa',
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  value: true,
                  groupValue: true,
                  onChanged: (bool newValue) {
                    print(newValue);
                  },
                ),
              ])));
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) onChanged(value);
      },
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio<bool>(
              groupValue: groupValue,
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
