import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:news_task_app/core/utils/strings.dart';
import 'package:news_task_app/features/contactUs/data/datasource/dummy_list.dart';
import 'package:news_task_app/features/contactUs/presentation/cubit/contact_us_cubit.dart';
import 'package:news_task_app/features/contactUs/presentation/cubit/contact_us_state.dart';
import 'package:news_task_app/features/contactUs/presentation/widgets/action_button.dart';
import 'package:news_task_app/injection_container.dart';
import 'package:news_task_app/shared/widgets/custom_radio.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageTypeBottomSheet extends StatelessWidget {
  const MessageTypeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth()),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Dimensions.PADDING_SIZE_EXTRA_LARGE.getHeight(),
                bottom: Dimensions.PADDING_SIZE_DEFAULT.getHeight(),
              ),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          close.tr(),
                          style:
                              tajawalBold.copyWith(fontSize: 24.getFontSize()),
                        ),
                      )),
                  Center(
                      child: Text(
                    chooseFromField.tr(args: [messageType.tr()]),
                    style: tajawalBold.copyWith(fontSize: 24.getFontSize()),
                  )),
                ],
              ),
            ),
            Divider(
              height: 5,
              thickness: 1,
              color: AppColors.border,
            ),
            SizedBox(
              height: Dimensions.PADDING_SIZE_DEFAULT.getHeight(),
            ),
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.searchIcon,
                        blurRadius: 10,
                        offset: const Offset(0, 0),
                        spreadRadius: 4)
                  ]),
              child: TextFormField(
                onChanged: onTypeInSearch,
                // controller: searchController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth()),
                  isDense: false,
                  suffixIcon: Icon(
                    Icons.search_outlined,
                    size: 30.getFontSize(),
                    color: AppColors.searchIcon,
                  ),
                  hintText: '${search.tr()}...',
                  focusedBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.PADDING_SIZE_EXTRA_LARGE.getHeight(),
            ),
            BlocBuilder<ContactUsCubit, ContactUsState>(
              builder: (context, state) {
                return CustomSearchableRadio(
                    values: sl<ContactUsCubit>().messageTypesSearch ??
                        messageTypeDummy);
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 40.getHeight(),
                bottom: 55.getHeight(),
              ),
              child: ActionButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: choose.tr()),
            )
          ],
        ),
      ),
    );
  }

  ValueChanged<String>? onTypeInSearch(String value){
    sl<ContactUsCubit>()
        .getMessageTypes(searchKey: value.toString());
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
