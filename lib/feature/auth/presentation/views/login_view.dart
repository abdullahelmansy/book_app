
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widgets/back_button_widget.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/nav_bar_widget.dart';
import '../../data/model/request/login_model_params.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/social_login_widegt.dart';
import 'forget_password_view.dart';
import 'register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          if (state is LoginSuccessState) {
            pushAndRemoveUntil(context, const NavBarWidget());
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Welcome back! Glad to see you, Again!',
                        style: getHeadLineTextStyle(context),
                      ),
                      const Gap(32),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter your email';
                          } else {
                            return null;
                          }
                        },
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                        ),
                      ),
                      const Gap(15),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter your password';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter your password',
                            suffixIconConstraints: const BoxConstraints(
                              maxWidth: 40,
                              maxHeight: 12,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: SvgPicture.asset(
                                'assets/icons/fluent_eye-20-filled.svg',
                                width: 20,
                                height: 20,
                              ),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              push(context, const ForgetPasswordView());
                            },
                            child: Text(
                              'Forgot Password?',
                              style: getSmallTextStyle(context),
                            ),
                          ),
                        ],
                      ),
                      const Gap(30),
                      CustomButton(
                          text: 'Login',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    LoginEvent(
                                      LoginModelParams(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    ),
                                  );
                            }
                          }),
                      const Gap(34),
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          const Gap(10),
                          Text(
                            'Or Login with',
                            style: getSmallTextStyle(context),
                          ),
                          const Gap(10),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      const Gap(20),
                      const SocialLoginWidget()
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: getSmallTextStyle(context),
                  ),
                  TextButton(
                    onPressed: () {
                      pushReplacement(context, const RegisterView());
                    },
                    child: Text(
                      'Register Now',
                      style: getSmallTextStyle(context,
                          color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
