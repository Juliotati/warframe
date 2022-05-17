part of providers;

List<SingleChildWidget> get _coreProviders {
  return <SingleChildWidget>[
    ListenableProvider<ScreenDelegate>(create: (_) => ScreenDelegate()),
  ];
}
