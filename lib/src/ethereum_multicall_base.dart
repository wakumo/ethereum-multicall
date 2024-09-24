import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import 'constant/networks.dart';
import 'model/call_request.dart';
import 'model/call_response.dart';
import 'model/call_result.dart';

class Multicall {
  static const abi =
      '''[{"constant":false,"inputs":[{"components":[{"name":"target","type":"address"},{"name":"callData","type":"bytes"}],"name":"calls","type":"tuple[]"}],"name":"aggregate","outputs":[{"name":"blockNumber","type":"uint256"},{"name":"returnData","type":"bytes[]"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bool","name":"requireSuccess","type":"bool"},{"components":[{"internalType":"address","name":"target","type":"address"},{"internalType":"bytes","name":"callData","type":"bytes"}],"internalType":"struct Multicall2.Call[]","name":"calls","type":"tuple[]"}],"name":"tryBlockAndAggregate","outputs":[{"internalType":"uint256","name":"blockNumber","type":"uint256"},{"internalType":"bytes32","name":"blockHash","type":"bytes32"},{"components":[{"internalType":"bool","name":"success","type":"bool"},{"internalType":"bytes","name":"returnData","type":"bytes"}],"internalType":"struct Multicall2.Result[]","name":"returnData","type":"tuple[]"}],"stateMutability":"nonpayable","type":"function"}]''';

  final String rpcUrl;
  final int chainId;

  Multicall({required this.rpcUrl, required this.chainId});

  static bool isSupport({required int chainId}) =>
      getContractAddress(chainId: chainId) != null;

  static String? getContractAddress({required int chainId}) =>
      Networks.getContractBasedOnNetwork(chainId);

  Future<CallResponse> call({required CallRequest request}) async {
    final contractAddress = request.multicallContractAddress ??
        getContractAddress(chainId: chainId);
    if (contractAddress == null) {
      throw Exception(
        'Network - $chainId doesn\'t have a multicall contract address defined. Please check your network or deploy your own contract on it.',
      );
    }
    final web3Client = Web3Client(rpcUrl, Client());
    final contract = DeployedContract(ContractAbi.fromJson(abi, 'Multicall'),
        EthereumAddress.fromHex(contractAddress));
    if (request.tryBlock) {
      final response = await web3Client.call(
        contract: contract,
        function: contract.function('tryBlockAndAggregate'),
        params: [
          true,
          request.callFunctions
              .map((e) =>
                  [EthereumAddress.fromHex(e.contractAddress), e.encodedData])
              .toList()
        ],
      );
      final blockNumber = response[0];
      final results = (response[2] as List).mapIndexed((i, e) {
        final isSuccess = (e as List)[0] == true && (e[1] as List).isNotEmpty;
        return CallResult(
            isSuccess: isSuccess,
            result: isSuccess ? request.callFunctions[i].decodeData(e[1]) : null);
      }).toList();
      return CallResponse(blockNumber: blockNumber, results: results);
    } else {
      final response = await web3Client.call(
        contract: contract,
        function: contract.function('aggregate'),
        params: [
          request.callFunctions
              .map((e) =>
                  [EthereumAddress.fromHex(e.contractAddress), e.encodedData])
              .toList()
        ],
      );
      final blockNumber = response[0];
      final results = (response[1] as List)
          .mapIndexed((i, e) =>
              CallResult(result: request.callFunctions[i].decodeData(e)))
          .toList();
      return CallResponse(blockNumber: blockNumber, results: results);
    }
  }
}
