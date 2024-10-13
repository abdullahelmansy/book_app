import 'package:book_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:book_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:book_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widgets/back_button_widget.dart';
import '../../../../core/widgets/custom_button.dart';
import 'login_view.dart';
import 'otp_view.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
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
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is CheckEmailSuccessState) {
            push(context, const OPTView());
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Email not found')));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password?',
                  style: getTitleTextStyle(context),
                ),
                const Gap(10),
                Text(
                  'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                  style: getBodyTextStyle(
                    context,
                    color: AppColors.greyColor,
                  ),
                ),
                const Gap(30),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    fillColor: Colors.white,
                  ),
                ),
                const Gap(38),
                CustomButton(
                    text: 'Send Code',
                    onTap: () {
                      context
                          .read<AuthBloc>()
                          .add(CheckEmailEvent(emailController.text));
                    }),
              ],
            ),
          ),
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
              onPressed: () {},
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
