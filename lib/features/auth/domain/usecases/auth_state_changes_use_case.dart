import 'package:e_commerce_1/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_1/features/auth/domain/repositories/auth_repository.dart';

class AuthStateChangesUseCase {
  final AuthRepository _repository;

  AuthStateChangesUseCase(this._repository);

  Stream<UserEntity?> call() {
    return _repository.authStateChanges;
  }
}
