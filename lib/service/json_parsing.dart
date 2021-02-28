import 'dart:convert';
import 'file:///C:/Users/user/Desktop/Development/Others/warframe/lib/modals/warframe.dart';

List<String> parseFrames(String frame){
  final parsed = jsonDecode(frame);
  final listOfStr = List<String>.from(parsed);
  return listOfStr;
}

Warframe parsedFrame(String frame) {
  // final parsed = jsonDecode(frame);
  throw UnimplementedError();
}
