import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';

class CustomInput extends StatefulWidget {
  const CustomInput(

      {Key? key,
      required this.hint,
      required this.label,
      this.maxLines = 1,
      this.enabled = true,
      required this.textEditingController,
      required this.keyboardType,
      this.validator,
      this.textInputAction = TextInputAction.done,
      this.suffixIcon})
      : super(key: key);

  final String hint;
  final int maxLines;
  final bool enabled;
  final TextInputType keyboardType;
  final String label;
  final Widget? suffixIcon;
  final TextEditingController textEditingController;
  final FormFieldValidator? validator;
  final TextInputAction textInputAction;
  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  void initState() {
    super.initState();
  }

  InputBorder mainInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: AppColors.border));
  InputBorder errorBorder = UnderlineInputBorder(
      borderSide: BorderSide(width: 4, color: AppColors.black));
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 0
          ),
          child: Text(widget.label,
              style: tajawalBold.copyWith(
                  fontSize: 17.getFontSize(), color: AppColors.primaryColor)),
        ),
        TextFormField(
          controller: widget.textEditingController,
          textAlignVertical: TextAlignVertical.center,
          enabled: widget.enabled,
          maxLines: widget.maxLines,
          textInputAction: widget.textInputAction,
          style: tajawalMedium.copyWith(
            fontSize: 18.getFontSize(),
            color: AppColors.primaryColor,
          ),

          keyboardType: widget.keyboardType,
          validator: widget.validator,
          decoration: InputDecoration(

            isDense: true,
              border: mainInputBorder,
              disabledBorder: mainInputBorder,
              enabledBorder: mainInputBorder,
              focusedBorder: mainInputBorder,
              suffixIcon: widget.suffixIcon,
              // labelStyle: tajawalMedium.copyWith(
              //     fontSize: 22.getFontSize(), color: AppColors.red),
              floatingLabelAlignment: FloatingLabelAlignment.start,
              hintText: widget.hint,
              alignLabelWithHint: false,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: tajawalMedium.copyWith(
                  fontSize: 16.getFontSize(), color: AppColors.hintGrey),
              floatingLabelStyle: tajawalBold.copyWith(
                  fontSize: 22.getFontSize(), color: AppColors.primaryColor)),
        ),
      ],
    );
  }
}
