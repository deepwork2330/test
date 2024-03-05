import 'package:demoapp/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    this.validator,
    this.controller,
    this.onSaved,
    this.hintText,
    this.onchanged,
    this.minLine,
    this.txtColor,
    this.icon,
    this.keyboardType,
    this.hintTpadding,
    this.hintBpadding,
    this.hintRpadding,
    this.hintLpadding,
    this.enable,
    this.maxLine,
    this.readOnly,
    this.suffixTap,
    this.isCapital,
  });

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final TextCapitalization? isCapital;
  final bool? readOnly;
  final void Function(String?)? onchanged;
  final bool? enable;
  final String? hintText;
  final double? hintTpadding;
  final double? hintLpadding;
  final double? hintRpadding;
  final double? hintBpadding;
  final Color? txtColor;
  final IconData? icon;
  final GestureTapCallback? suffixTap;
  final TextInputType? keyboardType;

  final int? minLine;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: keyboardType,
          style: TextStyle(height: 1, color: txtColor),
          textCapitalization: isCapital == null
              ? TextCapitalization.none
              : TextCapitalization.words,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          onSaved: onSaved,
          enabled: enable,
          controller: controller,
          readOnly: readOnly ?? false,
          validator: validator,
          minLines: minLine ?? 1,
          maxLines: maxLine ?? 5,
          onChanged: onchanged,
          decoration: InputDecoration(
            fillColor: Colors.white,

            filled: true,
            isDense: true,
            // isCollapsed: true,
            suffixIcon: GestureDetector(onTap: suffixTap, child: Icon(icon)),
            suffixStyle: const TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: ColorConstant.kBorderColor,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: ColorConstant.kBorderColor,
                width: 1.0,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: ColorConstant.kBorderColor,
                width: 1.0,
              ),
            ),
            contentPadding: EdgeInsets.only(
              left: hintLpadding ?? 17.76,
              top: hintTpadding ?? 0,
              right: hintRpadding ?? 0.0,
              bottom: hintBpadding ?? 0.0,
            ),

            hintText: hintText,
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
