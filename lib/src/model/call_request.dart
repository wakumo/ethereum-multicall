import 'call_function.dart';

class CallRequest {
  final List<CallFunction> callFunctions;
  final bool tryBlock;
  final String? multicallContractAddress;

  CallRequest(
      {required this.callFunctions,
      this.tryBlock = true,
      this.multicallContractAddress});
}
