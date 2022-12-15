class RegisterError {
  List? email, password, mobile;

  RegisterError.formJson(Map<String, dynamic> map) {
    if (map.containsKey("email")) {
      email = map["email"];
    }
    if (map.containsKey("confirm_password")) {
      password = map["confirm_password"];
    }
    if (map.containsKey("mobile_no")) {
      mobile = map["mobile_no"];
    }
  }

  String getErrorMessage() {
    var list = [email, password, mobile];
    return list
        .firstWhere((element) => element != null && element.isNotEmpty)!
        .elementAt(0);
  }
}