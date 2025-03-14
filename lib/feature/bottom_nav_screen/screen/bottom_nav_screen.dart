

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:create_order_app/core/core.dart';
import 'package:create_order_app/feature/bottom_nav_screen/provider/bottom_provider.dart';
import 'package:create_order_app/feature/feature.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> with TickerProviderStateMixin {



  final _pages = <Widget>[
    Home(),
    Home(),
    Home(),

  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Consumer<BottomProvider>(
         builder: (context, provider,_) {
         return _pages.elementAt(provider.currentIndex);
       }
     ),
      bottomNavigationBar: Consumer<BottomProvider>(
        builder: (context, provider,_) {
          return NavigationBar(
              selectedIndex: provider.currentIndex,


              onDestinationSelected: (int index) {
               provider.updateCurrentIndex(index);
                // setState(() {
                //   selected = index;
                // });
              },
              indicatorColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              shadowColor: AppColors.gray100,
              height: 64.h,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              backgroundColor: AppColors.white,
              elevation: 1,

              // overlayColor: WidgetStateProperty.resolveWith((states) {
              //   // Set background color based on the button state
              //   if (states.contains(WidgetState.pressed)) {
              //     return AppColors.white;
              //   } else if (states.contains(WidgetState.disabled)) {
              //     return AppColors.white;
              //   }
              //   return AppColors.white;
              // }
              // ),



              destinations:  const [
                NavigationDestination(icon: Icon(PhosphorIconsRegular.house),selectedIcon:Icon(PhosphorIconsFill.house) , label: 'Home',),
                NavigationDestination(icon: Icon(PhosphorIconsRegular.list),selectedIcon:Icon(PhosphorIconsFill.list), label: 'Order',),
                //NavigationDestination(icon: Icon(PhosphorIconsRegular.graduationCap), selectedIcon:Icon(PhosphorIconsFill.graduationCap),label: 'Practices',),
                NavigationDestination(icon: Icon(PhosphorIconsRegular.user),selectedIcon:Icon(PhosphorIconsFill.user), label: 'Account',),



              ]);
        }
      ),
    );
  }
}