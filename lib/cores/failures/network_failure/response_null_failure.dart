import 'package:huskar/cores/failures/failure.dart';

class ResponseNullFailure extends Failure {
  const ResponseNullFailure(
      {super.message = "Response Null", required super.trace, super.processId = ""});
}
