class UserModel {
  int? id;

  UserModel({
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
    );
  }
}
