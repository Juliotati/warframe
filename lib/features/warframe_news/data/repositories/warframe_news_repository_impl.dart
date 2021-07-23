import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/failures.dart';
import 'package:warframe/core/platform/network_info.dart';
import 'package:warframe/features/warframe_news/data/datasources/warframe_news_local_datasource.dart';
import 'package:warframe/features/warframe_news/data/datasources/warframe_news_remote_datasource.dart';
import 'package:warframe/features/warframe_news/data/models/warframe_news.dart';
import 'package:warframe/features/warframe_news/domain/repositories/warframe_news_repository.dart';

class WarframeNewsRepositoryImpl implements WarframeNewsRepository {
  const WarframeNewsRepositoryImpl({
    required this.networkInfo,
    required this.localDatasource,
    required this.remoteDatasource,
  });

  final WarframeNewsRemoteDatasource remoteDatasource;
  final WarframeNewsLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<WarframeNewsModel>>> getWarframeNews() {
    // TODO: implement getWarframeNews
    throw UnimplementedError();
  }
}
