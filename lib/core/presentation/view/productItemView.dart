
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:frontendtestkriya2020/core/presentation/presenter/presenter.dart';
import 'package:frontendtestkriya2020/core/presentation/view/widget/productItemWidget.dart';
import 'package:get/get.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key key}) : super(key: key);

  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {

  ProductPresenter presenter = Get.put(ProductPresenter());

  @override
  void initState() {
    super.initState();

    presenter.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Product List"),
          actions: [
            Badge(
              position: BadgePosition.topEnd(top: 10, end: 10),
              badgeContent: Obx(() => Text(presenter.totalQty.toString(), style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ))),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  presenter.gotoCheckout();
                },
              ),
            )
          ],
        ),
        body: GetBuilder<ProductPresenter>(
          builder: (controller){

            return Container(
                child: ListView.builder(
                    itemCount: controller.productModel.length,
                    itemBuilder: (ctx, idx){
                      return ProductItemWidget(
                        product: controller.productModel[idx],
                        presenter: controller,
                      );
                    }
                )
            );
          },
        )
    );
  }
}