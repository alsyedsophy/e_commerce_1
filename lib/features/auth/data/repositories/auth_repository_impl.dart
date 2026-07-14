import 'package:dartz/dartz.dart';
import 'package:e_commerce_1/core/errors/exceptions.dart';
import 'package:e_commerce_1/core/errors/failures.dart';
import 'package:e_commerce_1/core/network/network_info.dart';
import 'package:e_commerce_1/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:e_commerce_1/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_1/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Stream<UserEntity?> get authStateChanges =>
      _remoteDataSource.authStateChanges.map((model) => model);

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    return _handleAuthCall(() async {
      return await _remoteDataSource.getCurrentUser();
    });
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return _handleAuthCall(() async {
      return await _remoteDataSource.signInWithEmailAndPassword(
        email,
        password,
      );
    });
  }

  @override
  Future<Either<Failure, UserEntity>> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return _handleAuthCall(() async {
      return await _remoteDataSource.registerWithEmailAndPassword(
        email,
        password,
      );
    });
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    return _handleAuthCall(() async {
      return await _remoteDataSource.signInWithGoogle();
    });
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(String email) async {
    return _handleAuthCall(() async {
      await _remoteDataSource.sendPasswordResetEmail(email);
      return;
    });
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    return _handleAuthCall(() async {
      await _remoteDataSource.signOut();
      return;
    });
  }

  Future<Either<Failure, T>> _handleAuthCall<T>(
    Future<T> Function() call,
  ) async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure());
    }
    try {
      final result = await call();
      return Right(result);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ValidationException catch (e) {
      return Left(ValidationFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(UnknownFailure());
    }
  }
}
