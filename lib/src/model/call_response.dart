import 'call_result.dart';

class CallResponse {
  final BigInt blockNumber;
  final List<CallResult> results;

  CallResponse({required this.blockNumber, required this.results});
}
