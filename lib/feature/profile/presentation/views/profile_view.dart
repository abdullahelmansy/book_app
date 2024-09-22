import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/text_style.dart';
import '../widgets/card_info_widget.dart';
import 'update_password_view.dart';
import 'update_profile_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: getTitleTextStyle(context),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/logout.svg'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.grey[400],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Abdullah Elmansy',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'abdullahelmansy183@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CardInfo(
              title: 'My Orders',
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            CardInfo(
              title: 'Edit Profile',
              onTap: () {
                push(context, const UpdateProfileView());
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CardInfo(
              title: 'Reset Password',
              onTap: () {
                push(context, const UpdatePasswordView());
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CardInfo(
              title: 'FAQ',
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            CardInfo(
              title: 'Contact Us',
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            CardInfo(
              title: 'Privacy & Terms',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
