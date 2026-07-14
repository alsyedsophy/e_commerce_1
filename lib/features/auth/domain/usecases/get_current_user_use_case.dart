import 'package:dartz/dartz.dart';
import 'package:e_commerce_1/core/errors/errors.dart';
import 'package:e_commerce_1/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_1/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository authRepository;

  GetCurrentUserUseCase({required this.authRepository});

  Future<Either<Failure, UserEntity?>> call() {
    return authRepository.getCurrentUser();
  }
}
