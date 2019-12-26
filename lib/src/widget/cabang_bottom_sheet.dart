import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:tusayo/src/helper/color.dart';
import 'package:tusayo/src/model/global_model.dart';
import 'package:tusayo/src/widget/button_action.dart';
import 'package:tusayo/src/widget/label_radio.dart';

Future brachBottomSheet(BuildContext context) async {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(16.0),
          topRight: const Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext bc) {
        return CabangSelect();
      });
}

class CabangSelect extends StatefulWidget {
  const CabangSelect();
  @override
  _CabangSelectState createState() => _CabangSelectState();
}

class _CabangSelectState extends State<CabangSelect> {
  List<Cabang> _cabangOptions = [];
  Cabang _cabangSelected;
  TextEditingController _cabangCtrl = new TextEditingController();
  
  List<dynamic> _dateOptions = [];
  dynamic _dateSelected;
  
  @override
  void initState() {
    super.initState();
    _getCabang();
    _getDate();

  }
  void _getDate() async {
    DateTime startDate = DateTime.now();
    DateTime endDate = startDate.add(Duration(days: 2));
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
        if (i == 0){
          _dateSelected = startDate;
        }
      _dateOptions.add(startDate.add(Duration(days: i)));
    }
  }
  void _getCabang() async {
    _cabangOptions.add(new Cabang(
      id: 1,
      name: 'Cikupa'
    ));
    _cabangOptions.add(new Cabang(
      id: 2,
      name: 'Tangerang'
    ));
    _cabangSelected = new Cabang(
      id:1,
      name: 'Cikupa'
    );
    _cabangCtrl.text = _cabangSelected.name; 
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height:350.0, //MediaQuery.of(context).size.height-300.0,//900,//double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0))
        ),
      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          closeIcon(),
          label(context, 'Pilih Cabang'),
          touchInputText(context),
          label(context, 'Pilih Tanggal Kirim'),
          dateRow(),
          ButtonAction(label: 'Simpan', onPress: (){
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
  Widget closeIcon(){
    return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                child: Icon(Icons.close),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
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
        controller: _cabangCtrl,
        decoration: new InputDecoration(
          prefixIcon: Icon(Icons.pin_drop, color: AppPalette.green),
          suffixIcon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          contentPadding:
              EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
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
          contentPadding:
              EdgeInsets.only(top: 5.0, bottom: 5.0, left: 0.0, right: 0.0),
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

  Widget dateRow() {
    return Center(
      child: Container(
          height: 100.0,
          width: 350.0,
          alignment: Alignment.center,
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: _dateOptions.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:3, //MediaQuery.of(context).size.height / 1050,
                  childAspectRatio: 1.3 //2.5, // 1.3,
                  ),
              itemBuilder: (BuildContext context, int i) {
                return new GestureDetector(
                  child: dateSelectItem(
                    active: _dateOptions[i] == _dateSelected ? true:false,
                    item: _dateOptions[i]
                  ),
                  onTap: () {
                    setState(() {
                      _dateSelected = _dateOptions[i];
                    });
                  },
                );
              })
      ),
    );
  }

  Widget dateSelectItem({active: false,DateTime item}) {
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
            DateFormat.EEEE('id_ID').format(item),
            style: TextStyle(
                fontSize: 14.0,
                color: active ? AppPalette.green : Colors.black),
          ),
          Text(
            DateFormat.d().format(item)+' '+DateFormat.MMMM('id_ID').format(item),
            style: TextStyle(
                fontSize: 14.0,
                color: active ? AppPalette.green : Colors.black),
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
                  SizedBox(
                    height: 200.0,
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.grey,
                        );
                      },
                      itemBuilder: (context, i) {
                        return LabeledRadio(
                            label: _cabangOptions[i].name,
                            padding: const EdgeInsets.symmetric(horizontal: 0.0),
                            value: _cabangOptions[i].id,
                            groupValue: _cabangSelected.id ,
                            onChanged: (int newValue) {
                              print(newValue);
                              Cabang d  = _cabangOptions.singleWhere((cabang) => cabang.id == newValue );
                              setState(() {
                                _cabangSelected = d;
                              });
                              _cabangCtrl.text = d.name;
                            },
                          );
                      },
                      itemCount: _cabangOptions.length,
                    ),
                  )
                ])));
  }
}

