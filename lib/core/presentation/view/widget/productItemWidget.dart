import 'package:flutter/material.dart';
import 'package:frontendtestkriya2020/core/model/productModel.dart';
import 'package:frontendtestkriya2020/core/presentation/presenter/presenter.dart';

class ProductItemWidget extends StatelessWidget {

  ProductModel product;
  ProductPresenter presenter;

  ProductItemWidget({this.product, this.presenter});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Text(product.title)),
            IconButton(
                onPressed: (){
                  presenter.minQtyByIndex(product);
                },
                icon: Icon(Icons.remove)
            ),
            Text(product.qty.toString()),
            IconButton(
                onPressed: () {
                  presenter.addQtyByIndex(product);
                },
                icon: Icon(Icons.add)
            ),
          ],
        ),
      ),
    );
  }
}
