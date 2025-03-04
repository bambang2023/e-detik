class LoginModel {
  final String msg;
  final String token;
  final String code;

  LoginModel({
    required this.msg,
    required this.token,
    required this.code,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"] as Map<String, dynamic>;
    return LoginModel(
      msg: data["msg"],
      token: data["token"],
      code: data["code"],
    );
  }

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "token": token,
        "code": code,
      };
}
