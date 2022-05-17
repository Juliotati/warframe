part of providers;

WarframeCodexRepositoryImpl get _warframeCodexRepositoryImpl {
  return WarframeCodexRepositoryImpl(
    NetWorkInfoImpl.instance,
    ModsRemoteDatasourceImpl(),
    WarframeRemoteDatasourceImpl(),
    WeaponsRemoteDatasourceImpl(),
  );
}

List<SingleChildWidget> get _warframeCodexProviders {
  return <SingleChildWidget>[
    /// ============== WARFRAME CODEX PROVIDER DI ================
    ListenableProvider<WarframeCodexProvider>(
      create: (_) {
        return WarframeCodexProvider(
          GetMods(_warframeCodexRepositoryImpl),
          GetWarframes(_warframeCodexRepositoryImpl),
          GetWeapons(_warframeCodexRepositoryImpl),
        );
      },
    ),
  ];
}
