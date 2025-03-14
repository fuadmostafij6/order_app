
import 'package:flutter/material.dart';
import 'package:create_order_app/core/core.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
Future.delayed(Duration(seconds: 3), () {
  Navigator.pushNamed(context, AppRoutes.BOTTOM_NAV);

    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
         Center(child: AppTexts.text(text: context.localization.app_name))
          
        ],
      ),
    );
  }
}
