import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../constant/color_constant.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback fun;
  final double? textSize;
  final bool? isLoading;
  final Color? color;
  final double? width;
  final double? height;
  final double? borderCircular;

  const CustomButton(
      {super.key,
      required this.text,
      required this.fun,
      this.color,
      this.height,
      this.width,
      this.borderCircular,
      this.textSize,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width,
      height: height ?? 42,
      child: ElevatedButton(
        onPressed: isLoading!
            ? () {
                print("loading");
              }
            : fun,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderCircular ?? 2),
          ),
          enableFeedback: true,
          padding: EdgeInsets.zero,
          backgroundColor: color ?? ColorConstant.blue,
        ),
        child: isLoading == true
            ? const Padding(
                padding: EdgeInsets.all(6.0),
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 4,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: textSize ?? 19,
                  color: ColorConstant.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
