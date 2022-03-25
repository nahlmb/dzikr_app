import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/widgets/minus_divider_widget/minus_divider_widget.dart';
import 'package:flutter/material.dart';

class PageStandartDividerWidget extends StatelessWidget {
  const PageStandartDividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: SizeConfig.s22,
        ),
        MinusDividerWidget(
            left: SizeConfig.pagePaddingNum, right: SizeConfig.pagePaddingNum),
        SizedBox(
          height: SizeConfig.s22,
        ),
      ],
    );
  }
}
