extension FormValidator on String{

  bool emailValidator(){
    final bool isValidEmail =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
    return isValidEmail;
  }

  bool onlyTextValidator(){
  final bool  isValidName =  RegExp(r'^[a-zA-Z]+$').hasMatch(this);

  return isValidName;
  }
  // bool numberValidator(){
  //   final Iterable<RegExpMatch>  checkAllNumbers =  RegExp(r'^[０-９]+$').allMatches(this);
  //   print('checkAllNumbers $checkAllNumbers');
  //   // final bool isValidNumber = !checkAllNumbers.contains();
  //   return true;
  //
  // }

}