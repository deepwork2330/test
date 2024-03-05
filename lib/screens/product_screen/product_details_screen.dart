import 'package:carousel_slider/carousel_slider.dart';
import 'package:demoapp/screens/product_screen/product_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen(
      {super.key, this.des, this.title, this.images, this.price});

  String? title;
  String? des;
  num? price;
  List? images;

  @override
  Widget build(BuildContext context) {
    var pController = Get.put(ProductScreenController());

    return Scaffold(
      backgroundColor: const Color(0xFFfafafa),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        title: const Text("Product Details", style: TextStyle(fontSize: 18)),
        leading: const Icon(Icons.arrow_back_rounded, color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Obx(() {
              return GestureDetector(
                  onTap: () {
                    pController.isLike.value = !pController.isLike.value;
                  },
                  child: pController.isLike.value
                      ? const Icon(Icons.favorite, color: Colors.redAccent)
                      : const Icon(Icons.favorite_border,
                          color: Colors.redAccent));
            }),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        children: [
          CarouselSlider(
            items: images?.map((image) {
              return Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: double.infinity,
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ));
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              height: 250.0,
              onPageChanged: (index, reason) {
                pController.currentIndex.value = index;
              },
            ),
          ),
          SizedBox(
            height: 30,
            child: Center(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: images?.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    return Container(
                      height: pController.currentIndex.value == index ? 9 : 7,
                      width: pController.currentIndex.value == index ? 9 : 7,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: pController.currentIndex.value == index
                              ? Colors.orangeAccent
                              : Colors.grey,
                          shape: BoxShape.circle),
                    );
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(children: [
            Text(
              "$price",
              style: const TextStyle(fontSize: 20, color: Colors.orangeAccent),
            ),
            // Text(
            //   "\$$price",
            //   style: const TextStyle(
            //       fontSize: 15,
            //       color: Colors.grey,
            //       decoration: TextDecoration.lineThrough),
            // ),
            const Spacer(),
            const Icon(Icons.share, color: Colors.grey),
          ]),
          const SizedBox(height: 10),
          Text(
            "$title",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                const Text(
                  "Qty:",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 20),
                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      if (pController.qty.value > 1) {
                        pController.qty.value--;
                        if (!pController.minus.value) {
                          pController.minus.value = true;
                          pController.plus.value = false;
                        }
                      }
                    },
                    child: Opacity(
                      opacity: pController.qty.value > 1 ? 1 : 0.2,
                      child: Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: pController.qty.value == 1
                              ? Colors.white
                              : pController.minus.value
                                  ? Colors.orangeAccent
                                  : Colors.white,
                          border: Border.all(
                              color: pController.qty.value == 1
                                  ? Colors.black
                                  : pController.minus.value
                                      ? Colors.white
                                      : Colors.black,
                              width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Text(
                          "-",
                          style: TextStyle(
                              color: pController.qty.value == 1
                                  ? Colors.black
                                  : pController.minus.value
                                      ? Colors.white
                                      : Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(width: 15),
                Obx(() {
                  return Text(
                    "${pController.qty.value}",
                    style: const TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 20,
                    ),
                  );
                }),
                const SizedBox(width: 15),
                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      if (!pController.plus.value) {
                        pController.plus.value = true;
                        pController.minus.value = false;
                      }
                      pController.qty.value++;
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: pController.plus.value
                            ? Colors.orangeAccent
                            : Colors.white,
                        border: Border.all(
                            color: pController.plus.value
                                ? Colors.white
                                : Colors.black,
                            width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Text(
                        "+",
                        style: TextStyle(
                            color: pController.plus.value
                                ? Colors.white
                                : Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Description",
            style: TextStyle(
              fontSize: 15,
              shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
              color: Colors.transparent,
              decoration: TextDecoration.underline,
              decorationColor: Colors.orangeAccent,
              decorationThickness: 3,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "$des",
            style: const TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.justify,
          )
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 50,
              margin: const EdgeInsets.only(
                bottom: 14,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFffe8ce)),
              child: const Text(
                "Add Cart",
                style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 50,
              margin: const EdgeInsets.only(
                bottom: 14,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.orangeAccent),
              child: const Text(
                "Buy Now",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
