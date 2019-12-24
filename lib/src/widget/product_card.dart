
import 'package:flutter/material.dart';
import 'package:tusayo/src/helper/color.dart';
import 'package:tusayo/src/widget/button_action.dart';

Widget buildProductCard(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.48,
      height: 280.0,
      constraints: BoxConstraints(minWidth: 100, maxWidth: 180),
      child: Stack(
        children: <Widget>[
          Card(
            elevation: 4.0,
            child: Column(
              children: <Widget>[
                Container(
                  height: 100.0,
                  margin: EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width / 2.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://tusayo.com/admin_tso/assets/img/produk/brokoli-min.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: SizedBox(
                          width: 60.0,
                          height: 15.0,
                          child: RaisedButton(
                            padding: EdgeInsets.all(1.0),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.blue[300])),
                            onPressed: () {},
                            color: Colors.blue[300],
                            textColor: Colors.white,
                            child:
                                Text("New", style: TextStyle(fontSize: 10.0)),
                          ),
                        ),
                        top: 0.0,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Cabe Campur R.Merah Hijau',
                        style:
                            TextStyle(fontSize: 16.0, color: AppPalette.green),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Isi 1/ Kg',
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Rp 120.000 ",
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.black,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(
                            width: 1.0,
                          ),
                          SizedBox(
                            width: 60.0,
                            height: 15.0,
                            child: RaisedButton(
                              padding: EdgeInsets.all(1.0),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.red[300])),
                              onPressed: () {},
                              color: Colors.red[300],
                              textColor: Colors.white,
                              child: Text("Save 10 %",
                                  style: TextStyle(fontSize: 10.0)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Rp 100.000 ",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 1.0,
                          ),
                          Text(
                            "/ Bungkus ",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      ButtonAction(
                        label: "Beli",
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  