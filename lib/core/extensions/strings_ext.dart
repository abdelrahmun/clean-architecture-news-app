extension StringExtension on String {

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String capitalizeAll() {
    return toUpperCase();
  }

  DateTime toDateTime(){
    return DateTime.parse(this);
  }
  String trimTo30() {
    if (length > 30) {
      return '${substring(0, 30)}...';
    }
    return this;
  }

  String trimTo20() {
    if (length > 20) {
      return '${substring(0, 20)}...';
    }
    return this;
  }

  String trimTo15() {
    if (length > 15) {
      return '${substring(0, 15)}...';
    }
    return this;
  }

  String trimTo10() {
    if (length > 10) {
      return '${substring(0, 10)}...';
    }
    return this;
  }

  String lastChars(int n) => substring(length - n);
}