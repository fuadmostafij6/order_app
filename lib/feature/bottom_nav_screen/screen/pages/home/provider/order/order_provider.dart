

import 'dart:math';
import 'package:create_order_app/feature/feature.dart';
import 'package:create_order_app/core/core.dart';
import 'package:get_it/get_it.dart';

class OrderProvider with ChangeNotifier {
  //OrderService _orderService = getIt<OrderService>();
  final OrderService _orderService = GetIt.instance<OrderService>();

  List<Order> _orders = [];
  List<Order> get orders => _orders;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<void> addRandomOrder() async {
    print("Working");
    await _orderService.addRandomOrder();

    await fetchOrders();
    notifyListeners(); // Notify UI to update
  }

  Future<void> fetchOrders() async {
    _isLoading = true;
    _orders = await _orderService.getAllOrders();
    _isLoading = false; // Set loadi
    notifyListeners(); // Update UI
  }
}
