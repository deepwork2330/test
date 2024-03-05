import 'dart:developer';

import 'package:demoapp/apiClient/api_client.dart';
import 'package:demoapp/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreenController extends GetxController {
  final count = 0.obs;
  RxBool isLoading = false.obs;
  var searchText = ''.obs;
  final RxInt qty = 1.obs;
  final RxBool minus = false.obs;
  final RxBool plus = false.obs;
  final RxBool isLike = false.obs;
  final RxDouble total = 99.99.obs;
  final RxInt currentIndex = 0.obs;

  RxList<ProductModel> productModel = <ProductModel>[].obs;
  RxList<ProductModel> filteredProducts = <ProductModel>[].obs;

  @override
  void onReady() {
    getProduct();
  }

  void getProduct() async {
    try {
      isLoading(true);
      var response = await ApiClient.get('products?limit=15');
      isLoading(false);

      if (response != null) {
        print("${response['products'][0]}");
        productModel.value = response['products'].map<ProductModel>((json) {
          return ProductModel.fromJson(json);
        }).toList();
        Get.showSnackbar(
          GetBar(
            // title: "Jpay",
            message: "Data Fetch Succesfully",
            isDismissible: true,
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
        filteredProducts.assignAll(productModel);
        // _initializeCatItems();
      }
    } catch (e) {
      Get.showSnackbar(
        GetBar(
          // title: "Jpay",
          message: e.toString(),
          backgroundColor: Colors.red,
          isDismissible: true,
          duration: const Duration(seconds: 2),
        ),
      );
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }

  void setSearchText(String value) {
    searchText.value = value;
    filterCharities();
  }

  void filterCharities() {
    if (searchText.isEmpty) {
      // If both search text and letter are empty, show all charities
      filteredProducts.assignAll(productModel);
    } else {
      // Filter by search text
      filteredProducts.assignAll(productModel.where((charity) =>
          charity.title!.toLowerCase().contains(searchText.toLowerCase())));
    }
  }

  @override
  void onClose() {}

  increment() => count.value++;
}
