
import 'package:create_order_app/core/core.dart';
class BottomProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  updateCurrentIndex(int value){
    _currentIndex = value;
    notifyListeners();
  }

}