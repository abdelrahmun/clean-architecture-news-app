import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:news_task_app/features/contactUs/presentation/cubit/contact_us_cubit.dart';
import 'package:news_task_app/features/contactUs/presentation/cubit/contact_us_state.dart';
import 'package:news_task_app/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchableRadio extends StatefulWidget {
  final List<String> values;

  const CustomSearchableRadio({super.key, required this.values});

  @override
  State<CustomSearchableRadio> createState() => _CustomSearchableRadioState();
}

class _CustomSearchableRadioState extends State<CustomSearchableRadio> {
  late int activeIndex;

  @override
  void initState() {
    activeIndex = sl<ContactUsCubit>().selectedMessageTypeIndex;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected(index) => activeIndex == widget.values.indexOf(widget.values[index]);
    return Column(
      children: List.generate(
          widget.values.length,
          (index) => GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = widget.values.indexOf(widget.values[index]);
                  sl<ContactUsCubit>().selectMessageTypeIndex(index);
                });
              },
              child: CustomRadioDesign(
                value: widget.values[index],
                isSelected: isSelected(index),
              ))),
    );
  }
}

class CustomRadioDesign extends StatelessWidget {
  final String value;
  final bool isSelected;
  const CustomRadioDesign({super.key, required this.value, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? AppColors.lightPrimaryColor : AppColors.white,
          border: Border.all(
              color: isSelected ? AppColors.primaryColor : AppColors.border,
              width: 1.5)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 25.getHeight(),
            horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              value,
              style: tajawalMedium.copyWith(
                fontSize: 23.getFontSize(),
                color: AppColors.primaryColor,
              ),
            ),
            Container(
              width: 20.getWidth(),
              height: 20.getWidth(),
              decoration: ShapeDecoration(
                  gradient: isSelected != true
                      ? LinearGradient(
                          colors: [AppColors.border, AppColors.white],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.0, 1],
                          tileMode: TileMode.clamp,
                        )
                      : null,
                  color: isSelected ? AppColors.primaryColor : null,
                  shape: CircleBorder(
                      side: BorderSide(
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.border))),
            )
          ],
        ),
      ),
    );
  }
}
