

import 'package:create_order_app/core/core.dart';
import 'package:create_order_app/feature/feature.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'widget/order_list.dart';



class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Orders"), automaticallyImplyLeading: false,),

      body: Consumer<OrderProvider>(
        builder: (context, orderProvider, child) {
          if (orderProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (orderProvider.orders.isEmpty) {
            return Center(child: Text("No orders available"));
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTab(context,OrderType.incoming.name,0, orderProvider.orders.where((o) => o.type == OrderType.incoming).toList().length, orderProvider),
                    _buildTab(context,OrderType.outgoing.name, 1, orderProvider.orders.where((o) => o.type == OrderType.outgoing).toList().length,orderProvider),
                    _buildTab(context,OrderType.ready.name, 2, orderProvider.orders.where((o) => o.type == OrderType.ready).toList().length,orderProvider),
                  ],
                ),
              ),
              12.verticalSpace,
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    orderProvider.setSelectedIndex(index);
                  },
                  children: [
                  OrderList(orders: orderProvider.orders.where((o) => o.type == OrderType.incoming).toList()),
                  OrderList(orders: orderProvider.orders.where((o) => o.type == OrderType.outgoing).toList()),
                  OrderList(orders: orderProvider.orders.where((o) => o.type == OrderType.ready).toList()),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTab(BuildContext context, String text, int index, int totalOrder, OrderProvider orderProvider) {
    bool isActive = orderProvider.selectedIndex == index;

    return GestureDetector(
      onTap: () {
        orderProvider.setSelectedIndex(index);
        _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      },
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.orange : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            AppTexts.text(text: text, color: isActive ? AppColors.white : AppColors.gray900, fontSize: Dimensions.bodyLargeSize),
            SizedBox(width: 8),
            AppTexts.text(
              text: totalOrder.toString(),
              color: isActive ? AppColors.white : AppColors.gray900,
              fontWeight: isActive ? FontWeight.w700 : null,
              fontSize: Dimensions.bodyLargeSize,
            ),
          ],
        ),
      ),
    );
  }
}
