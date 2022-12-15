import 'package:camel_express_user/widget/my_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveredOrderScreen extends StatefulWidget {
  const DeliveredOrderScreen({Key? key}) : super(key: key);

  @override
  State<DeliveredOrderScreen> createState() => _DeliveredOrderScreenState();
}

class _DeliveredOrderScreenState extends State<DeliveredOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 20.h,
        );
      },
      itemCount: 10,
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return MyOrderItem(orderNum: 00098,
            date: '6-9-2022',
            time: '09:15 AM',
            total: 150,
            paymentMethod: 'card',
            productImage: 'product',
            itemNum: 3,
            orderStatus: 'Delivered',
            colorStatus: const Color(0xFF3ED952),
            onPressed: () {},
        );
      },
    );
  }
}
