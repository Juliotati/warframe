part of providers;

List<SingleChildWidget> get _coreProviders {
  return <SingleChildWidget>[
    ListenableProvider<ScreenDelegate>(
      create: (_) {
        return ScreenDelegate();
      },
    ),
    Provider<NetWorkInfoImpl>(
      create: (_) {
        return NetWorkInfoImpl.instance;
      },
    ),
  ];
}
