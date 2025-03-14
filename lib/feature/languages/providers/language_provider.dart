import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:create_order_app/feature/languages/services/language_services.dart';

class LanguageProvider extends ChangeNotifier {
  final GetIt locator = GetIt.instance;
  // Default locale is set to English (US)
  Locale _locale = const  Locale('en', 'US');

  Locale get locale => _locale;
  
  Future<void>updateLang()async{
    final langService = locator<LanguageService>();

    langService.saveLanguage("bn_BD");
    await loadLanguage();
  }
  

  Future<void> loadLanguage() async {
    try {
      final langService = locator<LanguageService>();
      final languageCode = await langService.getLanguage();

      // If a valid language code is retrieved, update the locale.
      if (languageCode != null && languageCode.isNotEmpty) {
        // Check if the language code includes a country code, e.g., "en_US".
        final parts = languageCode.split('_');
        if (parts.length > 1) {
          _locale = Locale(parts[0], parts[1]);
        } else {
          // If only language code is provided, you can set a default country if needed.
          _locale = Locale(languageCode, 'US');
        }
      }
    } catch (e) {
      // Log the error. The default locale will remain unchanged.
      debugPrint('Error loading language: $e');
    } finally {
      // Notify listeners whether or not an error occurred.
      notifyListeners();
    }
  }


}
