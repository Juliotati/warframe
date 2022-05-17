import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/core/platform/network_info.dart';
import 'package:warframe/features/warframe_codex/data/datasources/mods_remote_datasource.dart';
import 'package:warframe/features/warframe_codex/data/datasources/warframe_remote_datasource.dart';
import 'package:warframe/features/warframe_codex/data/datasources/weapon_remote_datasource.dart';
import 'package:warframe/features/warframe_codex/data/models/mod_model.dart';
import 'package:warframe/features/warframe_codex/data/models/warframe_model.dart';
import 'package:warframe/features/warframe_codex/domain/repositories/warframe_codex_repository.dart';

class WarframeCodexRepositoryImpl implements WarframeCodexRepository {
  const WarframeCodexRepositoryImpl(
    this._netWorkInfoImpl,
    this._modsRemoteDatasourceImpl,
    this._warframeRemoteDatasourceImpl,
    this._weaponsRemoteDatasourceImpl,
  );

  final NetWorkInfoImpl _netWorkInfoImpl;
  final ModsRemoteDatasourceImpl _modsRemoteDatasourceImpl;
  final WarframeRemoteDatasourceImpl _warframeRemoteDatasourceImpl;
  final WeaponsRemoteDatasourceImpl _weaponsRemoteDatasourceImpl;

  @override
  Future<Either<WarframeException, List<ModModel>?>> mods() async {
    if (await _netWorkInfoImpl.isConnected) {
      return Right<WarframeException, List<ModModel>?>(
        await _modsRemoteDatasourceImpl.mods(),
      );
    }
    return Left<WarframeException, List<ModModel>?>(WarframeException());
  }

  @override
  Future<Either<WarframeException, List<WarframeModel>?>> warframes() async {
    if (await _netWorkInfoImpl.isConnected) {
      return Right<WarframeException, List<WarframeModel>?>(
        await _warframeRemoteDatasourceImpl.warframes(),
      );
    }

    return Left<WarframeException, List<WarframeModel>?>(WarframeException());
  }

  @override
  Future<Either<WarframeException, List<dynamic>?>> weapons() async {
    if (await _netWorkInfoImpl.isConnected) {
      return Right<WarframeException, List<dynamic>?>(
        await _weaponsRemoteDatasourceImpl.weapons(),
      );
    }

    return Left<WarframeException, List<dynamic>>(WarframeException());
  }
}
