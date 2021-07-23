import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/warframe_news.dart';

abstract class WarframeNewsRepository {
  Future<Either<Failure, List<WarframeNews>>> getWarframeNews();
}
