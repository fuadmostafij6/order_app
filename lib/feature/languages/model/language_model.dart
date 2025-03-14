

import 'package:isar/isar.dart';

part 'language_model.g.dart';

@Collection()
class LanguageModel {
  Id id = 0;

  late String code;

  LanguageModel({required this.code});
}