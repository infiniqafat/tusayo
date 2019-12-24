import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tusayo/src/widget/product_card.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductState createState() => new _ProductState();
}

class _ProductState extends State<ProductPage> {
  List<String> _data = [];
  static const offsetVisibleThreshold = 200;
  Future<List<String>> _future;
  int _currentPage = 0, _limit = 10;
  ScrollController _controller =
      ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);

  ///constructor
  _ProductState() {
    _controller.addListener(() {
      var isEnd = _controller.offset == _controller.position.maxScrollExtent;
      if (isEnd)
        setState(() {
          _future = loadData();
        });
    });
    _future = loadData();
  }

  ///Mimic load data
  Future<List<String>> loadData() async {
    for (var i = _currentPage; i < _currentPage + _limit; i++) {
      _data.add('Data item - $i');
    }
    _currentPage += _limit;
    return _data;
  }

  Future<void> makeAnimation() async {
    final max = _controller.position.maxScrollExtent;
    await _controller.animateTo(
      max - offsetVisibleThreshold * 1.5,
      duration: Duration(milliseconds: 2000),
      curve: Curves.easeOut,
    );
  }

  Future<void> refresh() async {
    print("refresh");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          new IconButton( icon: new Icon(FontAwesomeIcons.shoppingCart), tooltip: 'Air it', onPressed:(){

          }),
          new IconButton( icon: new Icon(FontAwesomeIcons.whatsapp), tooltip: 'Air it', onPressed:(){

          }),
        ],
        iconTheme: IconThemeData(
            color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text("Semua Sayur", style: TextStyle(color: Colors.black),) 
      ),
      body: RefreshIndicator(
        child: FutureBuilder(
          future: _future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
            if (snapshot.hasData) {
              List<String> loaded = snapshot.data;
              return GridView.builder(
                  itemCount: loaded.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isPortrait ? 2 : 4,
                    childAspectRatio: isPortrait?0.65:0.6 //MediaQuery.of(context).size.height / 1050,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return new GestureDetector(
                      child: buildProductCard(context),
                      onTap: () {},
                    );
                  });
            }
            return LinearProgressIndicator();
          },
        ),
        onRefresh: refresh,
      ),
    );
  }
}
