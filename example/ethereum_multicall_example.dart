import 'package:ethereum_multicall/ethereum_multicall.dart';
import 'package:web3dart/web3dart.dart';

void main() async {
  const erc20Abi =
      '''[{"constant":true,"inputs":[{"name":"_owner","type":"address"}],"name":"balanceOf","outputs":[{"name":"balance","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"}]''';
  final contract = ContractAbi.fromJson(erc20Abi, 'erc20');
  final function = contract.functions.singleWhere((f) => f.name == 'balanceOf');

  final sampleContracts = [
    '0x2791bca1f2de4661ed88a30c99a7a9449aa84174',
    '0xc2132d05d31c914a87c6611c10748aeb04b58e8f',
    '0x3c499c542cef5e3811e1192ce70d8cc03d5c3359'
  ];

  final multicall = Multicall(rpcUrl: 'https://polygon-rpc.com', chainId: 137);
  final functions = sampleContracts
      .map((e) => CallFunction(contractAddress: e, function: function, params: [
            EthereumAddress.fromHex(
                '0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045')
          ]))
      .toList();
  final request = CallRequest(callFunctions: functions);
  final response = await multicall.call(request: request);

  print('blockNumber: ${response.blockNumber}');
  for (var element in response.results) {
    print('results: ${element.isSuccess}|${element.result}');
  }
}
