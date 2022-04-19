import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:dzikr_app/widgets/appbar_widget/appbar_widget.dart';
import 'package:dzikr_app/widgets/list_tile_widget/list_tile_widget.dart';
import 'package:dzikr_app/widgets/section_headline_widget/section_headline_widget.dart';
import 'package:dzikr_app/widgets/tab_column_widget/tab_column_widget.dart';
import 'package:flutter/material.dart';

class DzikrPage extends StatelessWidget {
  const DzikrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget.getAppbar(context, title: "Du'a & Dzikr"),
        body: DefaultTabController(
            length: 2,
            child: TabBarColumnWidget(
              tabs: const [
                Tab(
                  child: Text('Dzikr'),
                ),
                Tab(
                  child: Text("Du'a"),
                ),
              ],
              views: [getDzikrSection(context), getDuaSection(context)],
              isUseBottomDivider: true,
            )));
  }

  Widget getDuaSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeadlineWidget(
            title: "Kumpulan Doa", subtitle: "Dari sumber sumber yang shahih"),
        Container(
          decoration: BoxDecoration(color: colorSchame(context).surface),
          child: ListView(
            padding: SizeConfig.pageHorizontalPadding,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              ListTileWidget(onClick: () {}),
              ListTileWidget(onClick: () {})
            ],
          ),
        ),
      ],
    );
  }

  Widget getDzikrSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeadlineWidget(
            title: "Kumpulan Dzikr",
            subtitle: "Dari sumber sumber yang shahih"),
        Container(
          decoration: BoxDecoration(color: colorSchame(context).surface),
          child: ListView(
            padding: SizeConfig.pageHorizontalPadding,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              ListTileWidget(onClick: () {}),
              ListTileWidget(onClick: () {})
            ],
          ),
        ),
      ],
    );
  }
}
