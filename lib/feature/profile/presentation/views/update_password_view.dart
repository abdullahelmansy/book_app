import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widgets/back_button_widget.dart';
import '../../../../core/widgets/custom_button.dart';
import 'profile_view.dart';

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({super.key});

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'New Password',
              style: getHeadLineTextStyle(context),
            ),
            const Gap(45),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'New Password',
                  hintStyle: getBodyTextStyle(
                    context,
                    color: AppColors.greyColor,
                  )),
            ),
            const Gap(31),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Confirm password',
                  hintStyle: getBodyTextStyle(
                    context,
                    color: AppColors.greyColor,
                  )),
            ),
            const Gap(45),
            CustomButton(
                text: 'Update Password',
                textStyle:
                    getTitleTextStyle(context, color: AppColors.whiteColor),
                onTap: () {
                  pushReplacement(context, const ProfileView());
                }),
          ],
        ),
      ),
    );
  }
}
