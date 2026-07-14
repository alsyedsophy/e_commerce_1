import 'package:dartz/dartz.dart';
import 'package:e_commerce_1/core/errors/failures.dart';
import 'package:e_commerce_1/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_1/features/auth/domain/repositories/auth_repository.dart';

/// Creates a new account with email and password.
class RegisterUseCase {
  RegisterUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) => _authRepository.registerWithEmailAndPassword(email, password);
}
