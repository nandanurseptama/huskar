import 'package:huskar/cores/failures/failure.dart';

class NotFoundFailure extends Failure{
  const NotFoundFailure({super.message = "Not Found", required super.trace});
}