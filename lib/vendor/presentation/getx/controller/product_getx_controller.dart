import 'package:camel_express_user/core/helpers/app_colors.dart';
import 'package:camel_express_user/order/domain/usecase/order/cart_usecase.dart';
import 'package:camel_express_user/vendor/domain/usecase/product_details_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/entity/product/attribute.dart';
import '../../../data/entity/product/product_details.dart';

class ProductGetXController extends GetxController{
  final ProductDetailsUseCase _productDetailsUseCase;

  static ProductGetXController to = Get.find<ProductGetXController>();

  ProductGetXController(this._productDetailsUseCase);

  Product? product;

  String defaultVariation = "";

  int defaultPrice = 0;

  Map<String, dynamic> map = {};

  bool isLoading = true;

  void getProductDetails({required String productId}) async {
    var result = await _productDetailsUseCase.execute(
      productId: productId,
    );
    isLoading = false;
    result.fold(
      (error){
        update(["main"]);
      },
      (product) {
        this.product = product;
        defaultVariation = product.variationId.toString();
        defaultPrice = product.price;
        map = product.attributesList.length != 1
            ? _convertToMap(product.attributesList)
            : _singleItem(product.attributesList);
        print("map=> $map");
        update(["main"]);
      },
    );
  }

  Map<String, dynamic> _singleItem(List<Attribute> list) {
    return {
      "type_id1": list.first.attributeId,
      "value1": "",
      "type_id2": "",
      "value2": "",
    };
  }

  Map<String, dynamic> _convertToMap(List<Attribute> list) {
    final Map<String, dynamic> map = {};
    for (int i = 1; i <= list.length; i++) {
      map["type_id$i"] = list[i - 1].attributeId.toString();
      map["value$i"] = "";
    }
    return map;
  }

  Future<void> addOrRemoveFromCart() async {
    var res = await Get.find<CartDataUseCase>().addOrRemove(
        data: getData(
      flag: "1",
      productId: product!.id.toString(),
      variationId: product!.variationId.toString(),
      quantity: product!.quantity.toString(),
    ));
    res.fold(
      (error) => Get.snackbar(
        "Error",
        error.message,
        backgroundColor: AppColors.red,
      ),
      (success) => Get.back(),
    );
  }

  void changeQuantity({required String flag}) async {
    switch (flag) {
      case "+":
        product!.quantity++;
        break;
      case "-":
        if (product!.quantity > 1) {
          product!.quantity--;
        }
        break;
    }
    update(["quantity"]);
  }

  Map<String, dynamic> getData({
    required String flag,
    required String productId,
    required String variationId,
    required String quantity,
  }) {
    return {
      "flag": flag,
      "product_id": productId,
      "variation_id": variationId,
      "quantity": quantity,
    };
  }

  void getPrice({
    required Attribute attribute,
    required int id,
    required int index,
  }) async {
    if (id == 0) {
      map["value${index + 1}"] = attribute.attributeValues[id];
      product!.variationId = int.parse(defaultVariation);
      product!.price = defaultPrice;
    } else {
      map["value${index + 1}"] = attribute.attributeValues[id];
      var result = await _productDetailsUseCase.getPrice(
        data: map,
        productId: product!.id.toString(),
      );
      result.fold(
        (error) => Get.snackbar("Error", error.message, backgroundColor: AppColors.red),
        (data) async {
          if (data.isNotEmpty) {
            product!.variationId = data["variation_id"];
            product!.price = data["price"];
          }
        },
      );
    }
    update(["price"]);
  }
}
