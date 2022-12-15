import 'package:camel_express_user/core/helpers/app_colors.dart';
import 'package:camel_express_user/core/widget/custom_appbar.dart';
import 'package:camel_express_user/widget/support_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: const Text(
          'Help and support ',
        ),
        notification: '5',
        backgroundColor: AppColors.white,
        onFavPressed: () {},
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 25.h,
        ),
        itemCount: 10,
        padding: EdgeInsetsDirectional.only(
          start: 20.w,
          end: 20.w,
          bottom: 50.h,
        ),
        itemBuilder: (context, index) {
          return const SupportItem(
            question: 'How Can I Take Advantage Of Discount Codes?',
            answer:
                'This text is an example of a text that can be replaced in the same space. This text was generated from the Arabic text generator, where you can generate such text or many other texts in addition to increasing the number of characters generated by the application. If you need a larger number of paragraphs, the Arabic text generator allows you to increase the number of paragraphs as you want, the text will not appear divided and does not contain language errors, the Arabic text generator is useful for designers',
          );
        },
      ),
    );
  }
}
