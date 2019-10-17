import 'package:flutter/material.dart';
import 'package:onerci/models/product_model.dart';
import 'package:onerci/screens/my_style.dart';

class Detail extends StatefulWidget {
  final ProductModel productModel;
  Detail({Key key, this.productModel}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  // Explicit
  ProductModel myProductModel;

  // Method
  @override
  void initState() {
    super.initState();
    myProductModel = widget.productModel;
  }

  Widget showPicture() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.all(30.0),
      child: Image.network(myProductModel.pathImage),
    );
  }

  Widget showName() {
    return Container(padding: EdgeInsets.only(left: 30.0,right: 30.0),
      child: Text(
        myProductModel.name,
        style: TextStyle(
          fontSize: MyStyle().h1,
          color: MyStyle().textColor,
        ),
      ),
    );
  }

    Widget showDetail() {
    return Container(padding: EdgeInsets.only(left: 30.0,right: 30.0),
      child: Text(
        myProductModel.detail,
        style: TextStyle(
          fontSize: MyStyle().h2,
          color: MyStyle().textColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: ListView(
        children: <Widget>[
          showPicture(),
          showName(),
          showDetail(),
        ],
      ),
    );
  }
}
