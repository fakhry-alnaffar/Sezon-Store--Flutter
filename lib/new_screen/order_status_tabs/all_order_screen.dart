import 'package:camel_express_user/widget/my_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllOrderScreen extends StatefulWidget {
  const AllOrderScreen({Key? key}) : super(key: key);

  @override
  State<AllOrderScreen> createState() => _AllOrderScreenState();
}

class _AllOrderScreenState extends State<AllOrderScreen> {
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
        return MyOrderItem(
          orderNum: 00098,
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
