import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/all_images.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/features/contactUs/data/datasource/dummy_steps.dart';
import 'package:news_task_app/features/contactUs/presentation/widgets/contact_us_steps.dart';

class ContactUsAppBar extends StatelessWidget {
  const ContactUsAppBar({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth(),
          vertical: Dimensions.PADDING_SIZE_DEFAULT.getHeight()),
      child: Stack(
        children: [
          Align(
              alignment: AlignmentDirectional.centerStart,
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  size: 25.getWidth(),
                ),
              )),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AllImages.logo,
              fit: BoxFit.cover,
              width: 80.getWidth(),
            ),
          ),
          //Step Number
        ],
      ),
    );
  }
}
