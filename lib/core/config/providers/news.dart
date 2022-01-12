part of providers;

List<SingleChildWidget> get _newsProviders {
  return <SingleChildWidget>[
    /// ============== NEWS DATA SOURCE DI ================
    Provider<NewsRemoteDatasourceImpl>(
      create: (_) => NewsRemoteDatasourceImpl(),
    ),

    /// ============== NEWS REPOSITORY CONTRACT ================
    ProxyProvider2<NetWorkInfoImpl, NewsRemoteDatasourceImpl, NewsRepository>(
      update: (
        _,
        NetWorkInfoImpl _networkInfo,
        NewsRemoteDatasourceImpl _remoteDataSource,
        __,
      ) {
        return NewsRepositoryImpl(_networkInfo, _remoteDataSource);
      },
    ),

    /// ============== NEWS USECASES DI ================
    ProxyProvider<NewsRepository, GetNews>(
      update: (_, NewsRepository _newsRepository, __) {
        return GetNews(_newsRepository);
      },
    ),

    ProxyProvider<NewsRepository, RefreshNews>(
      update: (_, NewsRepository _newsRepository, __) {
        return RefreshNews(_newsRepository);
      },
    ),

    /// ============== NEWS PROVIDER DI ================
    ListenableProxyProvider2<GetNews, RefreshNews, NewsProvider>(
      update: (_, GetNews _getNews, RefreshNews _refreshNews, __) {
        return NewsProvider(_getNews, _refreshNews);
      },
    ),
  ];
}
