import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/all_images.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/strings.dart';
import 'package:news_task_app/features/contactUs/data/datasource/dummy_steps.dart';
import 'package:news_task_app/features/contactUs/presentation/cubit/contact_us_cubit.dart';
import 'package:news_task_app/features/contactUs/presentation/cubit/contact_us_state.dart';
import 'package:news_task_app/features/contactUs/presentation/widgets/contact_us_app_bar.dart';
import 'package:news_task_app/features/contactUs/presentation/widgets/contact_us_steps.dart';
import 'package:news_task_app/features/contactUs/presentation/widgets/data_step.dart';
import 'package:news_task_app/injection_container.dart';
import 'package:news_task_app/shared/widgets/app_bar.dart';
import 'package:news_task_app/shared/widgets/custom_input.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  int activeIndex = 0;

  @override
  void initState() {

    sl<ContactUsCubit>().init();
    // TODO: implement initState
    super.initState();
  }
  // final ContactUsCubit contactUsCubit = ContactUsCubit();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: BaseAppBar(
        elevation: 3,
        bgColor: AppColors.white,
        bottom: const ContactUsSteps(),
        child:const ContactUsAppBar(),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ContactUsCubit,ContactUsState>(
          builder: (context, state) {

            int activeIndex=sl<ContactUsCubit>().activeStepIndex;

            return Column(
              children: [
                LinearProgressIndicator(
                  value: contactUsSteps[activeIndex].stepCount /contactUsSteps.length ,
                  minHeight: 5.getHeight(),
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_LARGE.getWidth(),vertical: 50.getHeight() ),
                  child: contactUsSteps[activeIndex].stepContent,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
