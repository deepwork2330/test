import 'dart:developer';

import 'package:demoapp/apiClient/api_client.dart';
import 'package:demoapp/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreenController extends GetxController {
  final count = 0.obs;
  RxBool isLoading = false.obs;
  var searchText = ''.obs;

  RxList<ProductModel> productModel = <ProductModel>[].obs;
  RxList<ProductModel> filteredProducts = <ProductModel>[].obs;

  @override
  void onReady() {
   
  }

  

  @override
  void onClose() {}

  increment() => count.value++;
}
