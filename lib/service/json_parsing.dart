import 'dart:convert';
import 'package:warframe/modals/warframe.dart';

List<String> parseFrames(String frame){
  final parsed = jsonDecode(frame);
  final listOfStr = List<String>.from(parsed);
  return listOfStr;
}

Warframe parsedFrame(String frame) {
  // final parsed = jsonDecode(frame);
  throw UnimplementedError();
}
