import 'package:dartz/dartz.dart';
import 'package:e_commerce_1/core/errors/errors.dart';
import 'package:e_commerce_1/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_1/features/auth/domain/repositories/auth_repository.dart';

/// Signs the user in with a Google account.
class GoogleSignInUseCase {
  GoogleSignInUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<Either<Failure, UserEntity>> call() =>
      _authRepository.signInWithGoogle();
}
