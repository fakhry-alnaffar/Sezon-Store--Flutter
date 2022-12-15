import 'package:flutter/material.dart';

import '../../../core/helpers/text_style.dart';

class TitleAndViewAll extends StatelessWidget {
  const TitleAndViewAll({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyle.subTitle,
        ),
        const Spacer(),
        TextButton(
          style: AppTextStyle.textButtonStyle,
          onPressed: onPressed,
          child: Text(
            'view all',
            style: AppTextStyle.titleButton,
          ),
        ),
      ],
    );
  }
}
