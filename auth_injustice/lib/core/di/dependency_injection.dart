import 'package:auto_injector/auto_injector.dart';
import 'package:autth_injustice_app/authentication/data/repositories/auth_repository_impl.dart';
import 'package:autth_injustice_app/authentication/data/repositories/i_auth_repository.dart';
import 'package:autth_injustice_app/authentication/data/services/local/auth_local_session_manager.dart';
import 'package:autth_injustice_app/authentication/data/services/local/i_local_session_store.dart';
import 'package:autth_injustice_app/authentication/data/services/local/shared_pref_local_session_service.dart';
import 'package:autth_injustice_app/authentication/data/services/remote/firebase_auth_service.dart';
import 'package:autth_injustice_app/authentication/data/services/remote/i_auth_service.dart';
import 'package:autth_injustice_app/authentication/domain/facades/auth_use_case_facade_impl.dart';
import 'package:autth_injustice_app/authentication/domain/facades/i_auth_use_case_facade.dart';
import 'package:autth_injustice_app/authentication/domain/usecases/auth_usecases_impl.dart';
import 'package:autth_injustice_app/authentication/domain/usecases/i_auth_usecases.dart';
import 'package:autth_injustice_app/authentication/presentation/controllers/auth_session_viewmodel.dart';

import '../theme/theme_controller.dart';

final injector = AutoInjector();
void setupDependencyInjection() {

  // Regristração de dependências do Core
  injector.addSingleton<ThemeController>(ThemeController.new);
  
  // modulo de autenticação
  injector.addSingleton<ILocalSessionStore>(SharedPrefLocalSessionService.new);
  injector.addSingleton<AuthLocalSessionManager>(AuthLocalSessionManager.new);
  injector.addSingleton<IAuthService>(FirebaseAuthService.new);
  injector.addSingleton<IAuthRepository>(AuthRepositoryImpl.new);

  // use cases
  injector.addSingleton<ISignUpUseCase>(SignUpUseCase.new);
  injector.addSingleton<ISignInUseCase>(SignInUseCase.new);
  injector.addSingleton<ISignInWithGoogleUseCase>(SignInWithGoogleUseCase.new);
  injector.addSingleton<ISignOutUseCase>(SignOutUseCase.new);
  injector.addSingleton<IAuthUseCaseFacade>(AuthUseCaseFacadeImpl.new);

  // viewmodels (gerais)
  injector.addSingleton<AuthViewModel>(AuthViewModel.new);
  // injector.addSingleton<UtilsVM>(UtilsVM.new);

  // Regristração de dependências para Account
  // Repositories e servicos
  // injector.addSingleton<IAccountLocalStorage>(AccountSharedPreferencesService.new);
 
  // Use Cases e Facades
  
  // Regristração de dependências para Character
  // Repositories e serviços
 
  // Use Cases e Facades
  

  // viewmodes
  // Account viewmodes
 
  injector.commit();
}