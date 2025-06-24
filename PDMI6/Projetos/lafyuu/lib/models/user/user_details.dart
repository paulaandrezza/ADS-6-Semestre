import 'package:lafyuu/models/enums/Gender.dart';
import 'package:lafyuu/models/enums/UserRole.dart';

class UserDetails {
  final String fullName;
  final String username;
  final String profileImageId;
  final String email;
  final String phoneNumber;
  final DateTime createdAt;
  final Gender gender;
  final DateTime birthDate;

  UserDetails({
    required String userId,
    required UserRole role,
    required this.fullName,
    required this.username,
    required this.profileImageId,
    required this.email,
    required this.phoneNumber,
    required this.createdAt,
    required this.gender,
    required this.birthDate,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      userId: json['userId'],
      role: UserRole.values.firstWhere(
        (r) => r.name.toLowerCase() == (json['role'] as String).toLowerCase(),
        orElse: () => UserRole.client,
      ),
      fullName: json['fullName'],
      username: json['username'],
      profileImageId: json['profileImageId'] ?? '',
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      createdAt: DateTime.parse(json['createdAt']),
      gender: Gender.values.firstWhere(
        (g) => g.name.toLowerCase() == (json['gender'] as String).toLowerCase(),
        orElse: () => Gender.other,
      ),
      birthDate: DateTime.parse(json['birthDate']),
    );
  }
}
