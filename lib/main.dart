import 'package:bot_toast/bot_toast.dart';
import 'package:create_order_app/feature/bottom_nav_screen/screen/pages/home/provider/order/order_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:create_order_app/core/core.dart';
import 'package:create_order_app/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

import 'core/initializer/initializer.dart';


import 'feature/languages/providers/provider.dart';

void main() {
  Initializer.init(() async {



    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderList.providerList,
      child: ScreenUtilInit(
          designSize:  Size(context.screenWidth, context.screenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) {
      ScreenUtil.init(context);
          return Consumer<LanguageProvider>(
              builder: (context, languageProvider, child) {

                  // Set the locale based on the provider's locale value.

              return MaterialApp(

                title: Strings.appName,
                theme: ThemeConfig.lightTheme,
                darkTheme: ThemeConfig.darkTheme,
                themeMode: ThemeMode.light,
                locale: languageProvider.locale,
                builder: BotToastInit(),
                initialRoute: AppPages.INITIAL,
                onGenerateRoute: AppPages.generateRoute,


                navigatorObservers: [BotToastNavigatorObserver()],
                supportedLocales: const [
                  Locale('en', 'US'), // English (United States)
                  Locale('bn', 'BD'), // Bangla (Bangladesh)
                ],
                localizationsDelegates:  [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  AppLocalizations.delegate, // Generated localization class
                ],

              );
            }
          );
        }
      ),
    );
  }
}


