import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tusayo/src/helper/color.dart';
import 'package:tusayo/src/model/global_model.dart';
import 'package:tusayo/src/widget/cabang_bottom_sheet.dart';
import 'package:tusayo/src/widget/product_card.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Category> _categoryItem = [];
  List<SliderM> _sliderItem = [];
  int _currentSlider = 0;

  @override
  void initState() {
    super.initState();
    _categoryItem.add(new Category(
        id: 1,
        name: "Sayur dan Buah",
        image: "https://tusayo.com/assets/images/home/1.png"));
    _categoryItem.add(new Category(
        id: 2,
        name: "Lauk Pauk",
        image: "https://tusayo.com/assets/images/home/2.png"));
    _categoryItem.add(new Category(
        id: 3,
        name: "Bumbu",
        image: "https://tusayo.com/assets/images/home/3.png"));
    _categoryItem.add(new Category(
        id: 4,
        name: "Lain Lain",
        image: "https://tusayo.com/assets/images/home/4.png"));

    _sliderItem.add(new SliderM(
        id: 4,
        name: "Lain Lain",
        image: "https://tusayo.com/assets/images/home_1.jpg"));

    _sliderItem.add(new SliderM(
        id: 4,
        name: "Lain Lain",
        image: "https://tusayo.com/assets/images/home_2.jpg"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHomeAppBar(),

      body: new Container(
        child: new ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            _buildCarausel(context),
            _buildCategory(),
            Container(
              height: 10.0,
              color: Colors.grey[100],
            ),
            _buildHomeProduct(),
            _buildShippingOne(),
            _buildShippingTwo(),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildHomeProduct() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 20.0, left: 10.0, bottom: 20.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              bottom: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Sayuran Segar",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                SizedBox(
                  height: 25.0,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/product');
                    },
                    color: Colors.transparent,
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Text("Lihat Semua",
                            style: TextStyle(
                                fontSize: 12.0, color: AppPalette.green)),
                        Icon(Icons.arrow_forward_ios,
                            size: 10.0, color: AppPalette.green),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
              height: 280.0,
              color: Colors.white,
              alignment: Alignment.topCenter,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(top: 0.0),
                itemCount: 10,
                itemBuilder: (BuildContext context, int i) =>
                    buildProductCard(context),
              ))
        ],
      ),
    );
  }

  Widget _buildShippingTwo() {
    return Container(
      color: Colors.white,
      padding:
          EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0, bottom: 20.0),
      child: Column(
        children: <Widget>[
          _buildTitleCategory("Belanja sayur di tusayo.com"),
          Container(
            height: 20.0,
          ),
          _buildContentText1("Produk"),
          _buildContentText2("Segar dan kualitas produk terpilih."),
          _buildContentText1("Harga"),
          _buildContentText2("Murah dan terjangkau."),
          _buildContentText1("Transksi"),
          _buildContentText2("Mudah dan aman."),
          _buildContentText1("Pengiriman"),
          _buildContentText2("Kurir yang pengalaman dan tepat waktu."),
        ],
      ),
    );
  }

  Widget _buildShippingOne() {
    return Container(
      color: Color.fromRGBO(240, 240, 240, 1),
      padding:
          EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0, bottom: 20.0),
      child: Column(
        children: <Widget>[
          _buildTitleCategory("Cara beli sayur di tusayo.com"),
          Container(
            height: 20.0,
          ),
          _buildContentText1("Pesan"),
          _buildContentText2("Pesan sayuran melalui website."),
          _buildContentText1("Pembayaran"),
          _buildContentText2("Proses pembayaran melalui COD/Transfer."),
          _buildContentText1("Kirim"),
          _buildContentText2("Pesanan di kirim esok hari."),
        ],
      ),
    );
  }

  Widget _buildCarausel(BuildContext mediaContext) {
    return Stack(
      children: <Widget>[
        CarouselSlider(
          autoPlay: true,
          height: 250.0,
          viewportFraction: 1.0,
          autoPlayInterval: Duration(seconds: 10),
          aspectRatio: MediaQuery.of(mediaContext).size.aspectRatio,
          onPageChanged: (index) {
            setState(() {
              _currentSlider = index;
            });
          },
          items: _sliderItem.map((sm) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    padding: EdgeInsets.only(bottom: 60.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(sm.image), fit: BoxFit.cover),
                    ),
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
        Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_sliderItem.length, (index) {
                return Container(
                  width: 15.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentSlider == index
                          ? Colors.green
                          : Color.fromRGBO(0, 0, 0, 0.8)),
                );
              }),
            )),
      ],
    );
  }

  Widget _buildContentText2(text) {
    String myString = text;
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Text(
        myString,
        style: TextStyle(fontSize: 13.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildContentText1(text) {
    String myString = text;
    return Padding(
      padding: EdgeInsets.only(bottom: 1.0),
      child: Text(
        myString,
        style: TextStyle(fontSize: 18.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  // modify this widget with the example code below
  Widget _buildTitleCategory(text) {
    String myString = text;
    return Padding(
      padding: EdgeInsets.only(bottom: 5.0),
      child: Text(
        myString,
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTitleSubCategory(text) {
    String myString = text;
    return Text(
      myString,
      style: TextStyle(
          fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
    );
  }

  Widget _buildCategory() {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return new Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 10.0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _buildTitleCategory('Tukang Sayur Online'),
            _buildTitleSubCategory('100% Seger'),
            new SizedBox(
                width: double.infinity,
                height: isPortrait?110.0:140.0,
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _categoryItem.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, position) {
                      return _buildRowCategory(_categoryItem[position]);
                    }
                  )
            )              
          ],
      )
    );
  }

  Widget _buildRowCategory(Category category) {
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.pushNamed(context, '/product');
            },
            child: new Container(
              decoration: new BoxDecoration(
                  //border: Border.all(color: Colors.grey[200], width: 1.0),
                  //borderRadius:new BorderRadius.all(new Radius.circular(20.0))
                  ),
              padding: EdgeInsets.all(12.0),
              child: FadeInImage.assetNetwork(
                  placeholder: 'assets/img/placeholder.png',
                  image: category.image,
                  width: 40.0),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 6.0),
          ),
          new Text(category.name, style: new TextStyle(fontSize: 10.0))
        ],
      ),
    );
  }

  Widget _buildHomeAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tanggal Kirim & Cabang",
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Text(
                    'Cabang Cikupa' + ' - ' + "Kami 2019",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: AppPalette.green,
                        fontWeight: FontWeight.normal),
                  ),
                  Icon(Icons.arrow_drop_down, color: AppPalette.green)
                ],
              ),
              onTap: () {
                brachBottomSheet(context);
              },
            ),
          ]),
    );
  }
}
