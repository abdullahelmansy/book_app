import 'package:book_app/feature/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:book_app/feature/home/presentation/bloc/bloc/home_event.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc()..add(GetBestSellerEvent())..add(GetSlidersEvent()),
        ),
      ],
      child: MaterialApp(
        home: const SplashView(),
        theme: AppThemes.lightTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
