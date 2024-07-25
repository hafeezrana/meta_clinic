import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  static msg(String msg) {
    return Fluttertoast.showToast(msg: msg);
  }
}
