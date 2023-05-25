import 'package:huskar/cores/usecase/usecase.dart';
import 'package:huskar/features/auth/domain/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LogoutUsecase extends Usecase<NoUsecaseParams, void> {
  final AuthRepository _authRepository;
  LogoutUsecase(
      {required super.uuidGenerator,
      required super.logger,
      required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<void> calling(NoUsecaseParams params) {
    return _authRepository.logout(processId);
  }
}
