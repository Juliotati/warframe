part of providers;

List<SingleChildWidget> get _warframeCodexProviders {
  return <SingleChildWidget>[
    /// ============== DATA SOURCES DI ================
    ListenableProvider<WarframeRemoteDatasourceImpl>(
      create: (_) => WarframeRemoteDatasourceImpl(),
    ),

    ListenableProvider<ModsRemoteDatasourceImpl>(
      create: (_) => ModsRemoteDatasourceImpl(),
    ),

    ListenableProvider<WeaponsRemoteDatasourceImpl>(
      create: (_) => WeaponsRemoteDatasourceImpl(),
    ),

    /// ============== WARFRAME CODEX REPOSITORY CONTRACT ================
    ProxyProvider4<
        NetWorkInfoImpl,
        ModsRemoteDatasourceImpl,
        WarframeRemoteDatasourceImpl,
        WeaponsRemoteDatasourceImpl,
        WarframeCodexRepository>(
      update: (
        _,
        NetWorkInfoImpl _networkInfo,
        ModsRemoteDatasourceImpl _modsDataSource,
        WarframeRemoteDatasourceImpl _warframeDataSource,
        WeaponsRemoteDatasourceImpl _weaponsDataSource,
        __,
      ) {
        return WarframeCodexRepositoryImpl(
          _networkInfo,
          _modsDataSource,
          _warframeDataSource,
          _weaponsDataSource,
        );
      },
    ),

    /// ============== WARFRAME CODEX USECASES DI ================
    ProxyProvider<WarframeCodexRepository, GetWarframe>(
      update: (_, WarframeCodexRepository _warframeCodexsRepository, __) {
        return GetWarframe(_warframeCodexsRepository);
      },
    ),

    ProxyProvider<WarframeCodexRepository, GetMods>(
      update: (_, WarframeCodexRepository _warframeCodexsRepository, __) {
        return GetMods(_warframeCodexsRepository);
      },
    ),

    ProxyProvider<WarframeCodexRepository, GetWeapons>(
      update: (_, WarframeCodexRepository _warframeCodexsRepository, __) {
        return GetWeapons(_warframeCodexsRepository);
      },
    ),

    /// ============== WARFRAME CODEX PROVIDER DI ================
    ProxyProvider3<GetMods, GetWarframe, GetWeapons, WarframeCodexProvider>(
      update: (
        _,
        GetMods _getMods,
        GetWarframe _getWarframe,
        GetWeapons _getWeapons,
        __,
      ) {
        return WarframeCodexProvider(_getMods, _getWarframe, _getWeapons);
      },
    ),
  ];
}
