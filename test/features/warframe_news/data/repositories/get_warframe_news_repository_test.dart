import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warframe/core/platform/network_info.dart';
import 'package:warframe/features/warframe_news/data/datasources/warframe_news_local_datasource.dart';
import 'package:warframe/features/warframe_news/data/datasources/warframe_news_remote_datasource.dart';
import 'package:warframe/features/warframe_news/data/repositories/warframe_news_repository_impl.dart';

class MockRemoteDatasource extends Mock implements WarframeNewsRemoteDatasource {}

class MockLocalDatasource extends Mock implements WarframeNewsLocalDatasource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {

  final MockRemoteDatasource mockRemoteDatasource = MockRemoteDatasource();
  final MockLocalDatasource mockLocalDatasource = MockLocalDatasource();
  final MockNetworkInfo mockNetworkInfo = MockNetworkInfo();
  final WarframeNewsRepositoryImpl repositoryImpl= WarframeNewsRepositoryImpl(
      networkInfo: mockNetworkInfo,
      localDatasource: mockLocalDatasource,
      remoteDatasource: mockRemoteDatasource,
    );

  group('check connectivity', () {
    test('should check if the device is online', () async {
      // arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // act
      await repositoryImpl.getWarframeNews();

      // assert
      expect(() => mockNetworkInfo.isConnected, true);
      verify(() => mockNetworkInfo.isConnected);
    });
  });
}
