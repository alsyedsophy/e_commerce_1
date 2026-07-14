import 'package:e_commerce_1/core/network/network_info.dart';
import 'package:e_commerce_1/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:e_commerce_1/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:e_commerce_1/features/auth/domain/repositories/auth_repository.dart';
import 'package:e_commerce_1/features/auth/domain/usecases/auth_state_changes_use_case.dart';
import 'package:e_commerce_1/features/auth/domain/usecases/get_current_user_use_case.dart';
import 'package:e_commerce_1/features/auth/domain/usecases/google_sign_in_use_case.dart';
import 'package:e_commerce_1/features/auth/domain/usecases/login_use_case.dart';
import 'package:e_commerce_1/features/auth/domain/usecases/logout_use_case.dart';
import 'package:e_commerce_1/features/auth/domain/usecases/register_use_case.dart';
import 'package:e_commerce_1/features/auth/domain/usecases/send_password_reset_use_case.dart';
import 'package:e_commerce_1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

void registerAuthentication() {
  final GetIt getIt = GetIt.instance;

  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<GoogleSignIn>(GoogleSignIn.instance);

  // Data sources.
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: getIt<FirebaseAuth>(),
      googleSignIn: getIt<GoogleSignIn>(),
    ),
  );

  // Repositories.
  getIt.registerLazySingleton<AuthRepository>(
    () =>
        AuthRepositoryImpl(getIt<AuthRemoteDataSource>(), getIt<NetworkInfo>()),
  );

  // Use cases (stateless).
  getIt.registerLazySingleton<AuthStateChangesUseCase>(
    () => AuthStateChangesUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<GoogleSignInUseCase>(
    () => GoogleSignInUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<SendPasswordResetUseCase>(
    () => SendPasswordResetUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(authRepository: getIt<AuthRepository>()),
  );

  // Cubits.

  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      logInUseCase: getIt<LoginUseCase>(),
      registerUseCase: getIt<RegisterUseCase>(),
      signInWithGoogleUseCase: getIt<GoogleSignInUseCase>(),
      sendPasswordResetUseCase: getIt<SendPasswordResetUseCase>(),
      logOutUseCase: getIt<LogoutUseCase>(),
      getCurrentUserUseCase: getIt<GetCurrentUserUseCase>(),
      authStateChangesUseCase: getIt<AuthStateChangesUseCase>(),
    ),
  );
}
