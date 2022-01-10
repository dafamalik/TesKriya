import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontendtestkriya2020/model/productModel.dart';
import 'package:http/http.dart' as http;

class ProductListView extends StatefulWidget {

  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class ModelProduct {
  final String title, id, userId;

  ModelProduct (this.title, this.id, this.userId);
}

class _ProductListViewState extends State<ProductListView> {

  var jumlah = 1;

  // List<ProductModel> productList = [];

  Future getApi() async{
    var response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'todos'));
    var jsonData = jsonDecode(response.body);
    List<ModelProduct> productList = [];

    for(var T in jsonData){
      ModelProduct Produk = ModelProduct(T['title'], T['id'].toString(), T['userId'].toString());
      productList.add(Produk);
    }
    print(productList.length);
    return productList;
  }

  Widget product() {
    return Container(
      height: 540,
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16),
              child: Text("Product List",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
              )),
          Expanded(
            child: FutureBuilder(
              future: getApi(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text("Loading..."),
                    ),
                  );
                } else return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Text(snapshot.data[index].title)),
                              IconButton(onPressed: () {
                                setState(() {
                                  jumlah = jumlah - 1;
                                });
                              }, icon: Icon(Icons.remove)),
                              Text(jumlah.toString()),
                              IconButton(onPressed: () {
                                setState(() {
                                  jumlah = jumlah + 1;
                                });
                              }, icon: Icon(Icons.add)),
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget checkOutButton() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Material(
        color: Colors.transparent,
        shadowColor: Colors.lightBlueAccent,
        elevation: 8,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(5)),
          child: FlatButton(
            height: 57,
            minWidth: MediaQuery.of(context).size.width,
            onPressed: ()=> {},
            child: Text(
              "checkOut",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontFamily: 'PoppinsBold',
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dafamalik"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      product()
                    ],
                  ),
                )),
            checkOutButton()
          ],
        ),
      ),
    );
  }
}
