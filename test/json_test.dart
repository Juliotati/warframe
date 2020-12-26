import 'package:flutter_test/flutter_test.dart';
import 'package:warframe/service/json_parsing.dart';

void main() {
  test('Parsing warframes names', () {
    const warframeString = '[ash,atlas,nyx,ember,nova]';

    expect(parseFrames(warframeString).first, 'ash');
  });

  test('Parses warframe.json', () {
    const warframeString =
        '{"uniqueName":"/Lotus/Powersuits/Ninja/Ninja","name":"Ash","description":"Ash is great for players looking for a stealthier approach to combat. Lethal abilities are complemented by powers of distraction.","health":150,}';

    expect(parsedFrame(warframeString).name, 'ash');
  });
}
