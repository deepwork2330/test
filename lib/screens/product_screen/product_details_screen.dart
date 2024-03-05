import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});

  final RxInt qty = 1.obs;
  final RxBool minus = false.obs;
  final RxBool plus = false.obs;
  final RxBool isLike = false.obs;
  final RxDouble total = 99.99.obs;
  final RxInt currentIndex = 0.obs;
  final List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhADYRCpmjf4qSvYJer4mBxRFtuqwMdbZi0w",
    "https://static3.depositphotos.com/1008895/251/i/450/depositphotos_2518597-stock-photo-pile-of-clothes-isolated-on.jpg",
    "https://st5.depositphotos.com/22341038/66545/i/450/depositphotos_665453102-stock-photo-wardrobe-rack-different-clothes-concept.jpg",
  ];

  @override
  Widget build(BuildContext context) {
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
              return GestureDetector(onTap: () {
                isLike.value = !isLike.value;
              },
                  child: isLike.value ? const Icon(
                      Icons.favorite, color: Colors.redAccent) : const Icon(
                      Icons.favorite_border, color: Colors.redAccent));
            }),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        children: [
          CarouselSlider(
            items: images.map((image) {
              return Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: double.infinity,
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(image,
                      fit: BoxFit.cover,
                    ),
                  ));
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              height: 250.0,
              onPageChanged: (index, reason) {
                currentIndex.value = index;
              },
            ),
          ),
          SizedBox(
            height: 30,
            child: Center(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    return Container(
                      height: currentIndex.value == index
                          ? 9 : 7,
                      width: currentIndex.value == index
                          ? 9 : 7,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: currentIndex.value == index
                              ? Colors.orangeAccent
                              : Colors.grey,
                          shape: BoxShape.circle
                      ),
                    );
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(children: [
            Text("$total",
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.orangeAccent
              ),
            ),
            const Text("\$199.99",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough
              ),
            ),
            const Spacer(),
            const Icon(Icons.share, color: Colors.grey),
          ]),
          const SizedBox(height: 10),
          const Text("Male in casual grey T- shirt",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                const Text("Qty:",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 20),
                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      if (qty.value > 1) {
                        qty.value--;
                        if (!minus.value) {
                          minus.value = true;
                          plus.value = false;
                        }
                      }
                    },
                    child: Opacity(
                      opacity: qty.value > 1 ? 1 : 0.2,
                      child: Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: qty.value == 1 ? Colors.white : minus.value
                              ? Colors.orangeAccent
                              : Colors
                              .white,
                          border: Border.all(
                              color: qty.value == 1 ? Colors.black : minus.value
                                  ? Colors.white
                                  : Colors.black, width: 1),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(5)),
                        ),
                        child: Text("-",
                          style: TextStyle(
                              color: qty.value == 1 ? Colors.black : minus.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(width: 15),
                Obx(() {
                  return Text("${qty.value}",
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
                      if (!plus.value) {
                        plus.value = true;
                        minus.value = false;
                      }
                      qty.value++;
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: plus.value ? Colors.orangeAccent : Colors.white,
                        border: Border.all(color: plus.value
                            ? Colors.white
                            : Colors.black, width: 1),
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Text("+",
                        style: TextStyle(
                            color: plus.value ? Colors.white : Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text("Description",
            style: TextStyle(
              fontSize: 15,
              shadows: [
                Shadow(
                    color: Colors.black,
                    offset: Offset(0, -5))
              ],
              color: Colors.transparent,
              decoration:
              TextDecoration.underline,
              decorationColor: Colors.orangeAccent,
              decorationThickness: 3,
            ),
          ),
          const SizedBox(height: 5),
          const Text("Description APP data Flutter demo short product show app",
            style: TextStyle(
              fontSize: 15,
            ), textAlign: TextAlign.justify,

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
              margin: const EdgeInsets.only(bottom: 14,),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFffe8ce)
              ),
              child: const Text(
                "Add Cart",
                style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 50,
              margin: const EdgeInsets.only(bottom: 14,),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.orangeAccent
              ),
              child: Obx(() {
                return Text(
                  "Buy Now\n\$${(total.value * qty.value).toStringAsFixed(2)}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                );
              }),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
