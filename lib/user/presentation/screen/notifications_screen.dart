import 'package:camel_express_user/user/data/data_source/remote_data_source.dart';
import 'package:camel_express_user/user/data/entity/notification.dart';
import 'package:flutter/material.dart' as material;
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/helpers/app_colors.dart';
import '../widget/notification_item.dart';

class NotificationScreen extends material.StatefulWidget {
  const NotificationScreen({material.Key? key}) : super(key: key);

  @override
  material.State<NotificationScreen> createState() =>
      _NotificationScreenState();
}

class _NotificationScreenState extends material.State<NotificationScreen> {
  @override
  material.Widget build(material.BuildContext context) {
    return material.Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: material.AppBar(
        title: const material.Text(
          'Notification',
        ),
        toolbarHeight: 110.h,
        backgroundColor: AppColors.lightGrey,
      ),
      body: material.FutureBuilder<List<Notification>>(
        future: Get.find<UserRemoteDataSourceImp>().getNotifications(),
        builder: (context, snapshot){
          if (snapshot.connectionState == material.ConnectionState.waiting) {
            return const material.Center(
              child: material.CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else {
            if(snapshot.data!.isNotEmpty){
              return material.ConstrainedBox(
                constraints: material.BoxConstraints(
                  maxWidth: double.infinity.w,
                ),
                child: material.ListView.builder(
                  padding: material.EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  itemCount: snapshot.data!.length,
                  scrollDirection: material.Axis.vertical,
                  itemBuilder: (context, index) {
                    var item  = snapshot.data!.elementAt(index);
                    return NotificationItem(
                      image: 'user',
                      name: item.title,
                      title: item.body,
                      code: 'NN11',
                      time: timeago.format(DateTime.parse(item.createdAt)),
                      date: DateFormat("d MMM").format(DateTime.parse(item.createdAt)),
                    );
                  },
                ),
              );
            }else{
              return const material.Center(
                child: material.CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            }
          }
        },
      ),
    );
  }
}
