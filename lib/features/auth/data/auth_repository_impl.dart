import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:huskar/cores/failures/network_failure/response_null_failure.dart';
import 'package:huskar/cores/usecase/repository_error_handler.dart';
import 'package:huskar/cores/utils/utils.dart';
import 'package:huskar/env.dart';
import 'package:huskar/features/auth/domain/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final Dio _httpClient;
  final SharedPreferences _localStorage;
  final Encrypter _encrypter;
  final Env _env;

  const AuthRepositoryImpl(
      {required Env env,
      required Dio httpClient,
      required SharedPreferences localStorage,
      required Encrypter encrypter})
      : _env = env,
        _httpClient = httpClient,
        _localStorage = localStorage,
        _encrypter = encrypter;

  String? get email {
    return _localStorage.getString("email");
  }

  String? get password {
    return _localStorage.getString("password");
  }

  int? get lastAuthTime {
    return _localStorage.getInt("last_auth_time");
  }

  String encrypt(String plainText) {
    var enc = _encrypter.encrypt(plainText, iv: IV.fromUtf8(_env.ivPassword));
    return enc.base64;
  }

  String decrypt(String encryptedText) {
    var dec = _encrypter.decrypt(Encrypted.fromBase64(encryptedText),
        iv: IV.fromUtf8(_env.ivPassword));
    return dec;
  }

  @override
  Future<String?> authenticate(String processId) async {
    try {
      if (lastAuthTime == null) {
        return null;
      }
      if (email == null || password == null) {
        return null;
      }
      var plainPassword = decrypt(password!);
      var plainEmail = decrypt(email!);

      var now = DateTime.now().millisecondsSinceEpoch;
      var difference =
          Duration(milliseconds: now) - Duration(milliseconds: lastAuthTime!);

      if (difference.inSeconds < (24 * 3600)) {
        return email;
      }

      return await login(
          processId: processId, email: plainEmail, password: plainPassword);
    } catch (err, trace) {
      var f =
          repositoryErrorHandler(err: err, processId: processId, trace: trace);
      throw f;
    }
  }

  @override
  Future<String> login(
      {required String processId,
      required String email,
      required String password}) async {
    try {
      var result = await _httpClient.postWithRequestId(_env.loginUrl, processId,
          data: {"email": email, "password": password});
      if (result.data == null) {
        throw ResponseNullFailure(trace: StackTrace.current);
      }
      if (result.data['token'] == null) {
        throw ResponseNullFailure(trace: StackTrace.current);
      }
      var encryptedPassword = encrypt(password);
      var encryptedEmail = encrypt(email);

      await _localStorage.setString("email", encryptedEmail);
      await _localStorage.setString("password", encryptedPassword);
      await _localStorage.setInt(
          "last_auth_time", DateTime.now().millisecondsSinceEpoch);
      return email;
    } catch (err, trace) {
      var f =
          repositoryErrorHandler(err: err, processId: processId, trace: trace);
      throw f;
    }
  }

  @override
  Future<void> logout(String processId) async{
    try {
      await _localStorage.clear();
      return;
    } catch (err, trace) {
      var f =
          repositoryErrorHandler(err: err, processId: processId, trace: trace);
      throw f;
    }
  }
}
