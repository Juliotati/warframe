part of providers;

final NewsRepositoryImpl _newsRepositoryImpl = NewsRepositoryImpl(
  NetWorkInfoImpl.instance,
  NewsRemoteDatasourceImpl(),
);

List<SingleChildWidget> get _newsProviders {
  return <SingleChildWidget>[
    /// ============== NEWS PROVIDER DI ================
    ListenableProvider<NewsProvider>(
      create: (_) {
        return NewsProvider(GetNews(_newsRepositoryImpl));
      },
    ),
  ];
}
