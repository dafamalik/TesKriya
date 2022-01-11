
import 'package:flutter/material.dart';
import 'package:frontendtestkriya2020/core/presentation/presenter/presenter.dart';
import 'package:frontendtestkriya2020/core/presentation/view/widget/checkOutItemWidget.dart';
import 'package:get/get.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({Key key}) : super(key: key);

  @override
  _CheckOutViewState createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {

  ProductPresenter presenter = Get.put(ProductPresenter());

  @override
  void initState() {
    super.initState();

    presenter.getTodoWithQtyAvailable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("Checkout ${presenter.totalQty} items")),
      ),
      body: GetBuilder<ProductPresenter>(
        builder: (controller){

          var size = MediaQuery.of(context).size;

          return Container(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: controller.productWithAvailableQty.length,
                        itemBuilder: (ctx, idx){
                          return CheckOutItemWidget(
                            presenter: controller,
                            product: controller.productWithAvailableQty[idx],
                          );
                        }
                    ),
                  ),
                  controller.totalQty.toInt() != 0 ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width, 50)
                      ),
                      onPressed: () => {controller.buyAllAvailableTodos()},
                      child: Text("Checkout"))
                      : Container()
                ],
              )
          );
        },
      ),
    );
  }
}