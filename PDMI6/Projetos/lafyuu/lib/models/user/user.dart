import 'package:lafyuu/models/enums/UserRole.dart';

class User {
  final String id;
  final UserRole role;

  User({
    required this.id,
    required this.role,
  });
}