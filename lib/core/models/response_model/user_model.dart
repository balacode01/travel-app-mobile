class UserModel {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String profilePicture;
  final String bio;
  final Map<String, String> socialLinks;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.bio,
    required this.socialLinks,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email_address"],
      phoneNumber: json["phone_number"],
      profilePicture: json["profile_picture"],
      bio: json["bio"],
      socialLinks: Map<String, String>.from(json["social_links"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email_address": email,
      "phone_number": phoneNumber,
      "profile_picture": profilePicture,
      "bio": bio,
      "social_links": socialLinks,
    };
  }
}
