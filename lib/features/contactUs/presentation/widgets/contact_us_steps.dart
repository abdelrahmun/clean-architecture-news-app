import 'package:flutter/cupertino.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_task_app/core/utils/strings.dart';
import 'package:news_task_app/features/contactUs/data/datasource/dummy_steps.dart';
import 'package:news_task_app/features/contactUs/presentation/cubit/contact_us_cubit.dart';
import 'package:news_task_app/features/contactUs/presentation/cubit/contact_us_state.dart';
import 'package:news_task_app/injection_container.dart';
import 'package:easy_localization/easy_localization.dart';

class ContactUsSteps extends StatelessWidget {
  const ContactUsSteps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsCubit, ContactUsState>(
      builder: (context, state) {

        final int index = sl<ContactUsCubit>().activeStepIndex;
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.RADIUS_DEFAULT.getWidth()),
          child: Container(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  contactUsSteps[index].stepName.tr(),
                  style: tajawalBold.copyWith(fontSize: 25.getFontSize()),
                ),
                const Spacer(),
                Text(
                  "${next.tr()} : ",
                  style: tajawalBold.copyWith(fontSize: 22.getFontSize()),
                ),
                SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_LARGE.getWidth(),),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${contactUsSteps[index].stepCount}/${contactUsSteps.length}',
                      style: tajawalBold.copyWith(
                        fontSize: 18.getFontSize(),
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                        contactUsSteps.length> index + 1
                            ? contactUsSteps[index + 1].stepName.tr()
                            : sent.tr(),
                        style: tajawalBold.copyWith(
                          fontSize: 20.getFontSize(),
                          color: AppColors.grey,
                        )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
