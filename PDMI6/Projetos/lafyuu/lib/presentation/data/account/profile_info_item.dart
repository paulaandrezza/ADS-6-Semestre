import 'package:flutter/material.dart';
import 'package:lafyuu/presentation/models/profile_info_item.dart';

List<ProfileInfoItemData> buildProfileInfoItems({
  required String gender,
  required String birthDate,
  required String email,
  required String phoneNumber,
}) {
  return [
    ProfileInfoItemData(
      icon: Icons.transgender_outlined,
      label: 'Gender',
      value: gender,
      onTap: () {},
    ),
    ProfileInfoItemData(
      icon: Icons.calendar_month_outlined,
      label: 'Birthday',
      value: birthDate,
      onTap: () {},
    ),
    ProfileInfoItemData(
      icon: Icons.email_outlined,
      label: 'Email',
      value: email,
      onTap: () {},
    ),
    ProfileInfoItemData(
      icon: Icons.phone_android,
      label: 'Phone Number',
      value: phoneNumber,
      onTap: () {},
    ),
    ProfileInfoItemData(
      icon: Icons.lock,
      label: 'Change Password',
      value: '**********',
      onTap: () {},
    ),
  ];
}
