import 'package:isar/isar.dart';

import '../../enum/order/type.dart';

part 'order_model.g.dart';



@Embedded()
class Item {
  late String itemName;
  late double itemAmount;
}

@Collection()
class Order {
  Id id = Isar.autoIncrement;
  late String customerName;
  late String phone;
  late List<Item> orderDetails;
  late double totalAmount;
  late DateTime estDeliveryTime;
  late bool isAcknowledged = false;

  @Enumerated(EnumType.name)
  late OrderType type;
}
