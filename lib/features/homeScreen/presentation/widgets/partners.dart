import 'package:flutter/material.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/all_images.dart';
import 'package:news_task_app/core/utils/dimensions.dart';

class Partners extends StatelessWidget {
  const Partners({Key? key}) : super(key: key);

  static const List<String> partners = [
    AllImages.partner1,
    AllImages.partner2,
    AllImages.partner3
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 120.getHeight(),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.getHeight()),
        child: ListView.builder(
          itemCount: partners.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth()),
              child: Image.asset(
                partners[index],
                width: 120.getWidth(),
                height: 120.getHeight(),
              ),
            );
          },
        ),
      ),
    );
  }
}
