import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tusayo/src/helper/CustomTextStyle.dart';

class Account extends StatefulWidget {
  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<Account> {
  List<String> list = [
    'Profil',
    'Alamat',
    'Transaksi',
    "Privasi Dan Kebijakan",
    "Bantuan",
    "Keluar"
  ];

  @override
  void initState() {
    super.initState();
  }

  final appVersionLabel = Container(
    padding: EdgeInsets.all(20.0),
    child: Center(
      child: Text(
        "versi aplikasi 1.0",
        style: TextStyle(fontSize: 14.0, color: Colors.grey),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Akun",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: <Widget>[
          profileName(),
          SizedBox(
            height: 20.0,
          ),
          listMenu1(),
          SizedBox(
            height: 8.0,
          ),
          appVersionLabel
        ],
      ),
    );
  }

  Widget profileName(){
    return         
        Container(
            height: 150.0,
                child: new Center(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                new Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new ExactAssetImage(
                                'assets/img/user_def.jpg'
                            )
                        )
                    )
                ),
                new Text("John Doe", textScaleFactor: 1.5)
              ],
                  )
                
            ),
          );
  }

  Widget listMenu1() {
    return Container(
        height: 340.0,
        padding: EdgeInsets.only(top: 5.0),
        child: Card(
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
              );
            },
            itemBuilder: (context, i) {
              return listItem(list[i]);
            },
            itemCount: list.length,
          ),
        ));
  }

  Widget listItem(item){
    return InkWell(
        splashColor: Colors.teal.shade200,
        onTap: () {
          Navigator.pushNamed(context, '/login');
        },
        child: Container(
          padding: EdgeInsets.only(top: 5, left: 24, right: 8, bottom: 5),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      color: Colors.transparent 
                  ),
                  child: Icon(Icons.lock),
                ),
                flex: 8,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    item,
                    style: CustomTextStyle.textFormFieldMedium,
                  ),
                ),
                flex: 84,
              ),
              Expanded(
                child: Container(
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  ),
                ),
                flex: 8,
              ),
            ],
          ),
        ),
      );
  }

  
}
