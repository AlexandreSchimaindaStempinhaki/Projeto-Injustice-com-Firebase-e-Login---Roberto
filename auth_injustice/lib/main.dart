import 'package:autth_injustice_app/authentication/data/services/remote/i_auth_service.dart';
import 'package:autth_injustice_app/core/di/dependency_injection.dart';
import 'package:autth_injustice_app/core/routes/app_routes.dart';
import 'package:autth_injustice_app/core/theme/app_theme.dart' as AppTheme;
import 'package:autth_injustice_app/core/theme/theme_controller.dart';
import 'package:autth_injustice_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //   email: 'jojocae@gmail.com',
  //   password: '123456',
  // );

  setupDependencyInjection();
  // Obtém instância do serviço de autenticação
  final authService = injector.get<IAuthService>();

  // verifica sessão armazenada localmente
  // await authService.signIn( 'jojocae@gmail.com','123456');
  await authService.initSession();

  final themeController = injector.get<ThemeController>();

  runApp(
    Watch(
      (_) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Injustice App With Login',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeController.themeMode.value,
        routerConfig: AppRouter.router,
      ),
    ),
  );
}
