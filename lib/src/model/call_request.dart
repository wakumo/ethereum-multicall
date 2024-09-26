import 'call_function.dart';

class CallRequest {
  final List<CallFunction> callFunctions;
  final bool tryAggregate;
  final String? multicallCustomContractAddress;

  CallRequest(
      {required this.callFunctions,
      this.tryAggregate = true,
      this.multicallCustomContractAddress});
}
