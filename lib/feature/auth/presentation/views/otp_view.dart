import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widgets/back_button_widget.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/pinput_widget.dart';
import 'new_password_view.dart';

class OPTView extends StatelessWidget {
  const OPTView({super.key});

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
              'OTP Verification',
              style: getTitleTextStyle(context),
            ),
            const Gap(10),
            Text(
              'Enter the verification code we just sent on your email address.',
              style: getBodyTextStyle(
                context,
                color: AppColors.greyColor,
              ),
            ),
            const Gap(32),
            const PinputWidegt(),
            const Gap(38),
            
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Didn’t received code?',
              style: getSmallTextStyle(context),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Resend',
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
