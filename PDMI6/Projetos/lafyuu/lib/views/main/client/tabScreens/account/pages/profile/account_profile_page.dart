import 'package:flutter/material.dart';
import 'package:lafyuu/models/enums/Gender.dart';
import 'package:lafyuu/presentation/build/account/profile_info_item.dart';
import 'package:lafyuu/theme/app_text_styles.dart';
import 'package:lafyuu/views/main/client/tabScreens/account/pages/profile/profile_info_item.dart';

class AccountProfilePage extends StatelessWidget {
  AccountProfilePage({super.key});

  final profileInfoItems = buildProfileInfoItems(
    gender: Gender.male.name,
    birthDate: "12-12-2000",
    email: "email@email.com",
    phoneNumber: "11954544544",
    // gender: user.gender,
    // birthDate: user.birthDate,
    // email: user.email,
    // phoneNumber: user.phoneNumber,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/james.png'),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Maximus Gold', style: AppTextStyles.subtitle4),
                        Text('@derlaxy', style: AppTextStyles.subtitle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: profileInfoItems.length,
                itemBuilder:
                    (context, index) =>
                        ProfileInfoItem(item: profileInfoItems[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
