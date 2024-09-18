class Networks {
  static const int mainnet = 1;
  static const int ropsten = 3;
  static const int rinkeby = 4;
  static const int goerli = 5;
  static const int optimism = 10;
  static const int kovan = 42;
  static const int matic = 137;
  static const int kovanOptimism = 69;
  static const int xdai = 100;
  static const int xDaiTestnet = 10200;
  static const int goerliOptimism = 420;
  static const int sepoliaOptimism = 11155420;
  static const int arbitrum = 42161;
  static const int rinkebyArbitrum = 421611;
  static const int goerliArbitrum = 421613;
  static const int sepoliaArbitrum = 421614;
  static const int mumbai = 80001;
  static const int sepolia = 11155111;
  static const int avalancheMainnet = 43114;
  static const int avalancheFuji = 43113;
  static const int fantomTestnet = 4002;
  static const int fantom = 250;
  static const int bsc = 56;
  static const int bsc_testnet = 97;
  static const int moonbeam = 1284;
  static const int moonriver = 1285;
  static const int moonbaseAlphaTestnet = 1287;
  static const int harmony = 1666600000;
  static const int cronos = 25;
  static const int fuse = 122;
  static const int songbirdCanaryNetwork = 19;
  static const int costonTestnet = 16;
  static const int boba = 288;
  static const int aurora = 1313161554;
  static const int astar = 592;
  static const int okc = 66;
  static const int heco = 128;
  static const int metis = 1088;
  static const int rsk = 30;
  static const int rskTestnet = 31;
  static const int evmos = 9001;
  static const int evmosTestnet = 9000;
  static const int thundercore = 108;
  static const int thundercoreTestnet = 18;
  static const int oasis = 26863;
  static const int celo = 42220;
  static const int godwoken = 71402;
  static const int godwokentestnet = 71401;
  static const int klatyn = 8217;
  static const int milkomeda = 2001;
  static const int kcc = 321;
  static const int etherlite = 111;
  static const int lineaTestnet = 59140;
  static const int linea = 59144;
  static const int scroll = 534352;
  static const int scrollSepolia = 534351;
  static const int zkSyncEra = 324;
  static const int zkSyncEraTestnet = 280;
  static const int zkSyncEraSepoliaTestnet = 300;
  static const int starknet = 300;
  static const int starknetTestnet = 301;
  static const int shibarium = 109;
  static const int mantle = 5000;
  static const int mantleTestnet = 5001;
  static const int base = 8453;
  static const int baseTestnet = 84531;
  static const int blastSepolia = 168587773;
  static const int polygonZkEvm = 1101;
  static const int polygonZkEvmTestnet = 1442;
  static const int zora = 7777777;
  static const int zoraTestnet = 999;
  static const int flare = 14;
  static const int pulsechain = 369;
  static const int sapphire = 23294;
  static const int blast = 81457;
  static const int amoy = 80002;
  static const int mantaPacific = 169;
  static const int mode = 34443;
  static const int modeTestnet = 919;
  static const int bob = 60808;

  static String? getContractBasedOnNetwork(int network) {
    switch (network) {
      case Networks.mainnet:
      case Networks.ropsten:
      case Networks.rinkeby:
      case Networks.goerli:
      case Networks.optimism:
      case Networks.kovan:
      case Networks.matic:
      case Networks.kovanOptimism:
      case Networks.xdai:
      case Networks.xDaiTestnet:
      case Networks.goerliOptimism:
      case Networks.sepoliaOptimism:
      case Networks.arbitrum:
      case Networks.rinkebyArbitrum:
      case Networks.goerliArbitrum:
      case Networks.sepoliaArbitrum:
      case Networks.mumbai:
      case Networks.sepolia:
      case Networks.avalancheMainnet:
      case Networks.avalancheFuji:
      case Networks.fantomTestnet:
      case Networks.fantom:
      case Networks.bsc:
      case Networks.bsc_testnet:
      case Networks.moonbeam:
      case Networks.moonriver:
      case Networks.moonbaseAlphaTestnet:
      case Networks.harmony:
      case Networks.cronos:
      case Networks.fuse:
      case Networks.songbirdCanaryNetwork:
      case Networks.costonTestnet:
      case Networks.boba:
      case Networks.aurora:
      case Networks.astar:
      case Networks.okc:
      case Networks.heco:
      case Networks.metis:
      case Networks.rsk:
      case Networks.rskTestnet:
      case Networks.evmos:
      case Networks.evmosTestnet:
      case Networks.thundercore:
      case Networks.thundercoreTestnet:
      case Networks.oasis:
      case Networks.celo:
      case Networks.godwoken:
      case Networks.godwokentestnet:
      case Networks.klatyn:
      case Networks.milkomeda:
      case Networks.kcc:
      case Networks.lineaTestnet:
      case Networks.linea:
      case Networks.mantle:
      case Networks.mantleTestnet:
      case Networks.base:
      case Networks.baseTestnet:
      case Networks.blastSepolia:
      case Networks.polygonZkEvm:
      case Networks.polygonZkEvmTestnet:
      case Networks.zora:
      case Networks.zoraTestnet:
      case Networks.flare:
      case Networks.pulsechain:
      case Networks.scroll:
      case Networks.scrollSepolia:
      case Networks.sapphire:
      case Networks.blast:
      case Networks.amoy:
      case Networks.mantaPacific:
      case Networks.mode:
      case Networks.bob:
        return '0xcA11bde05977b3631167028862bE2a173976CA11';
      case Networks.modeTestnet:
        return '0xBAba8373113Fb7a68f195deF18732e01aF8eDfCF';
      case Networks.etherlite:
        return '0x21681750D7ddCB8d1240eD47338dC984f94AF2aC';
      case Networks.zkSyncEra:
      case Networks.zkSyncEraTestnet:
      case Networks.zkSyncEraSepoliaTestnet:
        return '0xF9cda624FBC7e059355ce98a31693d299FACd963';
      case Networks.shibarium:
        return '0xd1727fC8F78aBA7DD6294f6033D74c72Ccd3D3B0';
      case Networks.starknet:
        return '0xc662c410C0ECf747543f5bA90660f6ABeBD9C8c4';
      case Networks.starknetTestnet:
        return '0xde29d060D45901Fb19ED6C6e959EB22d8626708e';
      default:
        return null;
    }
  }
}
