


import 'package:create_order_app/core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:create_order_app/feature/feature.dart';

import 'order_item.dart';
class OrderList extends StatelessWidget {
  final List<Order> orders;
  const OrderList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return Center(child: Text("No orders in this category"));
    }
    return ListView.separated(
      padding: REdgeInsets.symmetric(horizontal: 16),
      itemCount: orders.length,
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final order = orders[index];
        return OrderItem(order: order,);
      }, separatorBuilder: (BuildContext context, int index)=>8.verticalSpace,
    );
  }
}
