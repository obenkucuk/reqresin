class UsersModel {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<User>? users;
  final Support? support;

  UsersModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.users,
    this.support,
  });

  UsersModel copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<User>? users,
    Support? support,
  }) =>
      UsersModel(
        page: page ?? this.page,
        perPage: perPage ?? this.perPage,
        total: total ?? this.total,
        totalPages: totalPages ?? this.totalPages,
        users: users ?? this.users,
        support: support ?? this.support,
      );

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        users: json["data"] == null
            ? []
            : List<User>.from(json["data"]!.map((x) => User.fromJson(x))),
        support:
            json["support"] == null ? null : Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": users == null
            ? []
            : List<dynamic>.from(users!.map((x) => x.toJson())),
        "support": support?.toJson(),
      };
}

class User {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  User copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        avatar: avatar ?? this.avatar,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class Support {
  final String? url;
  final String? text;

  Support({
    this.url,
    this.text,
  });

  Support copyWith({
    String? url,
    String? text,
  }) =>
      Support(
        url: url ?? this.url,
        text: text ?? this.text,
      );

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
