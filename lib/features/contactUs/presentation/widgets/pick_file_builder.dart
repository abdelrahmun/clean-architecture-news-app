import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:news_task_app/core/utils/strings.dart';
import 'package:news_task_app/features/contactUs/presentation/cubit/contact_us_cubit.dart';
import 'package:news_task_app/features/contactUs/presentation/cubit/contact_us_state.dart';
import 'package:news_task_app/injection_container.dart';
import 'package:easy_localization/easy_localization.dart';

class PickFileBuilder extends StatelessWidget {
  const PickFileBuilder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ContactUsCubit contactUsCubit = sl<ContactUsCubit>();

    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 0, vertical: Dimensions.RADIUS_LARGE.getHeight()),
          child: Row(
            children: [
              Text(attachments,
                  style: tajawalBold.copyWith(
                      fontSize: 17.getFontSize(),
                      color: AppColors.primaryColor)),
              Text(" (${optional.tr()})",
                  style: tajawalBold.copyWith(
                      fontSize: 13.getFontSize(), color: AppColors.grey)),
            ],
          ),
        ),
        BlocBuilder<ContactUsCubit, ContactUsState>(
          builder: (context, state) => InkWell(
              onTap: () async {
                contactUsCubit.pickFile();
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                    border:
                        Border.all(color: AppColors.primaryColor, width: 1)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.PADDING_SIZE_DEFAULT.getHeight(),horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Visibility(
                          visible: contactUsCubit.pickedFile != null,
                          child: Icon(Icons.file_copy_outlined,size: 25.getWidth(),color: AppColors.black,)),
                      SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT.getWidth(),),
                      Text(
                        contactUsCubit.pickedFile == null
                        ? pickFileOrImage.tr()
                        : contactUsCubit.pickedFile!.name.toString(),
                        style: tajawalBold.copyWith(
                        fontSize: 23.getFontSize(),
                        color: AppColors.primaryColor),
                      ),
                      Visibility(
                          visible: contactUsCubit.pickedFile != null,

                          child: const Spacer()),
                      Visibility(
                        visible: contactUsCubit.pickedFile != null,
                        child: InkWell(
                            onTap: (){
                              sl<ContactUsCubit>().resetFilePicker();
                            },
                            child: Icon(Icons.close,size: 25.getWidth(),color: AppColors.red,)),
                      ),

                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
