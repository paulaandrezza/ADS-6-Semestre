import 'package:lafyuu/models/enums/Gender.dart';
import 'package:lafyuu/models/enums/UserRole.dart';
import 'package:lafyuu/models/user/user.dart';

class UserDetails extends User {
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
  }) : super(userId: userId, role: role);
}
