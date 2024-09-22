import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widgets/back_button_widget.dart';
import '../../../../core/widgets/custom_button.dart';
import 'login_view.dart';
import 'password_changed_view.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            BackButtonWidegt(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create new password',
              style: getTitleTextStyle(context),
            ),
            const Gap(10),
            Text(
              'Your new password must be unique from those previously used.',
              style: getBodyTextStyle(
                context,
                color: AppColors.greyColor,
              ),
            ),
            const Gap(30),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'New Password',
                fillColor: Colors.white,
              ),
            ),
            const Gap(15),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Confirm Password',
                fillColor: Colors.white,
              ),
            ),
            const Gap(38),
            CustomButton(
                text: 'Reset Password',
                onTap: () {
                  push(context, const PasswordChangedView());
                }),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Remember Password?',
              style: getSmallTextStyle(context),
            ),
            TextButton(
              onPressed: () {
                pushReplacement(context, const LoginView());
              },
              child: Text(
                'Login',
                style:
                    getSmallTextStyle(context, color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
