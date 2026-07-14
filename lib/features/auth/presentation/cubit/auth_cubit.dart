import 'package:e_commerce_1/features/auth/domain/usecases/auth_use_cases.dart';
import 'package:e_commerce_1/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _logInUseCase;
  final RegisterUseCase _registerUseCase;
  final GoogleSignInUseCase _signInWithGoogleUseCase;
  final SendPasswordResetUseCase _sendPasswordResetUseCase;
  final LogoutUseCase _logOutUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final AuthStateChangesUseCase _authStateChangesUseCase;

  AuthCubit({
    required this._logInUseCase,
    required this._registerUseCase,
    required this._signInWithGoogleUseCase,
    required this._sendPasswordResetUseCase,
    required this._logOutUseCase,
    required this._getCurrentUserUseCase,
    required this._authStateChangesUseCase,
  }) : super(AuthState()) {
    _listenToAuthChanges();
    _checkCurrentUser();
  }

  void _listenToAuthChanges() {
    _authStateChangesUseCase().listen((user) {
      if (user != null) {
        emit(state.copyWith(status: AuthStatus.authenticated, user: user));
      } else {
        emit(state.copyWith(status: AuthStatus.unauthenticated, user: null));
      }
    });
  }

  Future<void> _checkCurrentUser() async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _getCurrentUserUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.unauthenticated,
          errorMessage: failure.message,
        ),
      ),
      (user) => emit(
        state.copyWith(
          status: user != null
              ? AuthStatus.authenticated
              : AuthStatus.unauthenticated,
          user: user,
        ),
      ),
    );
  }

  // ==================== Auth Methods ====================

  Future<void> signIn({required String email, required String password}) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _logInUseCase(email: email, password: password);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.unauthenticated,
          errorMessage: failure.message,
        ),
      ),
      (user) =>
          emit(state.copyWith(status: AuthStatus.authenticated, user: user)),
    );
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _registerUseCase(email: email, password: password);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.unauthenticated,
          errorMessage: failure.message,
        ),
      ),
      (user) =>
          emit(state.copyWith(status: AuthStatus.authenticated, user: user)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _signInWithGoogleUseCase();

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.unauthenticated,
          errorMessage: failure.message,
        ),
      ),
      (user) =>
          emit(state.copyWith(status: AuthStatus.authenticated, user: user)),
    );
  }

  Future<void> sendPasswordReset(String email) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _sendPasswordResetUseCase(email: email);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.unauthenticated,
          errorMessage: failure.message,
        ),
      ),
      (_) => emit(
        state.copyWith(status: AuthStatus.unauthenticated),
      ), // أو حالة خاصة
    );
  }

  Future<void> logout() async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _logOutUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.unauthenticated,
          errorMessage: failure.message,
        ),
      ),
      (_) =>
          emit(state.copyWith(status: AuthStatus.unauthenticated, user: null)),
    );
  }
}
