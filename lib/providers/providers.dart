

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:create_order_app/feature/feature.dart';

class ProviderList {
  ProviderList._();

  static List<SingleChildWidget> providerList=<SingleChildWidget>[
    ChangeNotifierProvider(create: (_) => LanguageProvider()),
    ChangeNotifierProvider(create: (_) => BottomProvider()),
    ChangeNotifierProvider(create: (_) => OrderProvider()),

  ];
}