import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_task_app/core/funcations/file_picker.dart';
import 'package:news_task_app/core/usecases/usecase.dart';
import 'package:news_task_app/features/contactUs/data/datasource/dummy_list.dart';
import 'package:news_task_app/features/contactUs/data/model/user_data.dart';
import 'package:news_task_app/features/contactUs/domain/repositories/contact_us_repo.dart';
import 'package:news_task_app/features/contactUs/domain/usecases/post_contact_us_data.dart';
import 'package:news_task_app/features/contactUs/presentation/cubit/contact_us_state.dart';
import 'package:news_task_app/injection_container.dart';
import 'package:file_picker/file_picker.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit({required this.postContactUsUseCase})
      : super(ContactUsInitState());

  final PostContactUsUseCase postContactUsUseCase;

  int activeStepIndex = 0;

  init() {
    activeStepIndex = 0;
    selectedMessageTypeIndex = 0;
    resetFilePicker();
    messageTypesSearch = null;
    emit(ContactUsInitState());
  }

  late int selectedMessageTypeIndex;

  selectMessageTypeIndex(int index) {
    selectedMessageTypeIndex = index;

    emit(SelectMessageTypeIndex());
  }

  changeContactUsStep(int stepNum) async {
    activeStepIndex = stepNum;
    emit(ChangeContactUsStepState(stepNum));
  }

  PlatformFile? pickedFile;

  pickFile() async {
    PlatformFile? platformFile = await FilePickerHelper.pickFile();
    pickedFile = platformFile;

    if (platformFile != null) {
      var bytes = File(platformFile.path.toString()).readAsBytesSync();

      String base64Image = base64Encode(bytes);
      sl<UserData>().updateAttachment(base64Image);
    }

    emit(PickFileState());
  }

  void resetFilePicker(){

    pickedFile=null;
    emit(PickFileState());

  }

  List<String>? messageTypesSearch;

  getMessageTypes({required String searchKey}) {
    if (searchKey.isNotEmpty) {
      messageTypesSearch = messageTypeDummy
          .where((element) => element.contains(searchKey))
          .toList();

      emit(SearchInMessageTypes());
      return;
    }

    messageTypesSearch = null;
    emit(SearchInMessageTypes());
    return;
  }


  Future<void> postContactUsData() async {
    emit(PostContactUsLoadingState());
    final response = await postContactUsUseCase(NoParams());
    return response.fold((l) {
      emit(PostContactUsFailState(l.message.toString()));
    }, (r) {
      emit(PostContactUsSuccessfullyState());
    });
  }
}
