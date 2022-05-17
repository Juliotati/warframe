import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/core/platform/network_info.dart';
import 'package:warframe/features/warframe_news/data/datasources/news_remote_datasource.dart';
import 'package:warframe/features/warframe_news/data/models/news_model.dart';
import 'package:warframe/features/warframe_news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  const NewsRepositoryImpl(
    this._networkInfo,
    this._remoteDatasource,
  );

  final NewsRemoteDatasourceImpl _remoteDatasource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<WarframeException, List<NewsModel>?>> getNews() async {
    if (await _networkInfo.isConnected) {
      return Right<WarframeException, List<NewsModel>?>(
        await _remoteDatasource.getRemoteNews(),
      );
    }
    return Left<WarframeException, List<NewsModel>?>(WarframeException());
  }
}
