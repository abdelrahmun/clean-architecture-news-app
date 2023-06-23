import 'package:flutter/material.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/extensions/form_validator.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/strings.dart';
import 'package:news_task_app/features/contactUs/data/model/user_data.dart';
import 'package:news_task_app/features/contactUs/presentation/cubit/contact_us_cubit.dart';
import 'package:news_task_app/features/contactUs/presentation/widgets/action_button.dart';
import 'package:news_task_app/injection_container.dart';
import 'package:news_task_app/shared/widgets/custom_input.dart';
import 'package:easy_localization/easy_localization.dart';

class DataStep extends StatelessWidget {
  DataStep({Key? key}) : super(key: key);


  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ContactUsCubit contactUsCubit = sl<ContactUsCubit>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [

          CustomInput(
            validator: (value) {
              if (value.toString().isNotEmpty) {
                bool validName = value.toString().onlyTextValidator();
                if (validName) {
                  if (value.length > 3) {
                    return null;
                  } else {
                    return 'Last Name must ne more than 3 characters';
                  }
                } else {
                  return 'Enter Valid Name';
                }
              } else {
                return 'First Name Is Required';
              }
            },
            textEditingController: firstNameController,
            keyboardType: TextInputType.text,
            label: firstName.tr(),
            hint: enterFormField.tr(args: [firstName.tr()]),
          ),
          SizedBox(
            height: 40.getHeight(),
          ),
          CustomInput(
            validator: (value) {
              if (value.toString().isNotEmpty) {
                bool validName = value.toString().onlyTextValidator();
                if (validName) {
                  if (value.length > 3) {
                    return null;
                  } else {
                    return 'Last Name must ne more than 3 characters';
                  }
                } else {
                  return 'Enter Valid Name';
                }
              } else {
                return 'Last Name is Required';
              }
            },
            textEditingController: lastNameController,
            keyboardType: TextInputType.text,
            label: lastName.tr(),
            hint: enterFormField.tr(args: [lastName.tr()]),
          ),
          SizedBox(
            height: 40.getHeight(),
          ),
          CustomInput(
            textEditingController: emailController,
            validator: (value) {
              if (value.toString().isNotEmpty) {
                final bool emailValid = value.toString().emailValidator();
                return emailValid ? null : 'Enter valid Email Address';
              } else {
                
                return 'Email Address is required';
              }
            },
            label: emailAddress.tr(),
            hint: 'example@example.com',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 40.getHeight(),
          ),
          CustomInput(
            textEditingController: mobileController,
            validator: (value) {
              if (value.toString().isNotEmpty) {
                if (value.toString().startsWith('05')) {
                  if (value.toString().length != 10) {
                    return 'Mobile Number must be of 10 digit';
                  }
                  return null;
                } else {
                  return 'Mobile Number must start with 05';
                }
              } else {
                return 'Phone number is required';
              }
            },
            label: phoneNumber.tr(),
            hint: '05XXXXXXXX',
            keyboardType: TextInputType.phone,
          ),
          SizedBox(
            height: 70.getHeight(),
          ),
          ActionButton(
            onTap: () {

              if (formKey.currentState!.validate()) {
                sl<UserData>().updateFirstName(firstNameController.text);
                sl<UserData>().updateLastName(lastNameController.text);
                sl<UserData>().updateMobile(mobileController.text);
                sl<UserData>().updateEmail(emailController.text);
                contactUsCubit.changeContactUsStep(1);
              }
            },
            title: next,
          )
        ],
      ),
    );
  }
}
