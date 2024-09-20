import 'dart:developer';

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
import '../../data/model/request/register_model_parames.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
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
          if (state is RegisterSuccessState) {
            Navigator.pop(context);
            pushAndRemoveUntil(context, const NavBarWidget());
          } else if (state is ErrorState) {
            Navigator.pop(context);
            log(state.error);
          } else if (state is RegisterLoadingState) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Hello! Register to get started',
                          style: getHeadLineTextStyle(context),
                        ),
                        const Gap(32),
                        TextFormField(
                          controller: usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter your username';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'Username',
                          ),
                        ),
                        const Gap(15),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter your email';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'Email',
                          ),
                        ),
                        const Gap(15),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter your email';
                            } else {
                              return null;
                            }
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                              hintText: 'Password',
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
                        const Gap(15),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter your Confirm Password';
                            } else {
                              return null;
                            }
                          },
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                              hintText: 'Confirm password',
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
                        const Gap(30),
                        CustomButton(
                            text: 'Register',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                      RegisterEvent(
                                        RegisterModelParames(
                                          email: emailController.text,
                                          name: usernameController.text,
                                          password: passwordController.text,
                                          passwordConfirmation:
                                              confirmPasswordController.text,
                                        ),
                                      ),
                                    );
                              }
                            }),
                        const Gap(34),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                                style: getSmallTextStyle(context),
                              ),
                              TextButton(
                                onPressed: () {
                                  pushReplacement(
                                    context,
                                    const LoginView(),
                                  );
                                },
                                child: Text(
                                  'Login Now',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
