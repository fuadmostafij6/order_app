
import 'package:create_order_app/core/core.dart';
import 'package:create_order_app/feature/feature.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OrderItem extends StatelessWidget {
  final Order order;
  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.gray100, width: 1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(

                children: [

                  Container(
                    padding: REdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                        color: AppColors.gray100,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: AppTexts.text(text: "#${order.id}", fontSize: Dimensions.bodySmallSize,color: AppColors.gray500 ),

                  ),
                  10.horizontalSpace,
                  AppTexts.text(text: order.customerName, fontSize: Dimensions.bodyLargeSize, fontWeight: FontWeight.w700)
                ],
              ),
              8.verticalSpace,

              AppTexts.text(text: "${order.phone}", fontSize: Dimensions.labelLargeSize,color: AppColors.gray500 ),

            ],
          ),

          Row(
            children: [
              Container(
                padding: REdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: AppTexts.text(text: "13:45", fontSize: Dimensions.bodySmallSize,color: AppColors.primary ),

              ),
              10.horizontalSpace,
              CircularPercentIndicator(radius: 20,
                circularStrokeCap: CircularStrokeCap.round,
                percent: 0.5,
                lineWidth: 4,
                progressColor: AppColors.success600,
                center:AppTexts.text(text: "5", fontSize: Dimensions.bodyMediumSize,fontWeight: FontWeight.w700,color: AppColors.primary ),)
            ],
          )


        ],
      ),
    );
  }
}
