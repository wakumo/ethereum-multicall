import 'dart:typed_data';

import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

class CallFunction {
  final String contractAddress;
  final ContractFunction function;
  final List<dynamic> params;

  CallFunction(
      {required this.contractAddress,
      required this.function,
      required this.params});

  Uint8List get encodedData => function.encodeCall(params);

  dynamic decodeData(Uint8List data) =>
      function.decodeReturnValues(bytesToHex(data));
}
