import 'package:huskar/cores/usecase/usecase.dart';
import 'package:huskar/features/auth/domain/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUsecase extends Usecase<(String, String), String> {
  final AuthRepository _authRepository;

  LoginUsecase(
      {required super.uuidGenerator,
      required super.logger,
      required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<String> calling((String, String) params) {
    var email = params.$1;
    var password = params.$2;
    return _authRepository.login(
        processId: processId, email: email, password: password);
  }
}
