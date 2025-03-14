

import 'dart:math';
import 'package:isar/isar.dart';
import 'package:create_order_app/core/core.dart';
import 'package:create_order_app/feature/feature.dart';

class OrderService {
  final IsarService _isarService;

  OrderService(this._isarService); // Inject IsarService

  Future<void> addRandomOrder() async {
    final random = Random();
    final names = ['John Doe', 'Jane Smith', 'Alice Brown', 'Bob Johnson'];
    final orderItems = ['Pizza', 'Burger', 'Sushi', 'Pasta'];

    // Generate a random number of items (minimum 5, maximum 10)
    final minItems = 5;
    final maxItems = 10;
    final numItems = random.nextInt(maxItems - minItems + 1) + minItems;

    // Create a list of random items
    List<Item> items = List.generate(numItems, (_) {
      final item = Item()
        ..itemName = orderItems[random.nextInt(orderItems.length)]
        ..itemAmount = (random.nextDouble() * 20).roundToDouble();
      return item;
    });

    // Calculate totalAmount as the sum of all item amounts
    double totalAmount = items.fold(0, (sum, item) => sum + item.itemAmount);

    final order = Order()
      ..customerName = names[random.nextInt(names.length)]
      ..phone = '0123456789'
      ..orderDetails = items
      ..totalAmount = totalAmount
      ..estDeliveryTime = DateTime.now().add(Duration(minutes: random.nextInt(60) + 10))
      ..type = OrderType.none;

    final isar = await _isarService.db;

    await isar.writeTxn(() async {
      await isar.orders.put(order);
    });
    await AlarmService.startAlarmNotification(order.id);
  }



  Future<List<Order>> getAllOrders() async {
    final isar = await _isarService.db;
    return await isar.orders.where().findAll();
  }
}
