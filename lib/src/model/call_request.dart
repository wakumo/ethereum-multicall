import 'call_function.dart';

class CallRequest {
  final List<CallFunction> callFunctions;
  final bool tryBlock;

  CallRequest({required this.callFunctions, this.tryBlock = true});
}
