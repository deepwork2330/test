// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:demoapp/constant/color_constant.dart';
import 'package:demoapp/routes/app_route.dart';
import 'package:demoapp/widgets/custom_button.dart';
import 'package:demoapp/widgets/textform_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product_screen_controller.dart';

class ProductScreen extends GetView<ProductScreenController> {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductScreenController>(builder: (logic) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:
                const Text("Product Details", style: TextStyle(fontSize: 18)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Obx(
              () => Column(
                children: [
                  CustomTextFormFieldWidget(
                    hintText: "Search hear",
                    onchanged: (value) {},
                    icon: Icons.search,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.filteredProducts.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //height: 100,
                              width: double.infinity,
                              margin: EdgeInsets.all(4),
                              padding: const EdgeInsets.only(
                                  bottom: 10, left: 8, right: 8, top: 8),
                              decoration: BoxDecoration(
                                color: ColorConstant.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 245, 213, 169),
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 210,
                                        // color: Colors.red,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Product Title : ${controller.filteredProducts[index].title}",
                                              style: TextStyle(
                                                color: ColorConstant.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              "Product price :  ${controller.filteredProducts[index].price}",
                                              style: TextStyle(
                                                color: ColorConstant.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              "Product QTY :  ${controller.filteredProducts[index].stock}",
                                              style: TextStyle(
                                                color: ColorConstant.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 7),
                                      Container(
                                        width: 90,
                                        height: 80,
                                        // color: Colors.red,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(children: [
                                    Expanded(
                                      child: CustomButton(
                                        color: Colors.orangeAccent,
                                        height: 30,
                                        text: "View",
                                        textSize: 16,
                                        fun: () {
                                          Get.toNamed(
                                            AppRoutes.productDetailsScreen,
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 7),
                                    const SizedBox(width: 7),
                                    Expanded(
                                      child: CustomButton(
                                        color: Colors.orange,
                                        height: 30,
                                        text: "Delete",
                                        textSize: 16,
                                        fun: () {
                                         
                                         
                                        },
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                            //const SizedBox(height: 20),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
