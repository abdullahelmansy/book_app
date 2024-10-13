import 'package:book_app/core/functions/navigation.dart';
import 'package:book_app/core/widgets/custom_button.dart';
import 'package:book_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:book_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:book_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:book_app/feature/auth/presentation/views/new_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/utils/colors.dart';

class PinputWidegt extends StatefulWidget {
  const PinputWidegt({Key? key}) : super(key: key);

  @override
  State<PinputWidegt> createState() => _PinputWidegtState();
}

class _PinputWidegtState extends State<PinputWidegt> {
  late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();

    /// In case you need an SMS autofill feature
    // smsRetriever = SmsRetrieverImpl(
    //   SmartAuth(),
    // );
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = AppColors.primaryColor;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = AppColors.primaryColor;

    final defaultPinTheme = PinTheme(
      width: 70, // Adjusted width for 3 digits
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is CheckOTPSuccessState){
          push(context,  NewPasswordView(otp: pinController.text,));
        }
        else if (state is ErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('otp not found')));
          }
      },
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Directionality(
              // Specify direction if desired
              textDirection: TextDirection.ltr,
              child: Pinput(
                length: 6, // Set the length to 3 for 3 digits
                controller: pinController,
                focusNode: focusNode,
                defaultPinTheme: defaultPinTheme,
                separatorBuilder: (index) => const SizedBox(width: 17),
                validator: (value) {
                  return value == pinController.text
                      ? null
                      : 'Pin is incorrect'; // Adjust the correct PIN as per your requirement
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: focusedBorderColor,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
            ),
            const Gap(38),
            CustomButton(
                text: 'Verify',
                onTap: () {
                  focusNode.unfocus();
                  formKey.currentState!.validate();
                  context.read<AuthBloc>().add(CheckOTPEvent(pinController.text));
                  // push(context, const NewPasswordView());
                }),
            // TextButton(
            //   onPressed: () {
            //     focusNode.unfocus();
            //     formKey.currentState!.validate();
            //   },
            //   child: const Text('Validate'),
            // ),
          ],
        ),
      ),
    );
  }
}
