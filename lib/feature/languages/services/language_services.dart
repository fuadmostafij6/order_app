

import 'package:create_order_app/core/core.dart';
import 'package:create_order_app/feature/languages/model/language_model.dart';


class LanguageService {
  final IsarService _isarService;

  LanguageService(this._isarService);


  Future<void> saveLanguage(String code) async {
    final isar = await _isarService.db;
    await isar.writeTxn(() async {
      await isar.languageModels.put(LanguageModel(code: code)..id = 0);
    });
  }


  Future<String?> getLanguage() async {
    final isar = await _isarService.db;
    final language = await isar.languageModels.get(0);
    return language?.code;
  }


  Future<void> deleteLanguage() async {
    final isar = await _isarService.db;
    await isar.writeTxn(() async {
      await isar.languageModels.delete(0);
    });
  }
}
