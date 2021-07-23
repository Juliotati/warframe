import 'package:warframe/export/warframe_ui.dart';

abstract class ModsRemoteDatasource {
  /// Gets all Prime and non-prime mods from the official warframe API on app launch
  /// Rethrows an [Error] if something goes wrong
  Future<void> getRemoteMods();
}

class ModsNetwork extends ModsRemoteDatasource with ChangeNotifier {
  @override
  Future<void> getRemoteMods() {
    // TODO: implement getRemoteMods
    throw UnimplementedError();
  }
}
