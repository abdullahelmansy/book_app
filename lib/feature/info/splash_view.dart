import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/functions/navigation.dart';
import '../../core/services/local_storage/local_storage.dart';
import '../../core/utils/text_style.dart';
import '../../core/widgets/nav_bar_widget.dart';
import 'welcome_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      String token = LocalStorage.getData(key: LocalStorage.token) ?? '';
      if (token.isEmpty) {
        pushReplacement(context, const WelcomeView());
      } else {
        pushReplacement(context, const NavBarWidget());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/image/logo.svg'),
            Text(
              'Order Your Book Now!',
              style: getBodyTextStyle(
                context,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
