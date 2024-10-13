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
import 'password_changed_view.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key, required this.otp});
  final String otp;
  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  var newPassword = TextEditingController();
  var newConfirmPassword = TextEditingController();
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
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is NewPasswordSuccessState) {
            push(context, const PasswordChangedView());
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Failed')));
          }
        },
        child: Padding(
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
                controller: newPassword,
                decoration: const InputDecoration(
                  hintText: 'New Password',
                  fillColor: Colors.white,
                ),
              ),
              const Gap(15),
              TextFormField(
                controller: newConfirmPassword,
                decoration: const InputDecoration(
                  hintText: 'Confirm Password',
                  fillColor: Colors.white,
                ),
              ),
              const Gap(38),
              CustomButton(
                  text: 'Reset Password',
                  onTap: () {
                    context.read<AuthBloc>().add(NewPasswordEvent(
                          widget.otp,
                          newPassword.text,
                          newConfirmPassword.text,
                        ));
                  }),
            ],
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
