import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

abstract class ContactUsState {}

class ContactUsInitState extends ContactUsState {}

class ChangeContactUsStepState extends ContactUsState {
  final int activeIndex;
  ChangeContactUsStepState(this.activeIndex);
}

class PickFileState extends ContactUsState {
  PickFileState();
}

class SelectMessageTypeIndex extends ContactUsState {
  SelectMessageTypeIndex();
}

class SearchInMessageTypes extends ContactUsState {
  SearchInMessageTypes();
}

class PostContactUsLoadingState extends ContactUsState {
  PostContactUsLoadingState();
}

class PostContactUsSuccessfullyState extends ContactUsState {
  PostContactUsSuccessfullyState();
}

class PostContactUsFailState extends ContactUsState {
  final String errorMessage;
  PostContactUsFailState(this.errorMessage);
}
