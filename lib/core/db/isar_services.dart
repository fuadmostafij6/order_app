

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:create_order_app/feature/languages/model/language_model.dart';
import 'package:create_order_app/feature/feature.dart';

class IsarService {
  late final Future<Isar> db;

  // Immediately initialize Isar when the app starts
  IsarService._internal() {
    db = _initIsar();
  }

  static final IsarService _instance = IsarService._internal();

  factory IsarService() => _instance;

  // Initialize Isar
  Future<Isar> _initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [LanguageModelSchema,OrderSchema], // Ensure only required schemas are included
      directory: dir.path,
    );
  }

  // Close Isar on exit
  Future<void> closeIsar() async {
    final isar = await db;
    await isar.close();
  }
}
