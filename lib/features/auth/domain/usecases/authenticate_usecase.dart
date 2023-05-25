import 'package:huskar/cores/usecase/usecase.dart';
import 'package:huskar/features/auth/domain/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthenticateUsecase extends Usecase<NoUsecaseParams, String?> {
  final AuthRepository _authRepository;

  AuthenticateUsecase(
      {required super.uuidGenerator,
      required super.logger,
      required AuthRepository authRepository})
      : _authRepository = authRepository;
  @override
  Future<String?> calling(NoUsecaseParams params) {
    return _authRepository.authenticate(processId);
  }
}
