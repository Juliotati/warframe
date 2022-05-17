import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/core/platform/network_info.dart';
import 'package:warframe/features/warframe_codex/data/datasources/mods_remote_datasource.dart';
import 'package:warframe/features/warframe_codex/data/datasources/warframe_remote_datasource.dart';
import 'package:warframe/features/warframe_codex/data/datasources/weapon_remote_datasource.dart';
import 'package:warframe/features/warframe_codex/data/models/gun_model.dart';
import 'package:warframe/features/warframe_codex/data/models/melee_weapon_model.dart';
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
  Future<Either<WarframeException, void>> getWeapons() async {
    if (await _netWorkInfoImpl.isConnected) {
      return Right<WarframeException, void>(
        _weaponsRemoteDatasourceImpl.getWeapons(),
      );
    }

    return Left<WarframeException, void>(WarframeException());
  }

  @override
  Either<WarframeException, List<GunModel>?> guns(String category) {
    try {
      return Right<WarframeException, List<GunModel>?>(
        _weaponsRemoteDatasourceImpl.guns(category),
      );
    } catch (_) {
      return Left<WarframeException, List<GunModel>?>(WarframeException());
    }
  }

  @override
  Either<WarframeException, List<MeleeWeaponModel>> melees() {
    try {
      return Right<WarframeException, List<MeleeWeaponModel>>(
        _weaponsRemoteDatasourceImpl.melee,
      );
    } catch (_) {
      return Left<WarframeException, List<MeleeWeaponModel>>(
        WarframeException(),
      );
    }
  }
}
