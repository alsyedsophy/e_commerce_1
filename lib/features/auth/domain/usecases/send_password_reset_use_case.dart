import 'package:dartz/dartz.dart';
import 'package:e_commerce_1/core/errors/errors.dart';
import 'package:e_commerce_1/features/auth/domain/repositories/auth_repository.dart';

/// Sends a password-reset email to the given address.
class SendPasswordResetUseCase {
  SendPasswordResetUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<Either<Failure, void>> call({required String email}) =>
      _authRepository.sendPasswordResetEmail(email);
}
