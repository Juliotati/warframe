import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/features/warframe_codex/data/models/warframe_model.dart';
import 'package:warframe/features/warframe_codex/data/models/weapon_model.dart';

abstract class WarframeRepository {
  Future<Either<WarframeException, List<WarframeModel>>> getWarframes();
  Future<Either<WarframeException, WarframeModel>> getWarframe(String name);
  Future<Either<WarframeException, List<WeaponModel>>> getWeapons();
}
