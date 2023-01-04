import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  String? path;
  int StepIndex = 0;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtid = TextEditingController();
  TextEditingController txtbirth = TextEditingController();
  TextEditingController txtlocation = TextEditingController();

  String gender="Male";
  String note = "",note2 = "";
  String name="",phone="",id="",birth="",location="";

  void changeStepIndex(int index) {
    StepIndex = index;
    notifyListeners();
  }

  void passdata(){
    name = txtName.text;
    phone = txtphone.text;
    id = txtid.text;
    birth = txtbirth.text;
    location = txtlocation.text;
    notifyListeners();
  }

  void changeimage(image) {
    path = image;
    notifyListeners();
  }
  void choosegender(value){
    gender = value as String;
    notifyListeners();
  }
}
