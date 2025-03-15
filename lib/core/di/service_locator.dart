

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:create_order_app/core/db/isar_services.dart';

import 'package:create_order_app/core/network/network.dart';
import 'package:create_order_app/feature/languages/services/language_services.dart';

import 'package:create_order_app/feature/feature.dart';


final getIt = GetIt.instance;

Future<void> setupLocator() async {
  final baseUrl = dotenv.env["BASEURL"];
  if (baseUrl == null || baseUrl.isEmpty) {
    throw Exception("BASEURL is not defined in .env file");
  }
   getIt.registerSingletonAsync<IsarService>(
        () async => IsarService(),
  );

  // Ensure IsarService is ready before registering other services
  await getIt.allReady();
  getIt.registerLazySingleton(() => LanguageService(getIt<IsarService>()));
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(baseUrl: baseUrl));
  getIt.registerSingleton<OrderService>(OrderService(getIt<IsarService>()));
  getIt.registerSingleton<OrderProvider>(OrderProvider());

}
