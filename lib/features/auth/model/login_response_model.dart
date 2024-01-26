class LoginResponseModel {
  final String? token;

  LoginResponseModel({
    this.token,
  });

  LoginResponseModel copyWith({
    String? token,
  }) =>
      LoginResponseModel(
        token: token ?? this.token,
      );

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
