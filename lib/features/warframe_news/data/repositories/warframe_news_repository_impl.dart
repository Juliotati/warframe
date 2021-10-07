import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/failures.dart';
import 'package:warframe/core/platform/network_info.dart';
import 'package:warframe/features/warframe_news/data/datasources/news_local_datasource.dart';
import 'package:warframe/features/warframe_news/data/datasources/news_remote_datasource.dart';
import 'package:warframe/features/warframe_news/domain/repositories/news_repository.dart';

class WarframeNewsRepositoryImpl implements NewsRepository {
  const WarframeNewsRepositoryImpl({
    required this.networkInfo,
    required this.localDatasource,
    required this.remoteDatasource,
  });

  final NewsRemoteDatasource remoteDatasource;
  final NewsLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, void>> getWarframeNews() async {
    networkInfo.isConnected;
    return Right(await remoteDatasource.getRemoteWarframeNews());
  }
}
