class ErrorModel {
  final String? error;

  ErrorModel({
    this.error,
  });

  ErrorModel copyWith({
    String? error,
  }) =>
      ErrorModel(
        error: error ?? this.error,
      );

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
      };
}
