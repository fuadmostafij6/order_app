
import 'package:create_order_app/core/core.dart';
import 'package:provider/provider.dart';
import 'package:create_order_app/feature/feature.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<OrderProvider>(
        builder: (context, order,_) {
          return AppButton.filledButton(load: false, text: "Generate Order", onPressed: (){
            order.addRandomOrder();
          });
        }
      ),

    );
  }
}
