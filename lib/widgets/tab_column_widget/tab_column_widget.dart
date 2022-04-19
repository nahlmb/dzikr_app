import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/widgets/minus_divider_widget/minus_divider_widget.dart';
import 'package:flutter/material.dart';

class TabBarColumnWidget extends StatelessWidget {
  const TabBarColumnWidget(
      {Key? key,
      required this.tabs,
      required this.views,
      this.isUseBottomDivider = true})
      : super(key: key);

  final List<Widget> tabs;
  final List<Widget> views;
  final bool isUseBottomDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(SizeConfig.s10),
          child: Container(
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.all(SizeConfig.s4),
            height: 42,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.05)),
            child: TabBar(
                enableFeedback: true,
                isScrollable: false,
                labelColor: Theme.of(context).colorScheme.onPrimary,
                unselectedLabelColor:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.bold),
                unselectedLabelStyle: Theme.of(context).textTheme.bodyText1,
                indicator: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(100),
                ),
                tabs: tabs),
          ),
        ),
        isUseBottomDivider
            ? const MinusDividerWidget(
                left: SizeConfig.pagePaddingNum,
                right: SizeConfig.pagePaddingNum)
            : const SizedBox(),
        Expanded(child: TabBarView(children: views))
      ],
    );
  }
}
