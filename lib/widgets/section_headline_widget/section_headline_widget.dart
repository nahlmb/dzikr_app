import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:flutter/material.dart';

class SectionHeadlineWidget extends StatelessWidget {
  const SectionHeadlineWidget(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SizeConfig.pagePaddingNum),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme(context).headline3,
          ),
          Text(subtitle),
          const SizedBox(
            height: SizeConfig.s4,
          ),
        ],
      ),
    );
  }
}
