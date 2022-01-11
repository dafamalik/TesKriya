
import 'package:frontendtestkriya2020/core/model/productModel.dart';
import 'package:frontendtestkriya2020/core/service/productService.dart';
import 'package:frontendtestkriya2020/core/presentation/router/productRouter.dart';
import 'package:get/get.dart';

class ProductPresenter extends GetxController {

  final service = ProductService();
  final router = ProductRouter();

  List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

  List<ProductModel> _productWithAvailableQty = [];
  List<ProductModel> get productWithAvailableQty => _productWithAvailableQty;

  RxInt totalQty = 0.obs;

  getProduct() async{

    try {

      var newData = await service.getProduct();

      _productModel.addAll(
          newData.where(
                (datas) => _productModel.every((product) => datas.title != product.title),
          )
      );

      getTotalQty();

    }catch(e) {

      // show alert or anything
      print(e);
    }

    update();
  }

  buyAllAvailableTodos() {

    _productModel.clear();

    getProduct();

    getTodoWithQtyAvailable();

    update();

    Future.delayed(Duration(seconds: 1),(){
      Get.back();
    }
    );
  }

  getTodoWithQtyAvailable() {

    Future.delayed(Duration.zero, () async {

      _productWithAvailableQty = _productModel.where((element) => element.qty != 0).toList();

      update();
    });
  }

  addQtyByIndex(ProductModel productData) {

    var index = _productModel.indexOf(productData);

    _productModel[index].qty += 1;

    getTotalQty();

    update();

  }

  minQtyByIndex(ProductModel todosData) {

    if(todosData.qty != 0) {

      var index = _productModel.indexOf(todosData);

      _productModel[index].qty -= 1;

      getTotalQty();

      update();
    } else {

      return;
    }

  }

  getTotalQty() {

    totalQty.value = _productModel.map<int>((m) => (m.qty)).reduce((a,b )=>a+b);

    update();
  }

  gotoCheckout() {

    router.gotoCheckout();
  }

}