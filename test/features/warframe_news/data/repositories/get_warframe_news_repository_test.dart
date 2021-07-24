import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:warframe/core/platform/network_info.dart';
import 'package:warframe/features/warframe_news/data/datasources/warframe_news_local_datasource.dart';
import 'package:warframe/features/warframe_news/data/datasources/warframe_news_remote_datasource.dart';
import 'package:warframe/features/warframe_news/data/repositories/warframe_news_repository_impl.dart';

class MockRemoteDatasource extends Mock implements WarframeNewsRemoteDatasource {}

class MockLocalDatasource extends Mock implements WarframeNewsLocalDatasource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late WarframeNewsRepositoryImpl repositoryImpl;
  late MockRemoteDatasource mockRemoteDatasource;
  late MockLocalDatasource mockLocalDatasource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDatasource = MockRemoteDatasource();
    mockLocalDatasource = MockLocalDatasource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = WarframeNewsRepositoryImpl(
      networkInfo: mockNetworkInfo,
      localDatasource: mockLocalDatasource,
      remoteDatasource: mockRemoteDatasource,
    );
  });
  group('getWarframeNews', () {
    test('should check if the device is online', () {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // act
      repositoryImpl.getWarframeNews();

      // assert
    });
  });
}
