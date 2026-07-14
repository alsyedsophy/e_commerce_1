import 'package:dartz/dartz.dart';
import 'package:e_commerce_1/core/errors/errors.dart';
import 'package:e_commerce_1/features/auth/domain/repositories/auth_repository.dart';

/// Signs the current user out.
class LogoutUseCase {
  LogoutUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<Either<Failure, void>> call() => _authRepository.signOut();
}
