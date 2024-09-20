
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/services/dio/dio_provider.dart';
import 'core/services/local_storage/local_storage.dart';
import 'core/utils/themes.dart';
import 'feature/auth/presentation/bloc/auth_bloc.dart';
import 'feature/info/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioProvider.init();
  await LocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        home: const SplashView(),
        theme: AppThemes.lightTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
