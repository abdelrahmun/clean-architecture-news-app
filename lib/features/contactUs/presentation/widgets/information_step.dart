import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_task_app/configs/routes/app_routes.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:news_task_app/core/utils/strings.dart';
import 'package:news_task_app/features/contactUs/data/datasource/dummy_list.dart';
import 'package:news_task_app/features/contactUs/data/model/user_data.dart';
import 'package:news_task_app/features/contactUs/presentation/cubit/contact_us_cubit.dart';
import 'package:news_task_app/features/contactUs/presentation/cubit/contact_us_state.dart';
import 'package:news_task_app/features/contactUs/presentation/widgets/action_button.dart';
import 'package:news_task_app/features/contactUs/presentation/widgets/message_type_bottom_sheet.dart';
import 'package:news_task_app/injection_container.dart';
import 'package:news_task_app/shared/widgets/custom_input.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:news_task_app/shared/widgets/custom_radio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pick_file_builder.dart';

class InformationStep extends StatefulWidget {
  const InformationStep({super.key});

  @override
  State<InformationStep> createState() => _InformationStepState();
}

class _InformationStepState extends State<InformationStep> {
  TextEditingController messageTitleController = TextEditingController();

  TextEditingController messageTypeController = TextEditingController();
  TextEditingController messageContentController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomInput(
            textEditingController: messageTitleController,
            validator: (value) {
              if (value.toString().isNotEmpty) {
                if (value.toString().length < 3) {
                  return "Message title must be ,ore than 3 characters";
                } else {
                  return null;
                }
              } else {
                return 'Message Title is required';
              }
            },
            label: messageTitle.tr(),
            hint: enterFormField.tr(args: [messageTitle.tr()]),
            keyboardType: TextInputType.text,
          ),
          SizedBox(
            height: 50.getHeight(),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                enableDrag: true,
                builder: (_) => BlocProvider<ContactUsCubit>.value(
                  value: sl<ContactUsCubit>(),
                  child: const MessageTypeBottomSheet(),
                ),
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                ),
              ).then((value) {
                final int selectedMessageTypeIndex =
                    sl<ContactUsCubit>().selectedMessageTypeIndex;
                setState(() {
                  messageTypeController.text =
                      messageTypeDummy[selectedMessageTypeIndex];
                });
              });
            },
            child: IgnorePointer(
              ignoring: true,
              ignoringSemantics: true,
              child: CustomInput(
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 30.getFontSize(),
                ),
                enabled: true,
                textEditingController: messageTypeController,
                validator: (value) {
                  if (value.toString().isNotEmpty) {
                    return null;
                  } else {
                    return 'Please select message type';
                  }
                },
                label: messageType.tr(),
                hint: chooseFromField.tr(args: [messageType.tr()]),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          SizedBox(
            height: 50.getHeight(),
          ),
          CustomInput(
            maxLines: 6,
            textEditingController: messageContentController,
            validator: (value) {
              if (value.toString().isNotEmpty) {
              } else {
                return 'Please enter message content';
              }
            },
            textInputAction: TextInputAction.newline,
            label: messageContent.tr(),
            hint: write.tr(),
            keyboardType: TextInputType.multiline,
          ),
          SizedBox(
            height: 20.getHeight(),
          ),
          const PickFileBuilder(),
          SizedBox(
            height: 40.getHeight(),
          ),
          BlocConsumer<ContactUsCubit, ContactUsState>(

            listener: (context, state) {

              if (state is PostContactUsSuccessfullyState) {
                Navigator.pushReplacementNamed(
                    context, Routes.contactUsSuccessScreen);
              } else if (state is PostContactUsFailState) {
                var snackBar = SnackBar(content: Text(state.errorMessage));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            builder: (context, state) => ActionButton(
              isLoading:state is PostContactUsLoadingState,
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    sl<UserData>()
                        .updateMessageTitle(messageTitleController.text);
                    sl<UserData>()
                        .updateMessageType(messageTypeController.text);
                    sl<UserData>()
                        .updateMessageDesc(messageContentController.text);

                    await sl<ContactUsCubit>().postContactUsData();
                  }
                },
                title: sent),
          )
        ],
      ),
    );
  }
}
