import 'package:equatable/equatable.dart';

class UserData extends Equatable{
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _mobile;
  String? _messageTitle;
  String? _messageType;
  String? _messageDesc;
  String? _attachment;

  String ?get getFirstName =>_firstName;
  String ?get getLastName =>_lastName;
  String ?get getEmail =>_email;
  String ?get getMobile =>_mobile;
  String ?get getMessageTitle =>_messageTitle;
  String ?get getMessageType =>_messageType;
  String ?get getMessageDesc =>_messageDesc;
  String ?get getAttachment =>_attachment;

 void updateFirstName(String firstName){
   _firstName= firstName;
  }
 void updateLastName(String firstName){
   _lastName= firstName;
  }
  void updateMobile(String mobile){
    _mobile= mobile;
  }
 void updateEmail(String email){
   _email= email;
  }

 void updateMessageTitle(String messageTitle){
   _messageTitle= messageTitle;
  }
 void updateMessageType(String messageType){
   _messageType= messageType;
  }
  void updateMessageDesc(String messageDesc){
   _messageDesc= messageDesc;
  }
  void updateAttachment(String attachment){
   _attachment= attachment;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_firstName,_lastName,_mobile,_email,_messageTitle,_messageType,_messageDesc,_attachment];
}