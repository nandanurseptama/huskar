import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:get_it/get_it.dart';
import 'package:hex/hex.dart';
import 'package:huskar/cores/services/logger.dart';
import 'package:huskar/env.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'dependency.config.dart';

GetIt instance = GetIt.instance;

@InjectableInit(
  asExtension: false,
  initializerName: "\$InitDependency",
  preferRelativeImports: true,
)
Future<void> initDependency() => $InitDependency(instance);

@module
abstract class CommonModule {
  @preResolve
  Future<SharedPreferences> get localStorage => SharedPreferences.getInstance();
  Dio getDio(
      @preResolve SharedPreferences sharedPreferences, @preResolve Env env) {
    var d = Dio();
    d.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true));
    return d;
  }

  Uuid get uuid => const Uuid();

  Env get env {
    return Env.create();
  }

  Logger get logger => CmdLogger();
  HexCodec get hexCodec => const HexCodec();

  Encrypter getEncrypter(Env env) {
    return Encrypter(AES(Key.fromUtf8(env.secretPassword), mode: AESMode.cbc));
  }
}
